package com.user;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class updateProduct
 */
public class updateProduct extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProduct() {
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
		HttpSession session = request.getSession();
		String name = session.getAttribute("prodname").toString();
		String pname = request.getParameter("pname");
		float price =Float.parseFloat(request.getParameter("pprice").toString()) ;
		String id;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			connection.setAutoCommit(false);
			statement = (PreparedStatement)connection.prepareStatement("select * from product where ProductName=?");
			statement.setString(1, name);
			ResultSet rs = statement.executeQuery();
			if(rs.next()){
				id = rs.getString(1);
				try{
					st = (PreparedStatement)connection.prepareStatement("update product set ProductName=?, ProductPrice=? where ProductId=?");
					st.setString(1, pname);
					st.setFloat(2, price);
					st.setString(3,id);
					int i = st.executeUpdate();
					if(i>0){
						JOptionPane.showMessageDialog(null, "Successfully Updated");
						connection.commit();
						response.sendRedirect("find.jsp");
					}
				}catch (Exception e) {
					// TODO: handle exception
					connection.rollback();
					e.printStackTrace();
				}
			}else{
				response.getWriter().print("Unknown error Occured");
			}
		}catch (Exception e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// TODO: handle exception
			
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
