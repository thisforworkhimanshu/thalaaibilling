package com.employe;

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
 * Servlet implementation class SearchEmploye
 */
public class SearchEmploye extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchEmploye() {
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
		HttpSession session = request.getSession(true);
		String id = request.getParameter("empid");
		session.setAttribute("eid", id);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			statement = (PreparedStatement) connection.prepareStatement("select * from employe where EmployeId=?");
			statement.setString(1, id);
			ResultSet rs = statement.executeQuery();
			if(rs.next()){
				session.setAttribute("ename", rs.getString(2));
				session.setAttribute("eadd", rs.getString(3));
				session.setAttribute("ecellnum", rs.getString(4));
				session.setAttribute("eemail", rs.getString(5));
				response.sendRedirect("ChooseOption.jsp");
			}else{
				session.setAttribute("not", "yes");
				response.sendRedirect("SearchEmploy.jsp");
			}
			/*while(rs.next()){
					session.setAttribute("ename", rs.getString(2));
					session.setAttribute("eadd", rs.getString(3));
					session.setAttribute("ecellnum", rs.getString(4));
					session.setAttribute("eemail", rs.getString(5));
				}
				response.sendRedirect("ChooseOption.jsp");*/
		}catch (Exception e) {
			// TODO: handle exception
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
