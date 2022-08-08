<%@ page pageEncoding="UTF-8" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<a onclick="window.history.go(-1); return false;" class="my-3"><i
	class="fa-solid fa-left-long"></i> Back</a>
<div
	class="app-card shadow-sm d-flex flex-column justify-content-center p-5">

	<form id="basic-form" method="post" action="/addResult" class="g-3">
		<div class="text-center">
			<h4>Add a new Result</h4>
			<p>Please complete all information</p>
		</div>
		<div class="mb-3">
			<label>Point:</label> <input type="text" class="form-control"
				name="Point" id="Point" placeholder="Point" value="">
			<p id="demo" class="text-danger"></p>
			<div class="valid-feedback">Looks good!</div>
		</div>
		<div class="mb-3">
			<input class="btn btn-outline form-control border"
				value="Click to this select student" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapseExample1"
				aria-expanded="false" aria-controls="collapseExample">
			<div class="collapse" id="collapseExample1">
				<div class="card card-body">
					<p class="font-weight-bold">
						<input class="form-control" id="myInput" type="text"
							placeholder="Search..">
					</p>
					<select class="form-select" name="StudentId" size="5"
						aria-label="select example" required>


						<c:forEach var="DataStudent" items="${requestScope.DataStudent}">
							<!--m? vòng l?p for -->
							<option value="${DataStudent.StudentId}">${DataStudent.Name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		<div class="mb-3">
			<label>NameSubject:</label> <select class="form-select"
				name="SubjectId" aria-label="select example" required>
				<option value="">Open this select Subject Menu</option>

				<c:forEach var="DataSubject" items="${requestScope.DataSubject}">
					<!--m? vòng l?p for -->
					<option value="${DataSubject.SubjectId}">${DataSubject.NameSubject}</option>
				</c:forEach>
			</select>
			<div class="invalid-feedback">Please choose one</div>
		</div>
		<button class="btn btn-primary text-white " id="myButton"
			onclick="myFunction()">Add</button>

	</form>

</div>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
	$(document).ready(
			function() {
				$("#myInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$(".form-select option").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
			});
</script>