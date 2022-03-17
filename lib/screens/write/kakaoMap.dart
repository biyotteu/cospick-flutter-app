import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KakaoMap extends StatefulWidget {
  const KakaoMap({Key? key}) : super(key: key);

  @override
  State<KakaoMap> createState() => _KakaoMapState();
}

class _KakaoMapState extends State<KakaoMap> {

  String url = "";  // 띄울 웹 페이지의 주소
  Set<JavascriptChannel>? channel; // 아래 설명 참조
  WebViewController? controller;   // 아래 설명 참조

  @override
  Widget build(BuildContext context) {
    return WebView(
        initialUrl: url,
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
        javascriptChannels: channel,
        javascriptMode: JavascriptMode.unrestricted // 자바스크립트 허용
    );
  }
}
