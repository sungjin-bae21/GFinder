import 'dart:async';
import 'package:flutter/material.dart';
import 'package:g_finder/smile_gate.dart';
import 'package:g_finder/employ_data.dart';
import 'package:g_finder/html_loader.dart';


class DataManagerWidget extends StatefulWidget {
    @override
    _DataManagerState createState() {
      return _DataManagerState();
    }
  }
  
class _DataManagerState extends State {
  SmileGate _smileGate = new SmileGate();
  bool _isVisible = true;
  Timer? timer;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    timer = new Timer.periodic(Duration(milliseconds: 500), update);
    return Visibility (
        visible: _isVisible,
        maintainState: true,
        child: HtmlLoader(onLoadedHtml)
    );
  }

  void update(Timer timer) {
    if (HtmlLoaderState.htmlLoader == null) {
      print("not instance");
      return;
    }
    
    // 웹페이지 로드중.
    if (HtmlLoaderState.htmlLoader!.working == true) {
      print("working");
      return;
    }

    if (_smileGate.finish == false) {
      if (HtmlLoaderState.htmlLoader!.targetComponey != TargetComponey.smileGate) {
        print("new page requset");
        HtmlLoaderState.htmlLoader!.openCrawlingPage(_smileGate.url, TargetComponey.smileGate); 
      }
      else {
        print("java scirpt change");
        HtmlLoaderState.htmlLoader!.inputJavascirpt(_smileGate.getNextPage());
        /*
        String javaScriptName = "";
        if (HtmlLoaderState.htmlLoader!.isNewPage) {
          javaScriptName = _smileGate.getWakeUpJavaSciprtName();
        }
        else {
          javaScriptName = _smileGate.getNextPage();
        }

        HtmlLoaderState.htmlLoader!.inputJavascirpt(_smileGate.getNextPage());
        */
      }
    }
  }

  // 가장 먼저 구글 페이지를 로드해 웹뷰가 출력되었다고 알린다.
  // 성공적으로 웹뷰가 열렷다면 스마일 게이트 페이지를 열어 동작을 진행한다.
  void onLoadedHtml(String html, TargetComponey target) {
    if (target == TargetComponey.none) {
      return;
    }

    if (target == TargetComponey.smileGate) {
      _smileGate.setHtmlDoc(html);
    }

  }

  @override
  void dispose() {
    timer!.cancel();
  }
}