package Result;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import ClassR.ClassR;
import subject.Subject;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/result", "/Result", "/ketqua" })
public class ResultServlet extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet HomeServlet</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet HomeServlet at " + request.getContextPath() + "</h1>");
			out.println("</body>");
			out.println("</html>");
		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on
	// the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// processRequest(request, response);

		try {

//			String a = request.getParameter("Page");
			String s = request.getParameter("search");
//			if (a == null) {
//				a = "1";
//			}
			if (s == null) {
				s = "";
			}
//			int page = Integer.parseInt(a);
//			int pageSize = 5;
//			int count = pageSize * (page - 1);
//
//			String column = request.getParameter("column");
//			String sort = request.getParameter("sort");
//			if (column == null && sort == null) {
//				column = "resultId";
//				sort = "ASC";
//			}
//			request.setAttribute("DataTotal", Result.Pagination(pageSize, page));
			String subject = request.getParameter("NameSubject");
			if(subject==null){
				subject="";
			}else{
				s=subject;
			}
        	String NameClass = request.getParameter("NameClass");
        	if(NameClass == null){
        		NameClass="";
        	}else{
        		s=NameClass;
        	}
			String n="";
			String min = request.getParameter("Min");
			String max = request.getParameter("Max");
			if (min == null) {
				min = "0";
			}
			if (max == null) {
				max = "10";
			}
			int Min = Integer.parseInt(min);
			int Max = Integer.parseInt(max);
			if(Min>Max){
				 Min = Integer.parseInt(max);
				 Max = Integer.parseInt(min);
			}
			request.setAttribute("DataClass", ClassR.List(n));
			request.setAttribute("DataSubject", Subject.List(n));
			request.setAttribute("DataTable", Result.List(s,Min,Max));
			
			request.setAttribute("web_title", "List Result");
			request.setAttribute("web_content", "Result/result.jsp");
			request.getRequestDispatcher("/WEB-INF/jsp/layout.jsp").forward(request, response);
		} catch (Exception ex) {
			// ex.printStackTrace();
			System.out.println("SQL Error: " + ex.getMessage());
		}
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request
	 *            servlet request
	 * @param response
	 *            servlet response
	 * @throws ServletException
	 *             if a servlet-specific error occurs
	 * @throws IOException
	 *             if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
