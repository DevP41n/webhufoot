<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="NewsURL" value="/listnews" />
<c:url var="newsAPI" value="/api/news"/>
<!DOCTYPE html>
<html>
<head>

<title></title>
</head>
<body>

	<!-- Hover table card start -->
	<div class="pcoded-content">
	<form action="<c:url value='/listbrand?page=${model.page}&limit=${model.limit }'/>" id="formSubmit" method="get">
		<div class="pcoded-inner-content">
			<!-- Main-body start -->
			<div class="main-body">
				<div class="page-wrapper">
					<!-- Page-body start -->
					<div class="page-body">
						<div class="card">
						<c:if test="${not empty message}">
									<div class="alert alert-${alert}">
			  							${message}
									</div>
								</c:if>
							<div class="card-header">
								<h5>Danh Sách Tin Tức</h5>
								<div class="card-header-right">	
								<c:url var="createNewsURL" value="/addnews"/>
												<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm tin tức' href='${createNewsURL}'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
									<button id="btnDelete" type="button" onclick="warningBeforeDelete()"
									class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa tin tức'>
													<span>
													<i class="fa fa-times" aria-hidden="true"></i>
													</span>
												</button>							
								</div>
							</div>
							<div class="card-block table-border-style">
								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<tr>
												<th></th>
												<th>Tiêu đề</th>
												<th>Nội dung</th>
												<th>Thao tác</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="item" items="${model.listResult}">
											<tr>
												<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>		
												<td>${item.title}</td>
												<td>${item.content}</td>
												<td>
												<c:url var="addNewsURL" value="/addnews">
																	<c:param name="id" value="${item.id}"/>															
												</c:url>																
												<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
														title="Cập nhật thương hiệu" href='${addNewsURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
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
		            		$('#limit').val(5);
							$('#page').val(page);
							$('#formSubmit').submit();
						}
		            }
		        });
		    });
			function warningBeforeDelete()
			{
				swal({
					  title: "Bạn có chắc không?",
					  text: "Once deleted, you will not be able to recover this imaginary file!",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
						  var ids = $('tbody input[type=checkbox]:checked').map(function () { 
					            return $(this).val();
					        }).get();
							deleteNews(ids);
					    swal("Xóa thành công", {
					      icon: "success",
					    });
					  } else {
					    swal("Thao tác đã hủy");
					  }
					});
			}
			function deleteNews(data) {
		        $.ajax({
		            url: '${newsAPI}',
		            type: 'DELETE',
		            contentType: 'application/json',
		            data: JSON.stringify(data),
		            success: function (result) {
		                window.location.href = "${NewsURL}?page=1&limit=5&message=delete_success";
		            },
		            error: function (error) {
		            	window.location.href = "${NewsURL}?page=1&limit=5&message=error_system";
		            } 
		        });
		    }
</script>
</body>
</html>