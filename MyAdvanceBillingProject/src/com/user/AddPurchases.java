package com.user;

import java.io.IOException;

import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class AddPurchases
 */
public class AddPurchases extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPurchases() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String date=request.getParameter("date");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date1 = null;
		try {
			date1 = sdf1.parse(date);
		} catch (ParseException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		java.sql.Date sqlDate = new Date(date1.getTime());
		
		String billnumber= request.getParameter("billnumber");
		String shopname =request.getParameter("shopname");
		String billprice = request.getParameter("billprice");
		String taxamount = request.getParameter("taxamount");
		Connection connection = null;
		PreparedStatement statement;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
			connection.setAutoCommit(false);
			/*statement = (PreparedStatement) connection.prepareStatement("insert into purchase(PDate,BillNumber,ShopName,GoodsPrice,TaxAmount,UserName) values(?,?,?,?,?,?)");*/
			statement = (PreparedStatement) connection.prepareStatement("insert into purchase(PDate,BillNumber,ShopName,GoodsPrice,TaxAmount) values(?,?,?,?,?)");
			statement.setDate(1,sqlDate); 
			statement.setString(2, billnumber);
			statement.setString(3, shopname);
			statement.setString(4, billprice);
			statement.setString(5,taxamount);
			/*statement.setString(6, request.getSession().getAttribute("UName").toString());*/
			int i= statement.executeUpdate();
			if(i>0){
				connection.commit();
				JOptionPane.showMessageDialog(null, "Successfully Added");
				response.sendRedirect("addPurchases.jsp");
			}
		}catch (Exception e) {
			// TODO: handle exception
			try {
				connection.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
