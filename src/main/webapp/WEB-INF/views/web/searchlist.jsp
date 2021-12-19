<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>

<html>

<head>

	<meta charset="UTF-8">

</head>

<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
   
   
   
   <section >
    
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Department</h4>
                            <c:forEach var="item" items="${categories}">
                        <ul>
                        <c:url var="showlist" value="/showlist">
								<c:param name="id" value="${item.id}"/>															
												</c:url>
                            <li><a href="${showlist}">${item.categoryname}</a></li>               
                        </ul>
                        </c:forEach> 
                        </div>
                        <div class="sidebar__item">
                            <h4>Price</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="10" data-max="540">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount">
                                        <input type="text" id="maxamount">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__item sidebar__item__color--option">
                            
                        </div>
                        <div class="sidebar__item">
                            
                        </div>
                    
                    </div>
                </div>
   
   
    <!-- Product Section Begin -->
   
  
		 <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                    <div class="section-title product__discount__title">
                            <h2>SEARCH</h2>
                        </div>
                        


					
						
							<div class="breadcrumbs container">
								<h5>Bạn đang ở: <a href="./" class="pathway">Trang chủ</a>
								 <i class="fa fa-caret-right"></i> Kết quả tìm kiếm cho '${key}'</h5>






                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">Default</option>
                                        <option value="0">Default</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>    
        
                    <div class="row">
                    <c:forEach var="item" items="${search}">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                            <c:set var="val" value="${item.productImage}"/>   
                            <c:choose>
    							<c:when test="${val == null }">
        							<c:set var="val" value="speed.jpg"/>
    							</c:when>    
							</c:choose>
                                <div class="product__item__pic set-bg" data-setbg="./template/web/img/${val}">
                                     <ul class="product__item__pic__hover">
                                    <c:url var="details" value="/details">
									<c:param name="id" value="${item.id}"/>															
																</c:url>
                                        <li><a href="${details}"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="${details}"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="${details}"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul> 
                                </div>
                                <div class="product__discount__item__text">
                                <%-- <h5>${item.productname} </h5></br>
                                    <h6 ><a href="#" style ="color : red;">${item.productprice} VNĐ </a></h6> --%>
                                     <h5><a style ="text-transform: uppercase;">${item.productName}</a></h5>
                                     
                                            <div style ="color : red; " class="product__item__price">${item.productPrice} VNĐ </div>
                                          
                                    
                                </div>
                            </div>
                        </div>
                        
                        </c:forEach>

                
                </div>
        
            </div>
              
        </div>
           
    </section>
     
    
    <!-- Product Section End -->
    
    <!-- /.main-content -->

</body>

</html>