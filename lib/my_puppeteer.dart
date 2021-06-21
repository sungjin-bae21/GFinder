import 'package:puppeteer/puppeteer.dart';
import 'package:web_scraper/web_scraper.dart';

class MyPuppeteer {
  bool usable = false;
  String _url = ""; 
  WebScraper _webScraper = new WebScraper();

  Browser? _browser;
  Page? _page;
 

  void asncyLoadWebPage(String url) {
    Future<Browser> browserFuture = puppeteer.launch();
    browserFuture.then((browser) {
      Future<Page> pageFutre = browser.newPage();
      _browser = browser;
      pageFutre.then((page) {
        _page = page;
        
        _loadWebPage();
      });
    });
  }

  void Close() {
    _browser!.close();
  }

  bool isUsable() {
    return usable;
  }

  void _loadWebPage() {
      Future<Response> response = _page!.goto(_url, wait: Until.networkIdle);
      response.then((value) {
        if (value.status == 200) {
          Future<String?> contentFutrue = _page!.content;
          contentFutrue.then((content) {
            if (content != null) {
              _webScraper.loadFromString(content);
              usable = true;
            }
          });
        }
      });
  }
}