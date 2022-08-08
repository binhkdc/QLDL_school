<%@page contentType="text/html" pageEncoding="UTF-8"%>
<a onclick="window.history.go(-1); return false;" class="my-3"><i class="fa-solid fa-left-long"></i> Back</a>
<div class="app-card shadow-sm d-flex flex-column justify-content-center p-5">
<div class=" justify-content-center  row">
	<div class="col-6 bg-light  m-5 px-5 py-3 border">
		<form method="post" action="/deleteSubject?SubjectId=${Data.SubjectId}" class="g-3 needs-validation">
			<h4>Delete Subject</h4>
			<p>Please complete all information</p>
			  <div class="mb-3">
					<label>SubjectId</label>
				<input type="number" class="form-control" name="SubjectId" value="${Data.SubjectId}" readonly/>
			    <div class="valid-feedback">
			      Looks good!
			    </div>
			  </div>
			  <div class="mb-3">
        <label>NameSubject: </label>
		<input type="text" class="form-control" name="NameSubject" value="${Data.NameSubject}"readonly/>
			    <div class="valid-feedback">
			      Looks good!
			    </div>
			  </div>	
						<label style="width: 100%;text-align: left;">Are you sure want to delete?</label>
			<button class="btn btn-danger text-white">Delete</button>
		</form>
	</div>
</div>
</div>