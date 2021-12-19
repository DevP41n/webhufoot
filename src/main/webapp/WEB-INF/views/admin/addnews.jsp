<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="newsURL" value="/listnews" />
<c:url var="addnewsURL" value="/addnews" />
<c:url var="newsAPI" value="/api/news" />
<!DOCTYPE html>
<html>
<head>

</head>
<body>

	<div class="pcoded-content">
			<div class="pcoded-inner-content">
		<!-- Page-header start -->
					<div class="main-body">
				<div class="page-wrapper">
					<!-- Page-body start -->
					<div class="page-body">
		<div class="row">
			<div class="col-sm-12">
				<!-- Basic Form Inputs card start -->
				<div class="card">
				<div class="card-header">
								<h5>Tin tức</h5>
								<div class="card-header-right">								
								</div>
							</div>
					<div class="card-block">
					<c:if test="${not empty message}">
						<div class="alert alert-${alert}">
  							${message}
						</div>
					</c:if>
						
						<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model">	
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Tiêu đề</label>
								<div class="col-sm-10">
									<form:input path="title" class="form-control"
										placeholder="Nhập tiêu đề"/>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Upload Ảnh</label>
								<div class="col-sm-10">
									<input type="file" class="form-control" id=thumbnail name="thumbnail">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Nội dung</label>
								<div class="col-sm-10">
									<form:textarea path="content" rows="5" cols="5" class="form-control"
										placeholder="Default textarea" id="content" />
								</div>
							</div>			
							<form:hidden path="id" id="newsId"/>
							<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
											<c:if test="${not empty model.id}">
												<button class="btn btn-info" type="button" id="btnAddOrUpdateBrand">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Cập nhật tin tức
												</button>
											</c:if>
											<c:if test="${empty model.id}">
												<button class="btn btn-info" type="button" id="btnAddOrUpdateBrand">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Thêm tin tức
												</button>
											</c:if>

											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="button" onclick= "window.location.href = '${newsURL}?page=1&limit=5';">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												Hủy
											</button>
							</div>		
						</div>
						</form:form>
					</div>
				</div>
				<!-- Basic Form Inputs card end -->
			</div>
		</div>
	</div>
	
	
	</div>
				<!-- Basic Form Inputs card end -->
			</div>
		</div>
	</div>
<script>
var editor = '';
$(document).ready(function() {
	editor = CKEDITOR.replace('content');
});
	
	$('#btnAddOrUpdateBrand').click(function(e) {
		e.preventDefault();
		var data = {};
		var formData = $('#formSubmit').serializeArray();
		$.each(formData, function(i, v) {
			data["" + v.name + ""] = v.value;
		});
		data["content"] = editor.getData();
		var id = $('#newsId').val();
		if (id == "") {
			addNews(data);
		} else {
			updateNews(data);
		}
	});

	function addNews(data) {
		$
				.ajax({
					url : '${newsAPI}',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						window.location.href = "${addnewsURL}?id=" + result.id
								+ "&message=insert_success";
					},
					error : function(error) {
						window.location.href = "${newsURL}?page=1&limit=5&message=error_system";
					}
				});
	}

	function updateNews(data) {
		$.ajax({
			url : '${newsAPI}',
			type : 'PUT',
			contentType : 'application/json',
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(result) {
				window.location.href = "${addnewsURL}?id=" + result.id
						+ "&message=update_success";
			},
			error : function(error) {
				window.location.href = "${addnewsURL}?id=" + result.id
						+ "&message=error_system";
			}
		});
	}
</script>
</body>
</html>