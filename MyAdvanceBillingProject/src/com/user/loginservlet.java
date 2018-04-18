package com.user;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class loginservlet
 */
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginservlet() {
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
		boolean status = false;
		String uname= request.getParameter("txtName");
		String upass= request.getParameter("txtPass");
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			statement=(PreparedStatement) connection.prepareStatement("select * from user where UserName=? and PassWord=?");
			statement.setString(1,uname);
			statement.setString(2, upass);
			ResultSet rs =statement.executeQuery();
			status = rs.next();
			if(status==true){
					int id = rs.getInt(1);
					System.out.println(id);
					HttpSession session = request.getSession();
					session.setMaxInactiveInterval(20*60*60);
					session.setAttribute("ID", id);
					session.setAttribute("UName", uname);
					session.setAttribute("UPass", upass);
					response.sendRedirect("login.jsp");
			}else{
					response.sendRedirect("checkProfile.jsp");
			}
		}catch(Exception e){
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
