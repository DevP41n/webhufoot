<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="productURL" value="/listproduct" />
<c:url var="addproductURL" value="/addproduct" />
<c:url var="productAPI" value="/api/product" />
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
								<h5>Sản Phẩm</h5>
								<div class="card-header-right">								
								</div>
							</div>
					<div class="card-block">
					<c:if test="${not empty message}">
						<div class="alert alert-${alert}">
  							${message}
						</div>
					</c:if>
						
						<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model" enctype="multipart/form-data">	
							<div class="form-group row">
								<label for="categoryCode" class="col-sm-2 col-form-label">Thương Hiệu:</label>
								<div class="col-sm-10">
									<form:select path="categoryCode" id="categoryCode">
							  	 		<form:option value="" label="-- Chọn thương hiệu --"/>
							  	 		<form:options items="${categories}"/>
							  	 	</form:select>
								</div>
							</div>	
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Tên Sản Phẩm</label>
								<div class="col-sm-10">
									<form:input path="productname" class="form-control"
										placeholder="Nhập tên sản phẩm"/>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Giá Sản Phẩm</label>
								<div class="col-sm-10">
									<form:input path="productprice" class="form-control"
										placeholder="Nhập giá sản phẩm"/>
								</div>
							</div>			
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Upload Ảnh</label>
								<div class="col-sm-10">
									<input type="file" class="form-control" id="productimage" name="productimage">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Chi Tiết Sản Phẩm</label>
								<div class="col-sm-10">
									<form:textarea path="productcontent" rows="5" cols="5" class="form-control"
										placeholder="Default textarea" id="productcontent" />
								</div>
							</div>
							<form:hidden path="id" id="productId"/>
							<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
											<c:if test="${not empty model.id}">
												<button class="btn btn-info" type="button" id="btnAddOrUpdateProduct">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Cập nhật sản phẩm
												</button>
											</c:if>
											<c:if test="${empty model.id}">
												<button class="btn btn-info" type="button" id="btnAddOrUpdateProduct">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Thêm sản phẩm
												</button>
											</c:if>

											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="button" onclick= "window.location.href = '${productURL}?page=1&limit=5';">
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
		editor = CKEDITOR.replace('productcontent');
	});

	$('#btnAddOrUpdateProduct').click(function(e) {
		e.preventDefault();
		var data = {};
		var formData = $('#formSubmit').serializeArray();
		$.each(formData, function(i, v) {
			data["" + v.name + ""] = v.value;
		});
		data["productcontent"] = editor.getData();
		var id = $('#productId').val();
		if (id == "") {
			addProduct(data);
		} else {
			updateProduct(data);
		}
	});

	function addProduct(data) {
		$
				.ajax({
					url : '${productAPI}',
					type : 'POST',
					contentType : 'application/json',
					data : JSON.stringify(data),
					dataType : 'json',
					success : function(result) {
						window.location.href = "${addproductURL}?id="
								+ result.id + "&message=insert_success";
					},
					error : function(error) {
						window.location.href = "${productURL}?page=1&limit=5&message=error_system";
					}
				});
	}

	function updateProduct(data) {
		$.ajax({
			url : '${productAPI}',
			type : 'PUT',
			contentType : 'application/json',
			data : JSON.stringify(data),
			dataType : 'json',
			success : function(result) {
				window.location.href = "${addproductURL}?id=" + result.id
						+ "&message=update_success";
			},
			error : function(error) {
				window.location.href = "${addproductURL}?id=" + result.id
						+ "&message=error_system";
			}
		});
	}
</script>
</body>
</html>