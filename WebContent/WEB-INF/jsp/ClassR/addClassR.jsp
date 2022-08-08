<%@ page pageEncoding="UTF-8" contentType="text/html"%>

<a onclick="window.history.go(-1); return false;" class="my-3"><i
	class="fa-solid fa-left-long"></i> Back</a>
<div
	class="app-card shadow-sm d-flex flex-column justify-content-center p-5">
	<form method="post" action="/addClass" class="g-3 needs-validation">
		<div class="text-center">
			<h4>Add a new Class</h4>
			<p>Please complete all information</p>
		</div>
		<div class="mb-3">
			<label>ClassId:</label> <input type="number" class="form-control"
				name="ClassId" placeholder="ClassId" value="" required>
			<div class="valid-feedback">Looks good!</div>
		</div>
		<div class="mb-3">
			<label>NameClass:</label> <input type="text" class="form-control"
				name="NameClass" placeholder="NameClass" value="" required>
			<div class="valid-feedback">Looks good!</div>
		</div>
		<button class="btn btn-primary text-white">Add</button>

	</form>
</div>

