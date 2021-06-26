# g_finder

동작 방식은 다음과 같다.

1. vebView 에서 특정 채용 페이지를 load
2. 자바 스크립트가 모두 업데이트 될때까지 2초간 기다린다.
   이와 같은 방법을 채택한 이유는 자바스크립트를 이용해 데이터를 가져오는 페이지가 있기 때문.
   
   추가로 다른 방법을 확인해 봤지만 자바 스크립트가 동작중인지 아닌지 알 수 있는 방법이 없었다.
   아는 지인을 통해 렌더링이 끝낫다는 것은 알 수 있다는 것을 알았지만 만약 스크롤에 반응하는 자바스크립트라면 마치 
   게임에서 Update 가 끝난 이벤트를 원하는것과 같다는 생각이 든다.
   
 아직 UI 는 제작하지 않았으며 추후 서버에서 긴 간격으로 크롤링해 정보를 저장 및 클라이언트에 출력해 주는 방식을 사용하는 방식이 맞다 생각됨.
