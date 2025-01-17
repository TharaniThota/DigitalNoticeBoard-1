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
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/style.css" rel="stylesheet">
<link href="${contextPath}/resources/css/lightbox.css" rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
<link href="${contextPath}/resources/css/home.css" rel="stylesheet">
<link href="${contextPath}/resources/css/lightbox.css" rel="stylesheet">
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
    <a href="${contextPath}/signin">SignIn</a>
  </div>
</nav>
<body>
    <div class="maincontent">
	    <section id="">
			<div class="item row">
              <div class="col-sm-9">
              <c:forEach var="chnl" items="${Channels}">
	           	<div class="channel">
	           	 <h2 class="channel-title">${chnl.title}</h2>
	           	 <div class="channel-body">
	           	  <div class="notice-slider">
	           	   <c:forEach var="note" items="${chnl.notices}">
	           	    <div class="notice">
	           	     <div class="notice-header">
	           	      <h3 class="notice-title">${note.title}</h3>
	           	     </div>
	           	     <div class=notice-body>
	           	      <p class=notice-summary>${note.summary}</p>
	           	      <p class=notice-expirationtime><strong>Created Date :</strong><fmt:formatDate value="${note.createdAt}" type="date" /></p>
	           	      <p class=notice-expirationtime><strong>Expire Date :</strong><fmt:formatDate value="${note.expirationDate}" type="both" /></p>
	           	      <button  id="view-button" onclick="openLightBox('${note.title}','${note.summary}','${note.details}','${note.createdAt}','${note.expirationDate}','', '${note.id}');" style="width:60px; height:30px"><i class="fa fa-eye" aria-hidden="true"></i></button>
                  </div>
	           	    </div>
	           	    </c:forEach>
	           	   </div>
	             </div>
	           	 </div>
       		    </c:forEach>
			        </div>
                <div class="col-sm-3 shortnoticeHeight" >
                <div class="short-notice-slider">
                 <h2>Short Notices</h2>
                 <c:forEach var="shnote" items="${ShortNotices}"> 
                   <div class="shortnotice">
              		<p>${shnote.details}</p>
              		<p>Expires at: <fmt:formatDate value="${shnote.expirationDate}"  type="time" pattern="HH:mm"/></p>
              	   </div>
                 </c:forEach>
               </div>
              </div>  
			</div>
        </section>
         <div id="Lightbox" class="modal">
				<div class="modal-dialog">
					<div class="modal-content">
				<div class="modal-header">
				  <h3 id="lightbox-notice-title" class="modal-title"></h3>
				  <span type="button" class="model-close pointer"  onclick="closeLightBox()" aria-label="Close">X</span>
				</div>
				<div class="modal-body">
				 <p id="lightbox-notice-summary" class=notice-summary></p>
				 <div id="lightbox-notice-detail" class=notice-summary></div>
				  <p><strong>Created Date :</strong><span id="lightbox-notice-createdAt"></span></p>
				  <p><strong>Expire Date :</strong><span id="lightbox-notice-expirationDate"></span></p>
				<!--<button class=sharebutton onclick="share('${note.title}', '${note.summary}')" style="width:60px; height:30px">share</button> --> 
				</div>
			</div>
			</div>
		  </div>
    </div>
    <script type="text/javascript" src="${contextPath}/resources/js/lightbox.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/lightbox.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
      $('.notice-slider').slick({
    	  infinite: true,
    	  slidesToShow: 2,
    	  slidesToScroll: 1,
    	  autoplay: true,
    	  autoplaySpeed: 3000,
    	  variableWidth: true,
    	  variableHeight: true
    	 
      });
    });
  	</script>
</body>
</html>
