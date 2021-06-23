import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// 가장 먼저 스마게 채용 페이치가 나온다.
class HtmlLoader extends StatefulWidget {
  @override
  HtmlLoaderState createState() {
     print("wtf");
     return HtmlLoaderState();
  }

  static HtmlLoaderState? of(BuildContext context) {
      return context.findAncestorStateOfType<HtmlLoaderState>();
  }
}

class HtmlLoaderState extends State<HtmlLoader> {
  WebViewController? _controller;
  String? html;

  @override
  Widget build(BuildContext context) {
      print("generated html loader");
      return WebView(
        initialUrl: "https://careers.smilegate.com/ko/recruit/recruit_list.asp",
        onWebViewCreated: (controller) {
          _controller = controller;
        },
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
        onPageFinished: (_) {
          readHTML();
        }
      );
  }

  void readHTML() async {
    print("read data");
    html = await _controller!.evaluateJavascript("window.document.getElementsByTagName('html')[0].outerHTML;"); 
  }

  void openCrawlingPage(String newUrl) {
    _controller!.loadUrl(newUrl);
    setState(() {
      html = null;
    });
  }

  void inputJavascirpt(String scriptName) {
    _controller!.evaluateJavascript(scriptName);
    setState(() {
      html = null;
    });
  }
}
      
    

 