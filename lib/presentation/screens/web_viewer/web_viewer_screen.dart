


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewerScreen extends ConsumerStatefulWidget {
  final String url;
  final String title;

  const WebViewerScreen( {super.key, required this.url, required this.title,});

  @override
  WebViewerScreenState createState() => WebViewerScreenState();
}

class WebViewerScreenState extends ConsumerState<WebViewerScreen> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..loadRequest(Uri.parse('https://${widget.url}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WebViewWidget(controller: controller,)
    );
  }
}