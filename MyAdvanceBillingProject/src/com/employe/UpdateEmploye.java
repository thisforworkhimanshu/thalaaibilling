package com.employe;

import java.io.IOException;
import java.sql.DriverManager;

import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class UpdateEmploye
 */
public class UpdateEmploye extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmploye() {
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
		String name = request.getParameter("empname");
		String address = request.getParameter("eadd");
		String cellnum = request.getParameter("ecellnum");
		String email = request.getParameter("eemail");
		HttpSession session = request.getSession();
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			connection.setAutoCommit(false);
			statement = (PreparedStatement) connection.prepareStatement("update employe set EmployeName=? , EAddress=?, ECellNum=?,EEmail=? where EmployeId=?");
			statement.setString(1, name);
			statement.setString(2, address);
			statement.setString(3, cellnum);
			statement.setString(4, email);
			statement.setString(5, (String) session.getAttribute("eid"));
			int i= statement.executeUpdate();
			if(i>0){
				JOptionPane.showMessageDialog(null, "Successfully Updated");
				session.removeAttribute("eid");
				connection.commit();
				response.sendRedirect("SearchEmploy.jsp");
			}
		}catch (Exception e) {
			// TODO: handle exception
			try {
				connection.commit();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
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
