<%@page contentType="text/html" pageEncoding="UTF-8"%>
<a onclick="window.history.go(-1); return false;" class="my-3"><i
	class="fa-solid fa-left-long"></i> Back</a>
<div
	class="app-card shadow-sm d-flex flex-column justify-content-center p-5">
	<form method="post"
		action="/detailsSubject?SubjectId=${Data.SubjectId}"
		class="g-3 needs-validation">
		<div class="text-center">
			<h4>Details Subject</h4>
			<p>Please complete all information</p>
		</div>
		<div class="mb-3">
			<label for="SubjectId" class=" form-label">SubjectId:</label> <input
				type="text" class="form-control" name="SubjectId" id="SubjectId"
				placeholder="SubjectId" value="${Data.SubjectId}" readonly>
			<div class="valid-feedback">Looks good!</div>
		</div>
		<div class="mb-3">
			<label for="NameSubject" class=" form-label">NameSubject:</label> <input
				type="text" class="form-control" name="NameSubject" id="NameSubject"
				placeholder="NameSubject" value="${Data.NameSubject}" readonly>
			<div class="valid-feedback">Looks good!</div>
		</div>
		<a class="btn btn-info text-white"
										href="/editSubject?SubjectId=${Data.SubjectId}">Edit</a>
	</form>
</div>


