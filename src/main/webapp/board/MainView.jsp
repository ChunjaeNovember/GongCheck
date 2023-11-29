<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>GongCheck</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style>
<%-- 네비게이션 바 --%>
*{
  margin: 0;
  padding: 0;
}
  #logo{
  width: 3rem;
  }
  #img {
  width: 3rem;
  border-radius: 100%;
  }
#img_ {
  width: 3rem;
  border-radius: 100%;
}
.btn_ {
  border: 0px;
}
#writebtn{
  float: right;
  margin: 1rem;
}
header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

/*팝업 디자인*/
/*.wrap{padding:10px;}

.btn_open{
  font-weight:bold;
  margin:5px;
  padding:4px 6px;
  background:#000; color:#fff;
}
.pop_wrap{
  position:fixed;
  top:0;
  left:0;
  right:0;
  bottom:0;
  background:rgba(0,0,0,.5);
  font-size:0;
  text-align:center;
}
.pop_wrap:after{
  display:inline-block;
  height:100%;
  vertical-align:middle;
  content:'';
}
.pop_wrap .pop_inner{
  display:inline-block;
  padding:20px 30px;
  background:#fff; width:200px;
  vertical-align:middle;
  font-size:15px;
}*/
</style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<%--  <script type="text/javascript">
    $(document).click(function() {
        $.ajax({
          type:"get",
          url:"../gck/PostView.jsp?postIdx=1",
          data:"html",
          error: function (){
            alert('통신실패!!!');
          },
          success:function(result){//result (변수명은 어떤것이든 상관없음)
            //success function 매개변수로 서버가 응답한 데이터가 전달
            alert('통신 데이터 값 :' +result);
            $("wrap").html(result);
          }
        });//ajax
      });//click

  </script>--%>
</head>

<body>
<div class="header">
<h1>GongCheck</h1>
  <button class="btn_" type="submit"><a href="${pageContext.request.contextPath}/member/login.do">로그인</a></button>

</div>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="../img/logo.jpg" id="logo"/>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0" id="main_menu">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Notice</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Rank
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">주간 조회수 Top 10</a></li>
            <li><a class="dropdown-item" href="#">주간 좋아요 Top 10</a></li>
<%--            <li><hr class="dropdown-divider"></li>--%>
<%--            <li><a class="dropdown-item" href="#">Something else here</a></li>--%>
          </ul>
        </li>
<%--        <li class="nav-item">--%>
<%--          <a class="nav-link" href="#">Disabled</a>--%>
<%--        </li>--%>
      </ul>
      <div class="search">
      <form class="d-flex" role="search" action="${pageContext.request.contextPath}/gck/MainView.do">
<%--        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">--%>
        <table border="1" width="90%">
          <tr>
            <td align="center">
              <select name="searchField">
                <option value="post_title">제목</option>
                <option value="post_content">내용</option>
              </select>

              <input type="text" name="searchWord" value="${param.searchWord}"/>
              <input type="submit" value="검색하기"/>
            </td>
          </tr>
        </table>

        <button class="btn_" type="submit" >
          <img src="../img/프로필1.png" id="img_" />
        </button>
      </form>
      </div>
    </div>
  </div>
</nav>

<div class="contentContainer">
  <%--choose when otherwise 는 java로 치면
  if else 문이랑 비슷한 반복문 성질을 가지고 있다.
  MVC2 패턴을 잘 나타내고 분리된 메서드를 이용해 동적으로 처리하기 위함.--%>
  <c:choose>
    <c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
      <tr>
        <td colspan="6" align="center">
          등록된 게시물이 없습니다^^*
        </td>
      </tr>
    </c:when>

    <c:otherwise>  <!-- 게시물이 있을 때 -->
      <c:forEach items="${ boardLists }" var="row" varStatus="loop">
        <div class="parent_post">
          <div class="post_count">  <!-- 번호 -->
              ${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
<%--              ${no}--%>
          </div>
          <div class="post_title">  <!-- 제목(링크) -->
            <a href="../gck/PostView.do?postIdx=${ row.postIdx }" id="ajaxBtn">${ row.postTitle }</a>
            <img src="/Uploads/" alt="post1">
          </div>
        </div>
      </c:forEach>
    </c:otherwise>
  </c:choose>
</div>

<!-- 하단 메뉴(바로가기, 글쓰기) -->
<table border="1" width="100%">
  <tr align="center">
    <td>
      ${ map.pagingImg }
    </td>
    <td width="100"><button type="button"
                            onclick="location.href='../post/PostWrite.jsp';">글쓰기</button></td>
  </tr>
</table>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<%--<script>--%>
<%--  var target = document.querySelectorAll('.btn_open');--%>
<%--  var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');--%>
<%--  var targetID;--%>

<%--  // 팝업 열기--%>
<%--  for(var i = 0; i < target.length; i++){--%>
<%--    target[i].addEventListener('click', function(){--%>
<%--      targetID = this.getAttribute('href');--%>
<%--      document.querySelector(targetID).style.display = 'block';--%>
<%--    });--%>
<%--  }--%>

<%--  // 팝업 닫기--%>
<%--  for(var j = 0; j < target.length; j++){--%>
<%--    btnPopClose[j].addEventListener('click', function(){--%>
<%--      this.parentNode.parentNode.style.display = 'none';--%>
<%--    });--%>
<%--  }--%>
<%--</script>--%>
</body>
</html>
