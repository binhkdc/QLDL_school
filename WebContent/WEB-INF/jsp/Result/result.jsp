<%@ page pageEncoding="UTF-8" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${sessionScope.SUCCESS_MSG != null}">
	<div style="background: green; color: white;">
		${sessionScope.SUCCESS_MSG}
		<%
			session.setAttribute("SUCCESS_MSG", null);
		%>
	</div>
</c:if>
<div class="row g-3 mb-4 align-items-center justify-content-between">
	<div class="col-auto">
		<h1 class="app-page-title mb-0">Result</h1>
	</div>
	<div class="col-auto">
		<div class="page-utilities">
			<div
				class="row g-2 justify-content-start justify-content-md-end align-items-center">
				<div id="demo" class="col-auto collapse">
					<c:forEach var="Data" items="${requestScope.DataTable}">
						<c:set var="filter" value="${Data.Filter}" />
					</c:forEach>
					<form>
						<div class="row">
							<div class="col-auto">
								<input type="text" class="form-control" name="Min" value=""
									placeholder="from" required />
							</div>
							<div class="col-auto">
								<input type="number" class="form-control" Name="Max" value=""
									placeholder="to" required /> 
									<input type="hidden"
									class="form-control" Name="NameClass" value="${filter}"
									placeholder="to" required />
							</div>
							<div class="col-auto">
								<input type="submit" class="btn btn-secondary" value="filter">
							</div>
						</div>

					</form>
				</div>
				<div class="col-auto">
					<select name="forma" class="form-select"
						aria-label="Default select example"
						onchange="location = this.value;">

						<c:choose>
							<c:when test="${filter == null}">
								<option value="result" selected>Default</option>
							</c:when>
							<c:otherwise>
								<option value="result">Default</option>
							</c:otherwise>
						</c:choose>
						<c:forEach var="Data" items="${requestScope.DataClass}">
							<c:set var="Class" value="${Data.NameClass}" />
							<c:choose>
								<c:when test="${filter == Class}">
									<option value="result?NameClass=${Data.NameClass}" selected>${Data.NameClass}</option>
								</c:when>
								<c:otherwise>
									<option value="result?NameClass=${Data.NameClass}">${Data.NameClass}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
				<div class="col-auto">
					<select name="forma" class="form-select"
						aria-label="Default select example"
						onchange="location = this.value;">

						<c:choose>
							<c:when test="${filter == null}">
								<option value="result" selected>Default</option>
							</c:when>
							<c:otherwise>
								<option value="result">Default</option>
							</c:otherwise>
						</c:choose>
						<c:forEach var="Data" items="${requestScope.DataSubject}">
							<c:set var="Subject" value="${Data.NameSubject}" />
							<c:choose>
								<c:when test="${filter == Subject}">
									<option value="result?NameSubject=${Data.NameSubject}" selected>${Data.NameSubject}</option>
								</c:when>
								<c:otherwise>
									<option value="result?NameSubject=${Data.NameSubject}">${Data.NameSubject}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>

				<!--//col-->
				<div class="col-auto">
					<a class="btn btn-secondary" href="addResult" role="button"><i
						class="fa-solid fa-plus 2fx"></i></a>
				</div>
			</div>
			<!--//row-->
		</div>
		<!--//table-utilities-->
	</div>
	<!--//col-auto-->
</div>
<!--//row-->

<div class="tab-content" id="orders-table-tab-content">
	<div class="tab-pane fade show active" id="orders-all" role="tabpanel"
		aria-labelledby="orders-all-tab">
		<div class="app-card app-card-orders-table shadow-sm mb-5">
			<div class="app-card-body">
				<div class="table-responsive">
					<table id="datatablesSimple"
						class="table app-table-hover mb-0 text-left">
						<thead>
							<tr>
								<th class="cell">NameStudent</th>
								<th class="cell">NameClass</th>
								<th class="cell">NameSubject</th>
								<th class="cell">Point <a href="#demo"
									class="fa-solid fa-filter" data-bs-toggle="collapse"></a></th>
								<th class="cell">Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="Data" items="${requestScope.DataTable}">
								<tr>

									<td class="cell">${Data.StudentId}</td>
									<td class="cell">${Data.NameClass}</td>
									<td class="cell">${Data.SubjectId}</td>
									<td class="cell">${Data.Point}</td>
									<td class="cell"><a class="btn-sm app-btn-secondary"
										href="/editResult?ResultId=${Data.ResultId}">Edit</a> <a
										class="btn-sm app-btn-secondary"
										href="/deleteResult?ResultId=${Data.ResultId}">Delete</a> <a
										class="btn-sm app-btn-secondary"
										href="/detailsResult?ResultId=${Data.ResultId}">View</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a type="reset" href="result"
						class="btn btn-reset border form-control text-success">Reset</a>
				</div>
				<!--//table-responsive-->

			</div>
			<!--//app-card-body-->
		</div>
		<!--//app-card-->
		<nav class="app-pagination">
			<ul class="pagination justify-content-center">
				<c:forEach var="DataTotal" items="${requestScope.DataTotal}">
					<c:set var="PageHere" value="${DataTotal.PageHere}" />
					<c:choose>
						<c:when test="${PageHere == 1}">
							<li class="page-item disabled"><a class="page-link" href="#">PrePage</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="result?Page=${DataTotal.PrePage}">PrePage</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="Total" begin="1" end="${DataTotal.Page+1}">
						<c:set var="PageHere" value="${DataTotal.PageHere}" />
						<c:set var="Page" value="${Total}" />
						<c:choose>
							<c:when test="${PageHere == Page}">
								<li class="page-item active" aria-current="page"><span
									class="page-link">${Total}</span></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="result?Page=${Total}">${Total}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:set var="PageHere" value="${DataTotal.PageHere}" />
					<c:set var="Page" value="${DataTotal.Page}" />
					<c:choose>
						<c:when test="${PageHere == Page+1}">
							<li class="page-item disabled"><a class="page-link" href="#">NextPage</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="result?Page=${DataTotal.NextPage}">NextPage</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</nav>
		<!--//app-pagination-->

	</div>
	<!--//tab-pane-->
</div>

