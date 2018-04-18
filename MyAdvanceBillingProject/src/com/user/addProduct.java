package com.user;

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
 * Servlet implementation class addProduct
 */
public class addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addProduct() {
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
		Savepoint Savepoint=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			Savepoint = connection.setSavepoint("savepoint");
			connection.setAutoCommit(false);
			/*statement = (PreparedStatement) connection.prepareStatement("insert into product(ProductId,ProductName,ProductPrice,UserName) values(?,?,?,?)");*/
			statement = (PreparedStatement) connection.prepareStatement("insert into product(ProductId,ProductName,ProductPrice) values(?,?,?)");
			statement.setString(1,request.getParameter("pid") );
			statement.setString(2,request.getParameter("pname"));
			statement.setFloat(3, Float.parseFloat(request.getParameter("pprice")));
			/*statement.setString(4, request.getSession().getAttribute("UName").toString());*/
			
			int i = statement.executeUpdate();
			if(i>0){
				JOptionPane.showMessageDialog(null, "Successfully Added");
				connection.commit();
				response.sendRedirect("addProduct.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				connection.rollback(Savepoint);
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
