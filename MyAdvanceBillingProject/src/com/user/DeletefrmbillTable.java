package com.user;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class DeletefrmbillTable
 */
public class DeletefrmbillTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletefrmbillTable() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection connection;
		PreparedStatement statement;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			statement = (PreparedStatement) connection.prepareStatement("delete from billtable where id=?");
			statement.setInt(1, Integer.parseInt(request.getParameter("id")));
			int i=statement.executeUpdate();
			if(i>0){
				JOptionPane.showMessageDialog(null, "Entry Deleted");
				response.sendRedirect("mybill.jsp");
			}
		}catch (Exception e) {
			// TODO: handle exception
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
