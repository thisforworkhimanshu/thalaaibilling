package com.user;

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
import com.mysql.jdbc.ResultSet;

/**
 * Servlet implementation class ChangePassServlet
 */
public class ChangePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		/*System.out.println(session.getAttribute("ID"));
		response.getWriter().println(session.getAttribute("ID").toString());*/
		int id = Integer.parseInt(session.getAttribute("ID").toString());
		Connection connection = null;
		PreparedStatement statement,stmt;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			connection.setAutoCommit(false);
			stmt = (PreparedStatement) connection.prepareStatement("select PassWord from user where UserId=?");
			stmt.setInt(1, id);
			ResultSet rs = (ResultSet) stmt.executeQuery();
			boolean status = rs.next();
			if(status){
				String pass = request.getParameter("oldpass");
				String dpass = rs.getString(1);
				if(pass.equals(dpass)==false){
					JOptionPane.showMessageDialog(null, "Old PassWord is Not Correct");
					response.sendRedirect("ChangePass.jsp");
				}else{
					try{
						statement = (PreparedStatement) connection.prepareStatement("update user set PassWord=? where UserId=?");
						statement.setString(1, request.getParameter("newpass"));
						statement.setInt(2, id);
						int i = statement.executeUpdate();
						if(i>0){
							JOptionPane.showMessageDialog(null, "Successfully Changed");
							connection.commit();
							if(session.getAttribute("UName")!=null){
								session.removeAttribute("UName");
								JOptionPane.showMessageDialog(null, "Login With new Credentials");
								response.sendRedirect("Index.jsp");
								/*response.sendRedirect("login.jsp");*/
							}
						}
					}catch(Exception e){
						connection.rollback();
						e.printStackTrace();
					}
				}
			}
		}catch (Exception e) {
			// TODO: handle exception
			try {
				connection.rollback();
				e.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
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
