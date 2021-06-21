import 'package:g_finder/my_puppeteer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SmileGate {
  bool _loadCompleted = false;
  WebViewController? _controller;
  MyPuppeteer myPuppeteer = new MyPuppeteer();
  //WebScraper _webScraper = WebScraper("https://careers.smilegate.com");

  SmileGate() {
    
    //Future<bool> future = _webScraper.loadWebPage("/ko/recruit/recruit_list.asp");
    //future.then((success) {
    //  _loadCompleted = success;
      /*
      print(_webScraper.getElement("html > body >"
                                   "div#recruitWrap02 >"
                                   "div#wrap >"
                                   "div#container >"
                                   "div.contents >"
                                   "div.boardArea >"
                                   "div.boardList >"
                                   "table#RecruitTbl >"
                                   "tbody >"
                                   "tr:nth-child(2) >"
                                   "td.alignLeft >"
                                   "a", [])); 
                                   //"tbody > tr > td" 
                                   
                                   
                                   //"td.alignLeft"
                                   */
      
    //  print(_webScraper.getAllScripts());                           
    //});
  }



  bool isUpated() {
    return false;
  }

}


/*
"div#wrap >"
"div#locationWrap "
"div#container >"
                                   "div.contents >"
                                   "div.boardArea >"
                                   "div.boardList >"
                                   "div.RecruitTbl", []));
                                   */