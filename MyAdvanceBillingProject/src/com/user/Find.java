package com.user;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

/**
 * Servlet implementation class Find
 */
public class Find extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Find() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pname = request.getParameter("prod");
		HttpSession session = request.getSession();
		Connection connection;
		PreparedStatement statement;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			statement = (PreparedStatement)connection.prepareStatement("select * from product where ProductName=?");
			statement.setString(1, pname);
			ResultSet rs = (ResultSet) statement.executeQuery();
			if(rs.next()){
				float price = rs.getFloat(3);
				session.setAttribute("pprice", price);
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		session.setAttribute("prodname", pname);
		response.sendRedirect("updateProduct.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
