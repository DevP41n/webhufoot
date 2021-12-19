<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

<title></title>
</head>
<body>

	<!-- Hover table card start -->
	<div class="pcoded-content">
	<form action="<c:url value='/listproduct?page=${model.page}&limit=${model.limit}'/>" id="formSubmit" method="get">
		<div class="pcoded-inner-content">
			<!-- Main-body start -->
			<div class="main-body">
				<div class="page-wrapper">
					<!-- Page-body start -->
					<div class="page-body">
						<div class="card">
							<div class="card-header">
								<h5>Danh Sách Sản Phẩm</h5>
								<div class="card-header-right">
									<ul class="list-unstyled card-option">
										<li><i class="fa fa fa-wrench open-card-option"></i></li>
										<li><i class="fa fa-window-maximize full-card"></i></li>
										<li><i class="fa fa-minus minimize-card"></i></li>
										<li><i class="fa fa-refresh reload-card"></i></li>
										<li><i class="fa fa-trash close-card"></i></li>
									</ul>
								</div>
							</div>
							<div class="card-block table-border-style">
								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>Tên Sản Phẩm</th>
												<th>Giá</th>
												<th>Hình Ảnh</th>
												<th>Chi Tiết Sản Phẩm</th>
												<th>Thao tác</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="item" items="${model.listResult}">
											<tr>
												<!-- <th scope="row">1</th> -->
												<td>${item.productname}</td>
												<td>${item.productprice}</td>
												<td>${item.productimage}</td>
												<td>${item.productcontent}</td>
												<td>																
												<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
														title="Cập nhật bài viết" href='#'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
												</a>
												</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
									<ul class="pagination" id="pagination"></ul>	
									<input type="hidden" value="" id="page" name="page"/>
									<input type="hidden" value="" id="limit" name="limit"/>	
								</div>
							</div>	
						</div>			
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
	<!-- Hover table card end -->
	<script>
			var totalPages = ${model.totalPage};
			var currentPage = ${model.page};
			$(function () {
		        window.pagObj = $('#pagination').twbsPagination({
		            totalPages: totalPages,
		            visiblePages: 10,
		            startPage: currentPage,
		            onPageClick: function (event, page) {
		            	if (currentPage != page) {
		            		$('#limit').val(2);
							$('#page').val(page);
							$('#formSubmit').submit();
						}
		            }
		        });
		    });
		</script>
</body>
</html>