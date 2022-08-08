<%@ page pageEncoding="UTF-8" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<a onclick="window.history.go(-1); return false;" class="my-3"><i class="fa-solid fa-left-long"></i> Back</a>
<div class="app-card shadow-sm d-flex flex-column justify-content-center p-5">

	<form method="post" action="/add" class="g-3 needs-validation">
		<h4>Add a new Student</h4>
		<p>Please complete all information</p>
		<div class="mb-3">
			<label>StudentId:</label> <input type="number" class="form-control"
				name="StudentId" placeholder="StudentId" value="" required>
			<div class="valid-feedback">Please enter a StudentId!</div>
		</div>
		<div class="mb-3">
			<label>NameStudent:</label> <input type="text" class="form-control"
				name="Name" placeholder="NameStudent" value="" required>
			<div class="valid-feedback">Looks good!</div>
		</div>
		<div class="mb-3">
			<label>NameClass:</label> <select class="form-select" name="ClassId"
				aria-label="select example" required>
				<option value="">Open this select Class Menu</option>
				<c:forEach var="DataCLass" items="${requestScope.DataClass}">
					<option value="${DataCLass.ClassId}">${DataCLass.NameClass}</option>
				</c:forEach>
			</select>
			<div class="invalid-feedback">Please choose one</div>
		</div>
		<br class="clear_float">

		<button class="btn btn-primary text-white">Add</button>

	</form>
</div>





