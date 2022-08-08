<%@page contentType="text/html" pageEncoding="UTF-8"%>
<a onclick="window.history.go(-1); return false;" class="my-3"><i
	class="fa-solid fa-left-long"></i> Back</a>
<div
	class="app-card shadow-sm d-flex flex-column justify-content-center p-5">
	<form method="post" action="/detailsClass?ClassId=${Data.ClassId}"
		class="g-3 needs-validation">
		<h4>Details Class</h4>
		<p>Please complete all information</p>
		<div class="mb-3">
			<label for="StudentId" class=" form-label">ClassId:</label> <input
				type="text" class="form-control" name="ClassId" id="ClassId"
				placeholder="ClassId" value="${Data.ClassId}" readonly>
			<div class="valid-feedback">Looks good!</div>
		</div>
		<div class="mb-3">
			<label for="NameClass" class=" form-label">NameClass:</label> <input
				type="text" class="form-control" name="NameClass" id="NameClass"
				placeholder="NameClass" value="${Data.NameClass}" readonly>
			<div class="valid-feedback">Looks good!</div>
		</div>
		<a class="btn btn-info text-white"
										href="/editClass?ClassId=${Data.ClassId}">Edit</a>
	</form>
</div>


