package com.user;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.swing.JOptionPane;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class deleteProduct
 */
public class deleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection connection=null;
		PreparedStatement statement,st;
		String pname= request.getParameter("prod");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			connection.setAutoCommit(false);
			statement = (PreparedStatement)connection.prepareStatement("select * from product where ProductName=?");
			statement.setString(1, pname);
			ResultSet rs = statement.executeQuery();
			if(rs.next()){
				String id = rs.getString(1);
				try{
					st = (PreparedStatement)connection.prepareStatement("delete from product where ProductId=?");
					st.setString(1, id);
					int i= st.executeUpdate();
					if(i>0){
					
							JOptionPane.showMessageDialog(null, "Successfully Deleted");
							connection.commit();
							response.sendRedirect("deleteProduct.jsp");
					}
				}catch(Exception e){
					connection.rollback();
					e.printStackTrace();
				}
			}
		}catch (Exception e) {
			// TODO: handle exception
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
