<%@page contentType="text/html" pageEncoding="UTF-8"%>
<a onclick="window.history.go(-1); return false;" class="my-3"><i
	class="fa-solid fa-left-long"></i> Back</a>
<div
	class="app-card shadow-sm d-flex flex-column justify-content-center p-5">
	<form method="post" action="/editSubject?SubjectId=${Data.SubjectId}"
		class="g-3 needs-validation">
		<h4>Edit Subject</h4>
		<p>Please complete all information</p>
		<div class="mb-3">
			<label>SubjectId</label> <input type="number" class="form-control"
				name="SubjectId" value="${Data.SubjectId}" readonly />
			<div class="valid-feedback">Looks good!</div>
		</div>
		<div class="mb-3">
			<label>NameSubject: </label> <input type="text" class="form-control"
				name="NameSubject" value="${Data.NameSubject}" />
			<div class="valid-feedback">Looks good!</div>
		</div>

		<br class="clear_float">
		<button class="btn btn-primary text-white">Save</button>
	</form>
</div>