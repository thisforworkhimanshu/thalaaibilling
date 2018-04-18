package com.employe;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Savepoint;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class AddEmployeServlet
 */
public class AddEmployeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement statement;
		String name = request.getParameter("empname");
		String address = request.getParameter("eaddress");
		String cellnum = request.getParameter("ecellnum");
		String email = request.getParameter("eemail");
		Savepoint savepoint = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			connection.setAutoCommit(false);
			savepoint = connection.setSavepoint();
			/*statement = (PreparedStatement) connection.prepareStatement("insert into employe(EmployeName,EAddress,ECellNum,EEmail,UserName) value(?,?,?,?,?)");*/
			statement = (PreparedStatement) connection.prepareStatement("insert into employe(EmployeName,EAddress,ECellNum,EEmail) value(?,?,?,?)");
			statement.setString(1, name);
			statement.setString(2, address);
			statement.setString(3, cellnum);
			statement.setString(4, email);
			/*statement.setString(5, request.getSession().getAttribute("UName").toString());*/
			int i = statement.executeUpdate();
			if(i>0){
				JOptionPane.showMessageDialog(null, "Successfully Added");
				connection.commit();
				response.sendRedirect("addEmploye.jsp");
			}
		}catch (Exception e) {
			// TODO: handle exception
			try {
				connection.rollback(savepoint);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				response.getWriter().println(e1);
			}
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				response.getWriter().println(e);
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
