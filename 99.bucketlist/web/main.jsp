<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<style>
   #section{
      background: #03d3e4;
   }
</style>
<head>
<script>
function login(f){
   var c = confirm('로그인 하시겠습니까?');
   if(c == true){
      f.method='post';
      f.action='login.bk';
      f.submit();
      alert('로그인 성공');
   }
};
function usersregister(f) {
      var c = confirm('?');
      if (c == true){
         f.method='post';
         f.action='usersregister.bk';
         f.submit();
         alert('회원가입 성공');
      }
   };
</script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <meta charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Bucketlist</title>

    <!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="bootstrap/css/freelancer.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
    
    <!-- Navigation -->
<div class="navbar navbar-custom navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="main.bk">BUCKET LIST</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-right navbar-nav">
               <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
              
                 
                    <li class="page-scroll">
                       <c:choose>
                          <c:when test="${loginuser == null }">
                             <a data-toggle="modal" data-target="#myModal" href="#myModal">CONTENTS</a>
                          </c:when>
                          <c:otherwise>
                             <a href="go.bk?next=contents">CONTENTS</a>
                          </c:otherwise>
                       </c:choose>
                    </li>
                    <li class="page-scroll">
                        <a href="contentslist.bk">CONTENTS LIST</a>
                    </li>
                    <li class="page-scroll">
                        <a href="go.bk?next=comments">COMMENTS</a>
                    </li>
                    <li class="page-scroll">
                        <a href="commentslist.bk">COMMENTS LIST</a>
                    </li>
                    
               <li class="dropdown"><a href="#" class="dropdown-toggle"
                  data-toggle="dropdown"><i class="glyphicon glyphicon-search"></i></a>
                  <ul class="dropdown-menu" style="padding: 12px;">
                     <form class="form-inline">
                        <button type="submit" class="btn btn-default pull-right">
                           <i class="glyphicon glyphicon-search"></i>
                        </button>
                        <input type="text" class="form-control pull-left"
                           placeholder="Search">
                     </form>
                  </ul></li>
                  
                  
                  
               <li class="dropdown"><a href="#" class="dropdown-toggle"
                  data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i>
                     <i class="glyphicon glyphicon-chevron-down"></i></a>
                  <ul class="dropdown-menu">
                     <li>
                        <c:choose>
                                   <c:when test="${loginuser == null }">
                                      <a data-toggle="modal" data-target="#myModal" href="#myModal">LOGIN</a> 
                                   </c:when>
                                   <c:otherwise>
                                      <a href="logout.bk">LOGOUT</a>
                                   </c:otherwise>
                             </c:choose>
                     </li>
                     <li>
                        <c:choose>
                           <c:when test="${loginuser == null }">
                              <a data-toggle="modal" data-target="#myModal2"
                                 href="#myModal2">JOIN</a>
                           </c:when>
                           <c:otherwise>
                              <a href="mypage.bk">MY PAGE</a>
                           </c:otherwise>
                        </c:choose>
                     </li>
                     <li class="divider"></li>
                     <li><a href="#">About</a></li>
                  </ul>
               </li>
            </ul>
         </div>
       
    </div>
</div>

  <!-- Header -->
    <header>
    </header>
    
   <section id="section">
      <c:choose>
         <c:when test="${center == null }">
            <jsp:include page="mcenter.jsp"></jsp:include>
         </c:when>
         <c:otherwise>
            <jsp:include page="${center }.jsp"></jsp:include>
         </c:otherwise>
      </c:choose>
   </section>
    
    <!-- 로그인부분 시작 -->
 <div class="container">
    <form>
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
      <h4 class="modal-title" id="myModalLabel">Login</h4>
         </div>
         <div class="modal-body">
            <div class="form-group">
                 <input type="text" class="form-control input-lg" placeholder="id" id="user_id" name="user_id">
             </div>
             <div class="form-group">
                 <input type="password" class="form-control input-lg" placeholder="Password" id="user_password" name="user_password">
             </div>
         </div>
         <div class="modal-footer">
      <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="login(this.form)">Login</button>
      <button type="button" class="btn btn-default" onclick="self.close()">Close</button>
         </div>
       </div>
     </div>
   </div>
   </form>
</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
    <!-- 로그인부분 끝 -->
    <!-- 조인부분 시작 -->
 <div class="container">    
    <form enctype="multipart/form-data">
   <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
      <h4 class="modal-title" id="myModalLabel">Join</h4>
         </div>
         <div class="modal-body">
            <div class="form-group">
                 <input type="text" class="form-control input-lg" placeholder="ID" name="user_id">
             </div>
             <div class="form-group">
                 <input type="password" class="form-control input-lg" placeholder="Password" name="user_password">
             </div>
             <div class="form-group">
                 <input type="text" class="form-control input-lg" placeholder="Name" name="user_name">
             </div>
             <div class="form-group">
                 <input type="text" class="form-control input-lg" placeholder="Email" name="user_email">
             </div>
             <div class="form-group">
                <input type="file" class="form-control input-lg" placeholder="Image" name="user_image">
             </div>
         </div>
         <div class="modal-footer">
      <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="usersregister(this.form)">회원가입</button>
      <button type="button" class="btn btn-default" onclick="self.close()">Close</button>
         </div>
       </div>
     </div>
   </div>
   </form>
</div>
<!-- 조인부분 끝 -->
    
    
    
    
     <!-- Footer -->
    <footer class="text-center">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-4">
                        <h3>Location</h3>
                        <p>Samsung SDS Multicampus<br>GangNam in Seoul</p>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Around the Web</h3>
                        <ul class="list-inline">
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-google-plus"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-linkedin"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-dribbble"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Contact</h3>
                        <p>http://www.multicampus.co.kr/<br>02-3429-5114</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll visible-xs visible-sm">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>

    <!-- jQuery -->
    <script src="bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="bootstrap/js/classie.js"></script>
    <script src="bootstrap/js/cbpAnimatedHeader.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="bootstrap/js/freelancer.js"></script>

</body>

</html>