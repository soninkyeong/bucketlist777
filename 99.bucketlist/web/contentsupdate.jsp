<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Contents Update</title>
</head>
<body>
<form action="contentsupdateimpl.bk" method="post" enctype="multipart/form-data">


<h3>${contentsupdate.category_id}</h3>
<input type="hidden" name="contents_id" value="${contentsupdate.contents_id }">
<input type="hidden" name="user_id" value="${contentsupdate.user_id}">
<h3>ī�װ� : </h3>
<div class="form-group">
          <select name="category_id" class="form-control input-lg">
             <option value="develop">�ڱⰳ��</option>
             <option value="travel">����</option>
             <option value="food">����</option>
             <option value="sports">������</option>
             <option value="etc">��Ÿ</option>
          </select>
       </div>


<h3>���� : <input type="text" name="contents_title" value="${contentsupdate.contents_title}"></h3>
<h3>IMAGE1 : <input type="file" name="new_contents_image1"></h3>
<input type="hidden" name="new_contents_image1" value="${contentsupdate.contents_image1}">
<h3>IMAGE2 : <input type="file" name="new_contents_image2"></h3>
<input type="hidden" name="new_contents_image2" value="${contentsupdate.contents_image2}">
<h3>IMAGE3 : <input type="file" name="new_contents_image3"></h3>
<input type="hidden" name="new_contents_image3" value="${contentsupdate.contents_image3}">
<h3>���� : <input type="text" name="contents_content" value="${contentsupdate.contents_content}"></h3>
<input type="submit" value="����">
</form>
</body>
</html>