import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:web_scraper/web_scraper.dart';

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  WebViewController? _controller;
  WebScraper scraper = new WebScraper();
  WebView? _webView;
  //String url = "https://careers.ncsoft.com/apply/list";
  String url = "https://careers.smilegate.com/ko/recruit/recruit_list.asp";
  @override
  Widget build(BuildContext context) {
      return WebView(
        initialUrl: url,
        onWebViewCreated: (controller) {
          _controller = controller;
        },
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
        onPageFinished: (_) {
          readJS();
    });
  }

   void readJS() async{
      String html = await _controller!.evaluateJavascript("window.document.getElementsByTagName('html')[0].outerHTML;"); 
      scraper.loadFromString(html);

      //var data = scraper.getElement("#RecruitTbl > tbody > tr:nth-child(6) > td.alignLeft > a", []);
      //print(data);
      //_controller!.evaluateJavascript("javascript:fnPageMove(2)");
      setNewUrl("https://careers.ncsoft.com/apply/list");
  }

  void setNewUrl(String new_url) {
    print("set url");
    setState(() {
       _controller!.loadUrl(new_url);
       url = new_url;
    });
  }
}
      
    

 