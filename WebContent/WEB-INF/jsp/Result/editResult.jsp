<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<a onclick="window.history.go(-1); return false;" class="my-3"><i
	class="fa-solid fa-left-long"></i> Back</a>
<div
	class="app-card shadow-sm d-flex flex-column justify-content-center p-5">
	<form method="post" action="editResult?ResultId=${Data.ResultId}"
		class="g-3 needs-validation">
		<div class="text-center">
			<h4>Edit Result</h4>
			<p>Please complete all information</p>
		</div>
		<div class="mb-3">
			<label for="ResultId" class=" form-label">ResultId:</label> <input
				type="text" class="form-control" name="ResultId" id="ResultId"
				placeholder="StudentId" value="${Data.ResultId}" readonly>
			<div class="valid-feedback">Looks good!</div>
		</div>
		<div class="mb-3">
			<label for="Point" class=" form-label">Point:</label> <input
				type="text" class="form-control" name="Point" id="Point"
				placeholder="Point" value="${Data.Point}" required>
			<div class="valid-feedback">Looks good!</div>
		</div>
		<div class="mb-3">
			<label for="StudentId" class=" form-label">StudentId:</label> <input
				type="text" class="form-control" name="StudentId" id="StudentId"
				placeholder="StudentId" value="${Data.StudentId}" required>
			<div class="valid-feedback">Looks good!</div>
		</div>
		<div class="mb-3">
			<label for="NameSubject" class=" form-label">NameSubject:</label> <select
				class="form-select" name="SubjectId" aria-label="select example"
				required>
				<c:set var="SubjectHere" value="${Data.SubjectId}" />
				<c:forEach var="DataSubject" items="${requestScope.DataSubject}">
					<c:set var="SubjectData" value="${DataSubject.SubjectId}" />
					<c:choose>
						<c:when test="${SubjectHere == SubjectData}">
							<option value="${DataSubject.SubjectId}" selected>${DataSubject.NameSubject}</option>
						</c:when>
						<c:otherwise>
							<option value="${DataSubject.SubjectId}">${DataSubject.NameSubject}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</div>
		<br class="clear_float">
		<button class="btn btn-primary text-white">Save</button>
	</form>
</div>
