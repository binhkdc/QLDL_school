<%@page contentType="text/html" pageEncoding="UTF-8"%>

<a onclick="window.history.go(-1); return false;" class="my-3"><i
	class="fa-solid fa-left-long"></i> Back</a>
<div
	class="app-card shadow-sm d-flex flex-column justify-content-center p-5">
	<form method="post" action="/deleteClass?ClassId=${Data.ClassId}"
		class="g-3 needs-validation">
		<h4>Delete Class</h4>
		<p>Please complete all information</p>
		<div class="mb-3">
			<label>ClassId:</label> <input type="number" class="form-control"
				name="ClassId" value="${Data.ClassId}" readonly />
			<div class="valid-feedback">Looks good!</div>
		</div>
		<div class="mb-3">
			<label>NameClass: </label> <input type="text" class="form-control"
				name="NameClass" value="${Data.NameClass}" readonly />
			<div class="valid-feedback">Looks good!</div>
		</div>
		<label style="width: 100%; text-align: left;">Are you sure
			want to delete?</label>
		<button class="btn btn-danger text-white">Delete</button>
	</form>
</div>
