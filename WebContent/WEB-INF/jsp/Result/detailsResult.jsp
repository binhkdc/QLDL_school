<%@page contentType="text/html" pageEncoding="UTF-8"%>
<a onclick="window.history.go(-1); return false;" class="my-3"><i
	class="fa-solid fa-left-long"></i> Back</a>
<div
	class="app-card shadow-sm d-flex flex-column justify-content-center p-5">
	<form method="post" action="/details?ResultId=${Data.ResultId}"
		class="g-3 needs-validation">
		<div class="text-center">
			<h4>Details Result</h4>
			<p>Please complete all information</p>
		</div>
		<div class="mb-3">
			<label for="ResultId" class=" form-label">ResultId:</label> <input
				type="text" class="form-control" name="ResultId" id="ResultId"
				placeholder="ResultId" value="${Data.ResultId}" readonly>
			<div class="valid-feedback">Looks good!</div>
		</div>
		<div class="mb-3">
			<label for="Point" class=" form-label">Point:</label> <input
				type="text" class="form-control" name="Point" id="Point"
				placeholder="Point" value="${Data.Point}" readonly>
			<div class="valid-feedback">Looks good!</div>
		</div>
		<div class="mb-3">
			<label for="StudentId" class=" form-label">StudentId:</label> <input
				type="text" class="form-control" name="StudentId" id="StudentId"
				placeholder="StudentId" value="${Data.StudentId}" readonly>
			<div class="valid-feedback">Looks good!</div>
		</div>
		<div class="mb-3">
			<label for="SubjectId" class=" form-label">SubjectId:</label> <input
				type="text" class="form-control" name="SubjectId" id="SubjectId"
				placeholder="SubjectId" value="${Data.SubjectId}" readonly>
			<div class="valid-feedback">Looks good!</div>
		</div>
		<a href="/editResult?ResultId=${Data.ResultId}" class="btn btn-danger text-white">Edit</a>
	</form>
</div>
