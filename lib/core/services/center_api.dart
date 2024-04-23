import 'dart:convert';
import 'dart:io';

import 'package:chuck_interceptor/chuck.dart';
import 'package:test_x/core/helper/utils_helper.dart';
import 'package:test_x/core/models/error_response.dart';
import 'package:test_x/core/models/refresh_model.dart';
import 'package:test_x/core/models/server_response.dart';
import 'package:test_x/core/services/login_store.dart';
import 'package:test_x/core/util/constants.dart';
import 'package:test_x/core/util/server.dart';
import 'package:test_x/flavor.dart';
import 'package:test_x/injection/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class CenterApi {
  Map<String, String> get _headers {
    String token = LoginStore.instance.accessToken;
    if (token.isEmpty) {
      return {
        "Content-Type": "application/json",
      };
    } else {
      return {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: token
      };
    }
  }

  Future<ServerResponse> get(
      {required String urlSpecific, bool useNewErrorHandler = false}) async {
    try {
      final response =
          await http.get(Uri.parse(urlSpecific), headers: _headers);
      if (Flavor.instance.showChuck == true) {
        sl<Chuck>().onHttpResponse(response);
      }
      final dataDecode = response.body != ""
          ? AppUtils.instance.getDataDecode(response.bodyBytes)
          : [];
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return ServerResponse(
          isSuccess: true,
          message: AppConstant.successfulGet,
          result: dataDecode,
          statusCode: response.statusCode,
        );
      } else if (response.statusCode == 401) {
        bool retryCall = await refreshToken();
        if (retryCall) {
          return get(urlSpecific: urlSpecific);
        } else {
          return ServerResponse(
            isSuccess: false,
            message: AppConstant.tokenExpiredMessage,
            result: [],
            statusCode: response.statusCode,
          );
        }
      } else {
        return ServerResponse(
          isSuccess: false,
          message: useNewErrorHandler
              ? formatNewError(dataDecode)
              : formatError(dataDecode),
          result: [],
          statusCode: response.statusCode,
        );
      }
    } catch (error) {
      return ServerResponse(
        isSuccess: false,
        message: AppConstant.connectionError,
        result: [],
        statusCode: -99,
      );
    }
  }

  Future<ServerResponse> post(
      {required Map<String, dynamic> data,
      required String urlSpecific,
      bool activateRefresh = true,
      bool useNewErrorHandler = false}) async {
    try {
      String dataParse = data.isNotEmpty ? json.encode(data) : "";
      final response = await http.post(
        Uri.parse(urlSpecific),
        headers: _headers,
        body: dataParse,
      );
      if (Flavor.instance.showChuck == true) {
        sl<Chuck>().onHttpResponse(response);
      }
      final dataDecode = AppUtils.instance.getDataDecode(response.bodyBytes);
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return ServerResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          message: AppConstant.successfulPost,
          result: dataDecode,
        );
      } else if (response.statusCode == 401) {
        if (activateRefresh) {
          bool retryCall = await refreshToken();
          if (retryCall) {
            return post(data: data, urlSpecific: urlSpecific);
          } else {
            return ServerResponse(
              statusCode: response.statusCode,
              isSuccess: false,
              message: AppConstant.tokenExpiredMessage,
              result: [],
            );
          }
        } else {
          return ServerResponse(
            statusCode: response.statusCode,
            isSuccess: false,
            message: AppConstant.tokenExpiredMessage,
            result: [],
          );
        }
      } else {
        return ServerResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          message: useNewErrorHandler
              ? formatNewError(dataDecode)
              : formatError(dataDecode),
          result: [],
        );
      }
    } catch (error) {
      return ServerResponse(
        statusCode: 500,
        isSuccess: false,
        message: AppConstant.connectionError,
        result: [],
      );
    }
  }

  Future<ServerResponse> update({
    required Map<String, dynamic> data,
    required String urlSpecific,
  }) async {
    try {
      String dataParse = json.encode(data);
      final response = await http.patch(
        Uri.parse(urlSpecific),
        headers: _headers,
        body: dataParse,
      );
      if (Flavor.instance.showChuck == true) {
        sl<Chuck>().onHttpResponse(response);
      }
      final dataDecode = AppUtils.instance.getDataDecode(response.bodyBytes);
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return ServerResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          message: AppConstant.successfulPatch,
          result: dataDecode,
        );
      } else if (response.statusCode == 401) {
        bool retryCall = await refreshToken();
        if (retryCall) {
          return update(data: data, urlSpecific: urlSpecific);
        } else {
          return ServerResponse(
            statusCode: response.statusCode,
            isSuccess: false,
            message: AppConstant.tokenExpiredMessage,
            result: [],
          );
        }
      } else {
        return ServerResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          message: formatError(dataDecode),
          result: [],
        );
      }
    } catch (e) {
      return ServerResponse(
        statusCode: 500,
        isSuccess: false,
        message: AppConstant.connectionError,
        result: [],
      );
    }
  }

  Future<ServerResponse> postMultipart({
    required Map<String, dynamic> data,
    required String urlSpecific,
    required String fileField,
    required String filePath,
    String? subFileName,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(urlSpecific));
      request.headers.addAll(_headers);
      request.files.add(await http.MultipartFile.fromPath(fileField, filePath));
      for (var e in data.entries) {
        if (e.value != null) {
          request.fields[e.key] = e.value.toString();
        }
      }

      if (subFileName != null) {
        for (var e in data[subFileName].entries) {
          if (e.value != null) {
            request.fields['$subFileName.${e.key}'] = e.value.toString();
          }
        }
      }

      final streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (Flavor.instance.showChuck == true) {
        sl<Chuck>().onHttpResponse(response);
      }
      final dataDecode = AppUtils.instance.getDataDecode(response.bodyBytes);
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return ServerResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          message: AppConstant.successfulPatch,
          result: dataDecode,
        );
      } else if (response.statusCode == 401) {
        bool retryCall = await refreshToken();
        if (retryCall) {
          return postMultipart(
              data: data,
              urlSpecific: urlSpecific,
              fileField: fileField,
              filePath: filePath);
        } else {
          return ServerResponse(
            statusCode: response.statusCode,
            isSuccess: false,
            message: AppConstant.tokenExpiredMessage,
            result: [],
          );
        }
      } else {
        return ServerResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          message: formatError(dataDecode),
          result: [],
        );
      }
    } catch (e) {
      return ServerResponse(
        statusCode: 500,
        isSuccess: false,
        message: AppConstant.connectionError,
        result: [],
      );
    }
  }

  Future<ServerResponse> updateMultipart({
    required Map<String, dynamic> data,
    required String urlSpecific,
    required String fileField,
    required String filePath,
  }) async {
    try {
      var request = http.MultipartRequest('PATCH', Uri.parse(urlSpecific));
      request.headers.addAll(_headers);
      request.files.add(await http.MultipartFile.fromPath(fileField, filePath));
      for (var e in data.entries) {
        if (e.value != null) {
          request.fields[e.key] = e.value.toString();
        }
      }
      final streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (Flavor.instance.showChuck == true) {
        sl<Chuck>().onHttpResponse(response);
      }
      final dataDecode = AppUtils.instance.getDataDecode(response.bodyBytes);
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        return ServerResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          message: AppConstant.successfulPatch,
          result: dataDecode,
        );
      } else if (response.statusCode == 401) {
        bool retryCall = await refreshToken();
        if (retryCall) {
          return updateMultipart(
              data: data,
              urlSpecific: urlSpecific,
              fileField: fileField,
              filePath: filePath);
        } else {
          return ServerResponse(
            statusCode: response.statusCode,
            isSuccess: false,
            message: AppConstant.tokenExpiredMessage,
            result: [],
          );
        }
      } else {
        return ServerResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          message: formatError(dataDecode),
          result: [],
        );
      }
    } catch (e) {
      return ServerResponse(
        statusCode: 500,
        isSuccess: false,
        message: AppConstant.connectionError,
        result: [],
      );
    }
  }

  Future delete({
    required Map<String, dynamic> data,
    required String urlSpecific,
  }) async {
    try {
      final response =
          await http.delete(Uri.parse(urlSpecific), headers: _headers);
      if (Flavor.instance.showChuck == true) {
        sl<Chuck>().onHttpResponse(response);
      }
      if (response.statusCode >= 200 && response.statusCode <= 203) {
        final dataDecode = AppUtils.instance.getDataDecode(response.bodyBytes);
        return ServerResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          message: AppConstant.successfulDelete,
          result: dataDecode,
        );
      } else if (response.statusCode == 204) {
        // No content
        return ServerResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          message: AppConstant.successfulDelete,
          result: AppConstant.noContent,
        );
      } else if (response.statusCode == 401) {
        bool retryCall = await refreshToken();
        if (retryCall) {
          return delete(data: data, urlSpecific: urlSpecific);
        } else {
          return ServerResponse(
            statusCode: response.statusCode,
            isSuccess: false,
            message: AppConstant.tokenExpiredMessage,
            result: [],
          );
        }
      } else {
        final dataDecode = AppUtils.instance.getDataDecode(response.bodyBytes);
        return ServerResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          message: formatError(dataDecode),
          result: [],
        );
      }
    } catch (e) {
      return ServerResponse(
        statusCode: 500,
        isSuccess: false,
        message: AppConstant.connectionError,
        result: [],
      );
    }
  }

  // UTILS
  Future<bool> refreshToken() async {
    String refreshToken = LoginStore.instance.refreshToken;
    var request = {"refresh": refreshToken};
    final response = await post(
        urlSpecific: Server.refreshToken,
        data: request,
        activateRefresh: false);
    if (response.isSuccess!) {
      final body = response.result;
      final data = RefreshModel.fromJson(body);
      LoginStore.instance.setAccessToken(data.access);
      LoginStore.instance.setRefreshToken(data.refresh);
      return true;
    } else {
      return false;
    }
  }

  String formatError(dynamic error) {
    if (error is List) {
      String errorMessage = "";
      for (var e in error) {
        if (e is String) {
          errorMessage += "$e\n";
        }
      }
      return errorMessage;
    } else if (error is Map) {
      if (error.containsKey("detail")) return error["detail"]!;

      String errorMessage = "";

      for (var element in error.values) {
        if (element is List) {
          for (final msg in cast<List>(element)) {
            errorMessage += "$msg\n";
          }
        } else if (element is String) {
          errorMessage += "$element\n";
        }
      }
      return errorMessage;
    }
    return AppConstant.error;
  }

  String formatNewError(dynamic error) {
    ErrorResponse errorResponse = ErrorResponse.fromJson(error);
    return errorResponse.detail;
  }
}
