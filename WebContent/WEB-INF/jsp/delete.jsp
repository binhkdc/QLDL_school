<%@page contentType="text/html" pageEncoding="UTF-8"%>
<a onclick="window.history.go(-1); return false;" class="my-3"><i class="fa-solid fa-left-long"></i> Back</a>
<div class="app-card shadow-sm d-flex flex-column justify-content-center px-5 p-5">
		<form method="post" action="/delete?id=${Data.StudentId}" class="g-3 needs-validation">
			<h4>Delete Student</h4>
			<p>Please complete all information</p>
			  <div class="mb-3">
			  	<label for="StudentId" class=" form-label">StudentId:</label>
			    <input type="text" class="form-control" name="StudentId" id="StudentId"  placeholder="StudentId" value="${Data.StudentId}" readonly>
			    <div class="valid-feedback">
			      Looks good!
			    </div>
			  </div>
			  <div class="mb-3">
			  	<label for="ClassId" class=" form-label">ClassId:</label>
			    <input type="text" class="form-control" name="ClassId" id="ClassId"  placeholder="ClassId" value="${Data.ClassId}" required readonly>
			    <div class="valid-feedback">
			      Looks good!
			    </div>
			  </div>
			  <div class="mb-3">
			  <label for="NameStudent" class=" form-label">NameStudent:</label>
			    <input type="text" class="form-control" name="Name" id="NameStudent" placeholder="NameStudent" value="${Data.Name}" required readonly>
			    <div class="valid-feedback">
			      Looks good!
			    </div>
			  </div>
			  <label style="width: 100%;text-align: left;">Are you sure want to delete?</label>
			<br class="clear_float">		
			<button class="btn btn-danger text-white">Delete</button>
		</form>
	</div>

