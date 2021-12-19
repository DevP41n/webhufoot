<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="categoryURL" value="/listbrand" />
<c:url var="addbrandURL" value="/addbrand" />
<c:url var="categoryAPI" value="/api/category" />
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
								<h5>Thương Hiệu</h5>
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
								<label class="col-sm-2 col-form-label">Tên Thương Hiệu</label>
								<div class="col-sm-10">
									<form:input path="categoryname" class="form-control"
										placeholder="Nhập tên thương hiệu"/>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label">Mã Thương Hiệu</label>
								<div class="col-sm-10">
									<form:input path="categorycode" class="form-control"
										placeholder="Nhập mã thương hiệu"/>
								</div>
							</div>			
							<form:hidden path="id" id="brandId"/>
							<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
											<c:if test="${not empty model.id}">
												<button class="btn btn-info" type="button" id="btnAddOrUpdateBrand">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Cập nhật thương hiệu
												</button>
											</c:if>
											<c:if test="${empty model.id}">
												<button class="btn btn-info" type="button" id="btnAddOrUpdateBrand">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Thêm thương hiệu
												</button>
											</c:if>

											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="button" onclick= "window.location.href = '${categoryURL}?page=1&limit=5';">
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
	$('#btnAddOrUpdateBrand').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
	    var id = $('#brandId').val();
	    if (id == "") {
	    	addBrand(data);
	    } else {
	    	updateBrand(data);
	    }
	});
	
	function addBrand(data) {
		$.ajax({
            url: '${categoryAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${addbrandURL}?id="+result.id+"&message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${categoryURL}?page=1&limit=5&message=error_system";
            }
        });
	}
	
	function updateBrand(data) {
		$.ajax({
            url: '${categoryAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${addbrandURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${addbrandURL}?id="+result.id+"&message=error_system";
            }
        });
	}
	
</script>
</body>
</html>