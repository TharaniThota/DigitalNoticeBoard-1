<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/style.css" rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
<link href="${contextPath}/resources/css/home.css" rel="stylesheet">
</head>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">
    <img src="${contextPath}/resources/img/icon.png" width="30" height="30" alt="">
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Public <span class="sr-only">(current)</span></a>
      </li>
    </ul>
    <div class="dropdown">
	  <a class="btn btn-secondary dropdown-toggle" href="1" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		${user.username} 
	  </a>
	  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	    <a class="dropdown-item" href="${contextPath}/${user.username}/profile">Profile</a>
		<a class="dropdown-item" href="${contextPath}/${user.username}/addednotices">Added Notices</a>
		<a class="dropdown-item" href="${contextPath}/${user.username}/bookmarkednotices">BookMarked Notices</a>
		<a class="dropdown-item" href="${contextPath}/${user.username}/notice/addNotice">Add Notice</a>
		<a class="dropdown-item" href="${contextPath}/${user.username}/notice/addShortNotice">Add Short Notice</a>
		<a class="dropdown-item" href="${contextPath}/${user.username}/channel/add">Add Channel</a>
	  </div>
	</div>
  </div>
</nav>
<body>
	<section id="">
		<div class="item row align-items-center">
            <div class="col-sm-9">
            <c:forEach var="chnl" items="${Channels}">
          	<div class="channel">
          	 <h2>${chnl.title}</h2>
          	  <div class="notice-slider">
          	   <c:forEach var="note" items="${chnl.notices}">
          	    <div class="notice">
          	     <div class="notice-header">
          	      <h3 class="notice-title">${note.title}</h3>
          	     </div>
          	     <div class=notice-body>
          	      <p class=notice-summary>${note.summary}</p>
          	      <p class=notice-expirationtime><strong>Created Date :</strong><fmt:formatDate value="${note.createdAt}" pattern="yyyy-MM-dd" /></p>
          	      <p class=notice-expirationtime><strong>Expire Date :</strong><fmt:formatDate value="${note.expirationDate}" pattern="yyyy-MM-dd" /></p>
                 </div>
          	    </div>
          	    </c:forEach>
          	   </div>
            </div>
   		    </c:forEach>
	    	</div>
             <div class="col-sm-3">
              <div class="short-notice-slider">
               <h2>Short Notices</h2>
               <c:forEach var="shnote" items="${ShortNotices}"> 
                 <div class="shortnotice">
            		<p>${shnote.details}</p>
            		<fmt:parseDate pattern="HH:mm:ss" value="${shnote.expirationDate}" var="expirationDate" />
            		<p>Expired by: <fmt:formatDate value="${expirationDate}" pattern="HH:mm:ss" /></p>
            	   </div>
               </c:forEach>
             </div>
            </div>  
		</div>
    </section>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
      $('.notice-slider').slick({
    	  infinite: true,
    	  slidesToShow: 3,
    	  slidesToScroll: 3
      });
    });
  	</script>
</body>
</html>
