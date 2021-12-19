<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




	<div class="section-title product__news__title">
		<H2 class ="title_word">NEWS</H2>
		</div>
        <div class="container">
   				
            <div class="row">
         
           <c:forEach var="item" items="${news}">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="blog__item">
                                <div class="blog__item__pic">
                                    <img src="./template/web/img/${item.thumbnail}.jpg" alt="">
                                </div>
                                <div class="blog__item__text">
                                    <ul>
                                        <li><i class="fa fa-calendar-o"></i> June 11,2021</li>
                                        <li><i class="fa fa-comment-o"></i> 5</li>
                                    </ul>
                                    <h5><a class ="nice__word">${item.title}</a></h5>
                                    <a class ="nice__word">${item.content} </a>
                                   
                                </div>
                            </div>
                        </div>

     			</c:forEach>
                    </div>
                    	
                </div>
          </div>
          </div>


</body>
</html>