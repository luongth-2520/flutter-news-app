import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/widgets/app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetail extends StatelessWidget {
  final String postUrl;

  const ArticleDetail({Key? key, required this.postUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _completer = Completer<WebViewController>();
    return Scaffold(
      appBar: appBar(
        () => Navigator.of(context).pop(),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: postUrl,
          onWebViewCreated: (webController) =>
              _completer.complete(webController),
        ),
      ),
    );
  }
}
