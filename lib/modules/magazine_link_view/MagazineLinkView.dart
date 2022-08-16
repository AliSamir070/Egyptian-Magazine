import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MagazineLinkView extends StatelessWidget {
  static String route = "Magazine_link_view_layout_screen";
  @override
  Widget build(BuildContext context) {
    var url = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'News App'
        ),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
