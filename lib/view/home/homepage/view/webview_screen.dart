// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPreview extends StatefulWidget {
  final String url;
  const WebviewPreview({Key? key, required this.url}) : super(key: key);

  @override
  State<WebviewPreview> createState() => _WebviewPreviewState();
}

class _WebviewPreviewState extends State<WebviewPreview> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Allertji App'),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (String url) {
          _controller.evaluateJavascript('''
            var kelimeListesi = ["cream", "beans", "tomatoes"];
            var metinElementi = document.body;
            kelimeListesi.forEach(function(kelime) {
                var metin = metinElementi.innerHTML;
                var yenilenmisMetin = metin.replace(new RegExp(kelime, "gi"), "<span style='background-color:red'>" + kelime + "</span>");
                metinElementi.innerHTML = yenilenmisMetin;
            });
          ''');
        },
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
      ),
    );
  }
}
