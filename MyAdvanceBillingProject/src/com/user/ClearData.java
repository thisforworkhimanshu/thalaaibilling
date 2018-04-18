package com.user;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Savepoint;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class ClearData
 */
public class ClearData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClearData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection connection=null;
		PreparedStatement statement;
		Savepoint savepoint=null;
		/*HttpSession session = request.getSession(true);*/
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			savepoint = connection.setSavepoint("Savepoint");
			connection.setAutoCommit(false);
			/*statement = (PreparedStatement) connection.prepareStatement("truncate table billtable");*/
			statement = (PreparedStatement) connection.prepareStatement("delete from billtable where UserName=?");
			statement.setString(1, request.getSession().getAttribute("UName").toString());
			statement.executeUpdate();
			connection.commit();
			response.sendRedirect("mybill.jsp");
			
		}catch (Exception e) {
			// TODO: handle exception
			try {
				connection.rollback(savepoint);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
