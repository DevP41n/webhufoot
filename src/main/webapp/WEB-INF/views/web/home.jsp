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
                            <h2>Sale Off</h2>
                        </div>
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="./template/web/img/jordan.jpg">
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Nike</span>
                                            <h5><a href="#">NIKE AIR JORDAN X DIOR</a></h5>
                                            <div class="product__item__price">$300.00 <span>$360.00</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="./template/web/img/test2.jpg">
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Nike</span>
                                            <h5><a href="#">NIKE AIR JORDAN 1 MID</a></h5>
                                            <div class="product__item__price">$300.00 <span>$360.00</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="./template/web/img/test3.jpg">
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Nike</span>
                                            <h5><a href="#">NIKE AIR JORDAN 1 MID SE SIGNAL BLUE BQ6931 402 #B2 #KH</a></h5>
                                            <div class="product__item__price">$300.00 <span>$360.00</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="./template/web/img/jordanred.jpg">
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Nike</span>
                                            <h5><a href="#">NIKE AIR JORDAN OFF-WHITE RED</a></h5>
                                            <div class="product__item__price">$300.00 <span>$360.00</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="./template/web/img/off-white.jpg">
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Nike</span>
                                            <h5><a href="#">NIKE AIR JORDAN OFF-WHITE BLUE</a></h5>
                                            <div class="product__item__price">$300.00 <span>$360.00</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic set-bg"
                                            data-setbg="./template/web/img/test1.jpg">
                                            <div class="product__discount__percent">-20%</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>Nike</span>
                                            <h5><a href="#">NIKE AIR JORDAN 1</a></h5>
                                            <div class="product__item__price">$300.00 <span>$360.00</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="section-title product__discount__title">
                            <h2>All Product</h2>
                        </div>
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
                     <form action="<c:url value='/trang-chu?page=${model.page}&limit=${model.limit }'/>" id="formSubmit" method="get">
                    <div class="row">
                    <c:forEach var="item" items="${model.listResult}">
                    <c:url var="details" value="/details">
									<c:param name="id" value="${item.id}"/>															
																</c:url>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                            
                            <c:set var="val" value="${item.productimage}"/>   
                            <c:choose>
    							<c:when test="${val == null }">
        							<c:set var="val" value="speed.jpg"/>
    							</c:when>    
							</c:choose>
                                <div class="product__item__pic set-bg" data-setbg="./template/web/img/${val}">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="${details}"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="${details}"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="${details}"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__discount__item__text">
                                <%-- <h5>${item.productname} </h5></br>
                                    <h6 ><a href="#" style ="color : red;">${item.productprice} VNĐ </a></h6> --%>
                                     <h5><a style ="text-transform: uppercase;">${item.productname}</a></h5>
                                     
                                            <div style ="color : red; " class="product__item__price">${item.productprice} VNĐ </div>
                                          
                                    
                                </div>
                            </div>
                        </div>
                        
                        </c:forEach>

                
                </div>
             

                        <ul class="pagination" id="pagination"></ul>	
					<input type="hidden" value="" id="page" name="page"/>
					<input type="hidden" value="" id="limit" name="limit"/>
					
					</form>
        	<div class="product__pagination" style="text-align: center;">
                        <a href="./trang-chu?page=1&limit=6">1</a>
                        <a href="./trang-chu?page=2&limit=6">2</a>
                        <a href="./trang-chu?page=3&limit=6">3</a>
                        <a href="./trang-chu?page=3&limit=6"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
            </div>
                 
        </div>
           
    </section>

    
    <!-- Product Section End -->
    
    <!-- /.main-content -->
		<script>
		import $ from 'jquery';
		var totalPages = ${model.totalPage};
		var currentPage = ${model.page};
		$(function () {
	        window.pagObj = $('#pagination').twbsPagination({
	            totalPages: totalPages,
	            visiblePages: 10,
	            startPage: currentPage,
	            onPageClick: function (event, page) {
	            	if (currentPage != page) {
	            		$('#limit').val(6);
						$('#page').val(page);
						$('#formSubmit').submit();
						
					}
	            }
	        });
	    });
	
		
		</script>

</body>

</html>