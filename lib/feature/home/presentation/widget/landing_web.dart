// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class LandingWeb extends StatefulWidget {
  const LandingWeb({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  _LandingWebState createState() => _LandingWebState();
}

class _LandingWebState extends State<LandingWeb> {
  late InAppWebViewController _controllerWebViewCheckout;
  late ValueNotifier<bool> _isChargingPageNotifier;

  @override
  void initState() {
    super.initState();
    _isChargingPageNotifier = ValueNotifier(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.2,
            child: Stack(
              children: [
                SafeArea(
                  child: InAppWebView(
                    onLoadStart: (_, Uri? uri) async {},
                    onLoadStop: (_, Uri? uri) {
                      _isChargingPageNotifier.value = false;
                    },
                    onWebViewCreated: (controller) async {
                      _controllerWebViewCheckout = controller;
                      final String url = widget.url;
                      _controllerWebViewCheckout.loadUrl(
                        urlRequest: URLRequest(url: Uri.parse(url)),
                      );
                    },
                  ),
                ),
                ValueListenableBuilder(
                    valueListenable: _isChargingPageNotifier,
                    builder: (_, isChargingPage, Widget? w) {
                      return isChargingPage
                          ? Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : const SizedBox();
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
