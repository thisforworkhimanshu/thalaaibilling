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

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class CreateBill
 */
public class CreateBill extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateBill() {
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
		String pname = request.getParameter("prod");
		float price;
		int quant = Integer.parseInt(request.getParameter("quant"));
		request.setAttribute("prodname", pname);
		request.setAttribute("quant",quant);
		HttpSession session = request.getSession(true);
		int autoinc=0;
		
		String uname = session.getAttribute("UName").toString();
		if(session.getAttribute("billing").equals("none")){
			session.setAttribute("billing", "yes");
			request.getRequestDispatcher("ClearData").include(request, response);
		}else{
			session.setAttribute("billing", "yes");
		}
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			connection.setAutoCommit(false);
			statement = (PreparedStatement) connection.prepareStatement("select * from product where ProductName=?");
			statement.setString(1, pname);
			ResultSet rs = statement.executeQuery();
			boolean status = rs.next();
			if(status==true){
				price = rs.getFloat(3);
				/*request.setAttribute("ppu", price);*/
				st= (PreparedStatement) connection.prepareStatement("insert into billtable values(?,?,?,?,?,?)");
				st.setString(1, pname);
				st.setFloat(2, price);
				st.setInt(3, quant);
				st.setFloat(4, (price*quant));
				st.setString(5, uname);
				st.setInt(6, autoinc);
				int i= st.executeUpdate();
				if(i>0){
					connection.commit();
					
					session.removeAttribute("showbutton");
					session.setAttribute("showbutton", "yes");
					response.getWriter().println("Success");
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
		response.sendRedirect("mybill.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
