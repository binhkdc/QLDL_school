<%@page contentType="text/html" pageEncoding="UTF-8"%>
<a onclick="window.history.go(-1); return false;" class="my-3"><i class="fa-solid fa-left-long"></i> Back</a>
<div class="app-card shadow-sm d-flex flex-column justify-content-center px-5 p-5">
		<form method="post" action="/details?StudentId=${Data.StudentId}" class="g-3 needs-validation">
			<h4>Details Student</h4>
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
			    <input type="text" class="form-control" name="ClassId" id="ClassId"  placeholder="ClassId" value="${Data.ClassId}" readonly>
			    <div class="valid-feedback">
			      Looks good!
			    </div>
			  </div>
			  <div class="mb-3">
			  <label for="NameStudent" class=" form-label">NameStudent:</label>
			    <input type="text" class="form-control" name="Name" id="NameStudent" placeholder="NameStudent" value="${Data.Name}" readonly>
			    <div class="valid-feedback">
			      Looks good!
			    </div>
			  </div>
			  <a class="btn btn-info text-white"
										href="/edit?StudentId=${Data.StudentId}">Edit</a>
		</form>
	</div>


