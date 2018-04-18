package com.user;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

/**
 * Servlet implementation class registeruser
 */
public class registeruser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public registeruser() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection connection=null;
		PreparedStatement statement,stmt;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			connection.setAutoCommit(false);
			
			stmt=(PreparedStatement) connection.prepareStatement("select UserName from user where UserName=?");
			stmt.setString(1, request.getParameter("uname"));
			ResultSet rs = (ResultSet) stmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(request.getParameter("uname"))){
					JOptionPane.showMessageDialog(null, "UserName Alredy Exist! Try with new Name");
					request.getRequestDispatcher("register.jsp").include(request, response);
				}
			}else{
				statement=(PreparedStatement) connection.prepareStatement("insert into user(UserName,PassWord,FirstName,LastName,MobileNumber,Emailid) values(?,?,?,?,?,?)");
				statement.setString(1, request.getParameter("uname"));
				statement.setString(2, request.getParameter("txtPass"));
				statement.setString(3, request.getParameter("txtFName"));
				statement.setString(4, request.getParameter("txtLName"));
				statement.setString(5, request.getParameter("cellNumber"));
				statement.setString(6, request.getParameter("eMail"));
				int i = statement.executeUpdate();
				if(i>0){
						JOptionPane.showMessageDialog(null, "You are register successfully! Now Login With Your details");
						connection.commit();
						response.sendRedirect("Index.jsp");
				}
			}
		}catch(Exception e){
			try {
				connection.rollback();
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
