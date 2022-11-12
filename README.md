# 자취세끼
## 매번 시켜먹는것도 질린 당신! 나만의 요리를 만들어서 나눠보자!
예전에는 가족구성형태가 대가족 중심이었지만 현대사회엔 점점 1인 가구 수가 늘고 있다. 집에 혼자 있으면 밥 때가 다가 올 때 항상 뭘 먹어야 될까 고민하게되는 나날들. 매번 먹는 배달음식과 집 주위의 매번 갔던 음식점들에 질렸을 때, '자취 세 끼'라는 웹을 통해 1인 가구나 자취하는 사람들이 가벼운 요리를 통해 달성감을 얻고 다양한 맛과 생각을 공유할 수 있는 사이트가 있으면 좋겠다는 생각에 아이디어를 얻었다.

### 프로젝트 개발목적
1인 가구 혹인 2인 가구의 레시피를 공유할 수 있는 동적 웹사이트 개발

### 적용 기술

#### JSP(Java Server Page)
HTML 코드에 JAVA 코드를 넣어 동적 웹페이지를 생성하는 웹어플리케이션 도구. 동적페이지를 JSP파일를 통해 Servlet으로 컴파일하여 실행시켜준다.

<img src="https://user-images.githubusercontent.com/48934539/201462092-1418a4e1-d3f2-40a2-b560-c7a1d4493161.png" align="center">


#### Tomcat
Apache에서 제공하는 오픈소스 WAS(Web Application Server). Java Servlet과 JSP가 실행할 수 있는 환경을 제공하여 동적인 페이지 생성에 도움을 준다.

<img src="https://user-images.githubusercontent.com/48934539/201462066-76c24bb9-fe88-49ed-859e-8c1ddf33038b.png">

#### Oracle DataBase
Oracle에서 제공하는 관계형 DBMS. 시중에서 가장 많이 사용되는 DBMS중 하나

#### 부트스트랩
사용자가 직접 css로 스타일을 입력하지 않고 웹페이지를 꾸밀 수 있는 오픈소스 프론트엔드 프레임워크. 사용자의 코딩시간을 단축시켜주고 초보자가 해도 디자인을 깔끔하게 제작할 수 있다.

#### 네이버 게시판 글쓰기 API
네이버에서 제공하는 게시글 입력 API. 글 ID, 제목, 작성자, 첨부파일 등의 내용을 입력하는 데 큰 도움을 받았다.


### º 구현 기능
#### º 메인페이지 구성
º 상단 메뉴바 - 홈, 레시피 게시판, 자유게시판으로 구성되어 있다.
º 최신 레시피 리스트 3개 출력
º 페이스북, 유튜브 등의 문서 연결 아이콘
<img src="https://user-images.githubusercontent.com/48934539/201462433-a1656707-92f0-4d65-aa1f-a765712317c5.png">

#### º 관리자 전용 ID
관리자 인증이 되어있는 아이디를 사용할 경우 작성자 확인없이 글을 수정, 삭제할 수 있다.

#### º DBMS 구성
userDB - 사용자 개인정보 테이블. admincheck를 통해 관리자인지 확인한다.
recipe - 자취세끼 레시피 작성 게시글 테이블
fbbs - 자유게시판 게시글 테이블

![ERD map](https://user-images.githubusercontent.com/48934539/201463015-332d1e46-f097-4e26-867f-f95acc112335.PNG)


#### º 로그인 시스템(관리자 전용 ID 존재)

<img src="https://user-images.githubusercontent.com/48934539/201462414-124b8b51-99c7-4368-b56f-41d823ab8c6d.png">
#### º 비밀번호 암호화(SHA256 Hash)

![개인정보 암호화 방식](https://user-images.githubusercontent.com/48934539/201463192-4a5d48e1-0516-417c-952a-290f174402bb.PNG)

(단, 관리자는 추가적인 보안 강화를 위해 DES를 통한 2차 암호화를 실시한다.)
#### º 레시피를 공유하는 게시판 및 자유게시판

<img src="https://user-images.githubusercontent.com/48934539/201462475-7df6d844-6adf-4096-bfbe-9c4698e5d0fe.png">

### 구현이 필요한 기능
#### º 댓글 달기 시스템
