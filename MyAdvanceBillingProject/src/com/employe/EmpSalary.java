package com.employe;

import java.io.IOException;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

/**
 * Servlet implementation class EmpSalary
 */
public class EmpSalary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpSalary() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String eid = request.getParameter("eid");
		String ename = request.getParameter("ename");
		String salary = request.getParameter("salary");
		Connection connection;
		PreparedStatement statement,st;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection= (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			st= (PreparedStatement) connection.prepareStatement("select * from employe where EmployeId=?");
			st.setInt(1, Integer.parseInt(eid));
			ResultSet rs = (ResultSet) st.executeQuery();
			if(rs.next()){
				String empname = rs.getString(2);
				if(empname.equals(ename)==true){
					try{
						connection.setAutoCommit(false);
						statement = (PreparedStatement) connection.prepareStatement("update employe set ESalary =? where EmployeId=?");
						statement.setFloat(1, Float.parseFloat(salary));
						statement.setInt(2, Integer.parseInt(eid));
						int i = statement.executeUpdate();
						if(i>0){
							JOptionPane.showMessageDialog(null, "Successfully Added");
							connection.commit();
							response.sendRedirect("addPurchases.jsp");
						}
					}catch (Exception e) {
						// TODO: handle exception
						connection.rollback();
						e.printStackTrace();
					}
				}else{
					JOptionPane.showMessageDialog(null, "Employe Id and Name Doesn't Match");
					response.sendRedirect("addPurchases.jsp");
				}
			}else{
				JOptionPane.showMessageDialog(null, "Not Present");
				response.sendRedirect("addPurchases.jsp");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
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
