<%@page contentType="text/html" pageEncoding="UTF-8"%>
<a onclick="window.history.go(-1); return false;" class="my-3"><i
	class="fa-solid fa-left-long"></i> Back</a>
<div
	class="app-card shadow-sm d-flex flex-column justify-content-center p-5">
	<form method="post" action="/editClass?ClassId=${Data.ClassId}"
		class="g-3 needs-validation">
		<h4>Edit Class</h4>
		<p>Please complete all information</p>
		<div class="mb-3">
			<label>ClassId</label> <input type="number" class="form-control"
				name="ClassId" value="${Data.ClassId}" readonly />
			<div class="valid-feedback">Looks good!</div>
		</div>
		<div class="mb-3">
			<label>NameClass: </label> <input type="text" class="form-control"
				name="NameClass" value="${Data.NameClass}" />
			<div class="valid-feedback">Looks good!</div>
		</div>

		<br class="clear_float">
		<button class="btn btn-primary text-white">Save</button>
	</form>
</div>
