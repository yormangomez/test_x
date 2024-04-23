import 'dart:convert';

import 'package:test_x/core/errors/exceptions.dart';
import 'package:test_x/core/services/center_api.dart';
import 'package:test_x/feature/home/data/datasources/cat_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:test_x/feature/home/data/model/cat_image_model.dart';
import 'package:test_x/feature/home/data/model/cat_model.dart';

class CatDataSourceImpl extends CatDataSource {
  final CenterApi centerApi;

  CatDataSourceImpl({required this.centerApi});

  @override
  Future<List<CatModel>> getCat() async {
    try {
      final url = Uri.parse('https://api.thecatapi.com/v1/breeds');
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "x-api-key":
              "live_JBT0Ah0Nt12iyl2IpjQVLDWjcLk0GQwf4zI9wBMfmfejKmcC31mOJp4yJz5TsOUP"
        },
      );

      if (response.statusCode == 200) {
        final d = jsonDecode(response.body);
        print(d);
        final data = (jsonDecode(response.body) as List)
            .map((e) => CatModel.fromJson(e))
            .toList();

        return data;
      }
      if (response.statusCode == 401) {
        return [];
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }

  @override
  Future<List<CatImageModel>> getCatImage({required String id}) async {
    try {
      final url = Uri.parse(
          'https://api.thecatapi.com/v1/images/search?limit=10&breed_ids=$id&api_key=live_JBT0Ah0Nt12iyl2IpjQVLDWjcLk0GQwf4zI9wBMfmfejKmcC31mOJp4yJz5TsOUP)');
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "x-api-key":
              "live_JBT0Ah0Nt12iyl2IpjQVLDWjcLk0GQwf4zI9wBMfmfejKmcC31mOJp4yJz5TsOUP"
        },
      );

      if (response.statusCode == 200) {
        final data = (jsonDecode(response.body) as List)
            .map((e) => CatImageModel.fromJson(e))
            .toList();

        return data;
      }
      if (response.statusCode == 401) {
        return [];
      } else {
        throw GeneralException("Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}
