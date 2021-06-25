import 'package:web_scraper/web_scraper.dart';
//import 'package:sprintf/sprintf.dart';
import 'package:g_finder/html_loader.dart';
import 'package:g_finder/employ_data.dart';

class SmileGate {
  String url = "https://careers.smilegate.com/ko/recruit/recruit_list.asp";
  String _pageChangeScriptName = "fnPageMove";
  int _currentIndex = 1;
  bool finish = false;

  WebScraper webScraper = new WebScraper();
  Set<EmployData> employDatas = {};

  String getNextPage() {
    _currentIndex++;
    return _pageChangeScriptName + "(${_currentIndex})";
  }

  // 이벤트를 받기 위한 스크립트
  String getWakeUpJavaSciprtName() {
    return _pageChangeScriptName +  "(2)";
  }

  bool setHtmlDoc (String html) {
    if (webScraper.loadFromString(html) == false) {
      return false;
    }

    List<Map<String, dynamic>> data = webScraper.getElement("#RecruitTbl > tbody", []);
    Map<String, dynamic> map_data  = data[0];
    String amount_data = map_data["title"];
    List<String> split =  amount_data.split(new RegExp("\t"));
    split.removeRange(0, 21);

    if (split.length == 0) {
      finish = true;
      return true;
    }

    for (int i = 0; i < split.length; i += 7) {
      //174, 스마일게이트 알피지, [LOST ARK] 영상제작 담당, MMORPG, 그래픽,  경력, 2021-07-31
      EmployData employData = new EmployData();
      employData.company = "스마일 게이트";
      employData.team = split[i + 2];
      employData.gameGenre = split[i + 3];
      employData.field = split[i + 4];
      employData.career = split[i + 5];
      employData.endDay = split[i + 6];
      employDatas.add(employData);
    }

    print("finish page data load");
    return true;
  }
}
