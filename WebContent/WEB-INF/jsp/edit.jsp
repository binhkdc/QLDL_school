<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<a onclick="window.history.go(-1); return false;" class="my-3"><i class="fa-solid fa-left-long"></i> Back</a>
<div class="app-card shadow-sm d-flex flex-column justify-content-center px-5 p-5">
		<form method="post" action="/edit?StudentId=${Data.StudentId}" class="g-3 needs-validation">
			<h4>Edit Student</h4>
			<p>Please complete all information</p>
			  <div class="mb-3">
			  	<label for="StudentId" class=" form-label">StudentId:</label>
			    <input type="text" class="form-control" name="StudentId" id="StudentId"  placeholder="StudentId" value="${Data.StudentId}" readonly>
			    <div class="valid-feedback">
			      Looks good!
			    </div>
			  </div>
			  <div class="mb-3">
			  	<label>NameClass:</label> <select class="form-select"
					name="ClassId" aria-label="select example" required>
					<c:set var="ClassHere" value="${Data.ClassId}" />
					<c:forEach var="DataCLass" items="${requestScope.DataClass}">
					<c:set var="ClassData" value="${DataCLass.ClassId}" />
						<c:choose>
							<c:when test="${ClassHere == ClassData}">
								<option value="${DataCLass.ClassId}" selected>${DataCLass.NameClass}</option>
							</c:when>
							<c:otherwise>
								<option value="${DataCLass.ClassId}">${DataCLass.NameClass}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			  <label for="NameStudent" class=" form-label">NameStudent:</label>
			    <input type="text" class="form-control" name="Name" id="NameStudent" placeholder="NameStudent" value="${Data.Name}" required>
			    <div class="valid-feedback">
			      Looks good!
			    </div>
			  </div>
			<br class="clear_float">		
			<button class="btn btn-primary text-white">Save</button>
		</form>
	</div>


