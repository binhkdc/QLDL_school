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
		<h1 class="app-page-title mb-0">Student</h1>
	</div>
	<div class="col-auto">
		<div class="page-utilities">
			<div
				class="row g-2 justify-content-start justify-content-md-end align-items-center">
				<div class="col-auto">
					<select name="forma" class="form-select"
						aria-label="Default select example"
						onchange="location = this.value;">
						<c:forEach var="Data" items="${requestScope.DataTable}">
							<c:set var="filter" value="${Data.Filter}" />
						</c:forEach>
						<c:choose>
							<c:when test="${filter == null}">
								<option value="home" selected>Default</option>
							</c:when>
							<c:otherwise>
								<option value="home">Default</option>
							</c:otherwise>
						</c:choose>
						<c:forEach var="Data" items="${requestScope.DataClass}">
							<c:set var="Class" value="${Data.NameClass}" />
							<c:choose>
								<c:when test="${filter == Class}">
									<option value="home?NameClass=${Data.NameClass}" selected>${Data.NameClass}</option>
								</c:when>
								<c:otherwise>
									<option value="home?NameClass=${Data.NameClass}">${Data.NameClass}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</div>
				<!--//col-->
				<div class="col-auto">
					<a class="btn btn-secondary" href="add" role="button"><i
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
					<table class="table app-table-hover mb-0 text-left"
						id="datatablesSimple" class="cell-border compact stripe">
						<thead>
							<tr>
								<th class="cell">StudentId</th>
								<th class="cell">NameClass</th>
								<th class="cell">NameStudent</th>
								<th class="cell">Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="Data" items="${requestScope.DataTable}">
								<tr>
									<td class="cell">${Data.StudentId}</td>
									<td class="cell">${Data.ClassId}</td>
									<td class="cell">${Data.Name}</td>
									<td class="cell"><a class="btn-sm app-btn-secondary"
										href="/edit?StudentId=${Data.StudentId}">Edit</a> <a
										class="btn-sm app-btn-secondary"
										href="/delete?StudentId=${Data.StudentId}">Delete</a> <a
										class="btn-sm app-btn-secondary"
										href="/details?StudentId=${Data.StudentId}">View</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a type="reset" href="home" class="btn btn-reset border form-control text-success">Reset</a>
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
								href="home?Page=${DataTotal.PrePage}">PrePage</a></li>
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
									href="home?Page=${Total}">${Total}</a></li>
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
								href="home?Page=${DataTotal.NextPage}">NextPage</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</nav>
		<!--//app-pagination-->

	</div>
	<!--//tab-pane-->
</div>
