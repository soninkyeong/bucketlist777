<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
	#img02{
		width:500px;
		height:500px;
	}
	#img03, #img04{
		width: 250px;
		height: 250px;
	}
	#update, #delete, #com{
		font-size: 15px	
	}
</style>
<script>
function commentsregister(f) {
   var c = confirm('Run it');
   if (c == true){
      f.method='post';
      f.action='commentsregister.bk';
      f.submit();
   }
};
function popup() {
	var c = confirm('�α����Ͻðڽ��ϱ�?');
	if (c == true){
		f.method='post';
		f.action='login.bk';
		f.submit();
	}
}

function getWeather(){
	function display(data){
		var output ='';
		$(data).find('item').each(function(){
			var day = $(this).find('yweather\\:forecast,forecast').attr('day');
			var date = $(this).find('yweather\\:forecast,forecast').attr('date'); 
			var low = $(this).find('yweather\\:forecast,forecast').attr('low');
			var high = $(this).find('yweather\\:forecast,forecast').attr('high');
			var text = $(this).find('yweather\\:forecast,forecast').attr('text');
			output += '<h4>' +day +' '+date+'</h4>';
			output += '<h4>low ' +low+'�� high' + high+'</h4>';
			output += '<h4>' +text+'</h4>';
		});
		$('#weather').html(output);
	}
	$.ajax({
		url:'/getforecast.do', // /getforecast.do�� localhost �ٷ� ���� ã�´� (�غ���)
		success:function(data){
			display(data);
		}
	});
}

$(document).ready(function(){
	getWeather();
});
</script>  
<head>

<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
 <meta charset="EUC-KR" />
    <title>Join Template | PrepBootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

 <div class="container">


        <div class="row">
			<!-- ���� ���̵�� -->
            <div class="col-md-3">
                <p class="lead"></p>
                <div class="list-group">
                    <a href="#" class="list-group-item active">Menu</a>
                    <a href="#" class="list-group-item">Contents</a>
                    <a href="#" class="list-group-item">Following</a>
                    <a href="#" class="list-group-item">Q&A</a>
                </div>
                <div>������ ���Ŷ�</div>
            </div>


			<!-- �ڡڡڱ��� �Ҿ���ڡڡ� -->
			<!-- <div id="weather"></div> -->
            
            
            
            
            <div class="col-md-9">
                <div class="thumbnail">
                    <div class="caption-full">
                    	<p></p>
                    	<p></p>
                    	<p></p>
                    	<p>���� : ${contentsdetail.contents_title} </p>
                    	<c:choose>
                    		<c:when test="${loginuser.user_id != contentsdetail.user_id}">
                    			
                    		</c:when>
                    		<c:otherwise>
                    			<p>
	                    			<a id="com" href="contentscom.bk?id=${contentsdetail.contents_id}" class="pull-right">�Ϸ�</a>
	                    			<a id="delete" href="contentsdelete.bk?contents_id=${contentsdetail.contents_id}&user_id=${contentsdetail.user_id}" class="pull-right">����&nbsp&nbsp</a>
	                      			<a id="update" href="contentsupdate.bk?contents_id=${contentsdetail.contents_id}" class="pull-right">����&nbsp&nbsp</a>
                      			</p>
                    		</c:otherwise>
                    	</c:choose>
                    	
             			
             
               <!-- �̹����κ� ���� -->
               <div class="row carousel-holder">
                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div>
	                            <div class="carousel-inner">
	                                <div class="item active">
	                                    <img class="slide-image" src="img/contents/${contentsdetail.contents_image1}" alt="">
	                                </div>
	                                <div class="item">
	                                    <img class="slide-image" src="img/contents/${contentsdetail.contents_image2}" alt="">
	                                </div>
	                                <div class="item">
	                                    <img class="slide-image" src="img/contents/${contentsdetail.contents_image3}" alt="">
	                                </div>
	                            </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>
						<!-- �̹����κ� �� -->
                </div>
                    	<h3>���� : ${contentsdetail.contents_content}</h3>
                    </div>
                    
                    <div class="ratings">
                        <p class="pull-right"></p>
                    </div>
                </div>
                
				<!-- ��� -->
                <div class="well">
                	<!-- ��۵�� -->
                   <div class="text-right">
		                <form class="col-md-12" enctype="multipart/form-data">
		                	<input type="hidden" class="form-control input-lg" name="contents_id" value="${contentsdetail.contents_id}">
							<input type="hidden" class="form-control input-lg" name="user_id" value="${loginuser.user_id }"> 
							<div class="form-group">
								<c:choose>
									<c:when test="${loginuser == null }">
										<input type="text" class="form-control input-lg" placeholder="comment" name="comments_content" readonly="readonly" onclick="alert('�α����� ���ּ���')">
									</c:when>
									<c:otherwise>
										<input type="text" class="form-control input-lg" placeholder="comment" name="comments_content">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="form-group">
                       		   <input type="hidden" class="form-control input-lg" name="comments_image" value="img01.jpg">
                     		</div>
                     		<button class="btn btn-success" onclick="commentsregister(this.form)" class="pull-right">Register</button>
    <%--                  		<c:choose>
								<c:when test="${loginuser == null }">
									<button class="btn btn-success" onclick="popup()">Register</button>
								</c:when>
								<c:otherwise>
									<button class="btn btn-success" onclick="commentsregister(this.form)">Register</button>
								</c:otherwise>
							</c:choose> --%>
						</form>
                    </div>
                    
                    <!-- ��ۺ��� -->
					<c:forEach items="${commentslist }" var="comments">
						<div class="row">
							<hr>
	                        <div class="col-md-12">
	                            ${comments.user_id }
	                            <span class="pull-right">${comments.comments_regdate}</span><br/>
	                           	
	                        	<c:choose>
                    				<c:when test="${loginuser.user_id != comments.user_id}">
                    			
                    				</c:when>
                    				<c:otherwise>
	                           			<a class="pull-right" href="commentsdelete.bk?user_id=${comments.user_id}&comments_id=${comments.comments_id }&contents_id=${comments.contents_id}">����</a>
	                            	</c:otherwise>
	                            </c:choose>
	                            
	                            <p>&nbsp&nbsp${comments.comments_content}</p><%-- <a href="commentsdelete.bk?user_id=${comments.user_id}">����</a> --%>
	                        </div>
	                        <hr>
	                    </div>

					</c:forEach>

                </div>

            </div>

        </div>

    </div>


<%-- <h1><a href="contentsupdate.bk?id=${contentsdetail.contents_id}">�����ϱ�</a></h1>

<h3>${contentsdetail.category_id}</h3>
<h3>���� : ${contentsdetail.contents_title}</h3>
<img id="img02" src="img/contents/${contentsdetail.contents_image1}"><br>
<img id="img02" src="img/contents/${contentsdetail.contents_image2}"><br>
<img id="img02" src="img/contents/${contentsdetail.contents_image3}"><br>
<h3>���� : ${contentsdetail.contents_content}</h3>
<h3>��ǥ��¥ : ${contentsdetail.contents_goaldate}</h3>
<h3>������¥ : ${contentsdetail.contents_regdate}</h3>

	<h1>Comments List</h1>
	<c:forEach items="${commentslist }" var="comments">
	<table>
	<tr>
		<td rowspan="3"><img id="img01" src="img/comments/${comments.comments_image}"></td>
		<td class="navbar-brand">��� ���̵� : ${comments.user_id }</td>
	</tr>
	<tr>
		<td class="navbar-brand">��� ���� : ${comments.comments_content}</td> 
	</tr>
	<tr>
		<td class="navbar-brand"><a href="commentsdelete.bk?user_id=${comments.user_id}">�����ϱ�</a></td> 
	</tr>
	</table>
	</c:forEach>


<form class="col-md-12" enctype="multipart/form-data">
	<div class="form-group">
    	<input type="hidden" class="form-control input-lg" name="contents_id" value="${contentsdetail.contents_id}">
    </div>
    <div class="form-group">
        <input type="hidden" class="form-control input-lg" name="user_id" value="${loginuser.user_id }"> 
    </div>
    <div class="form-group">
        <input type="text" class="form-control input-lg" placeholder="comment" name="comments_content">
    </div>
    <div class="form-group">
        <input type="file" class="form-control input-lg" name="comments_image">
    </div>
    <div class="form-group">
        <button class="btn btn-primary btn-lg btn-block" onclick="commentsregister(this.form)">Register</button>
        <button class="btn btn-primary btn-lg btn-block" onclick="self.close()">Cancel</button>
    </div>
</form> --%>

</body>
</html>