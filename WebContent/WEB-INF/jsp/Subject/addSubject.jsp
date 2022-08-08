<%@ page pageEncoding="UTF-8" contentType="text/html" %>
<a onclick="window.history.go(-1); return false;" class="my-3"><i class="fa-solid fa-left-long"></i> Back</a>
<div class="app-card shadow-sm d-flex flex-column justify-content-center p-5">
		<form method="post" action="/addSubject" class="g-3 needs-validation">
				<h4>Add a new Subject</h4>
				<p>Please complete all information</p>
			  <div class="mb-3">
			  	<label>SubjectId:</label>
			    <input type="number" class="form-control" name="SubjectId"  placeholder="SubjectId" value="" required>
			    <div class="valid-feedback">
			      Looks good!
			    </div>
			  </div>
			  <div class="mb-3">
			  	<label>NameSubject:</label>
			    <input type="text" class="form-control" name="NameSubject"  placeholder="NameSubject" value="" required>
			    <div class="valid-feedback">
			      Looks good!
			    </div>
			  </div>
			<button class="btn btn-success text-white">Save</button>
	
		</form>
</div>