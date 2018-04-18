package com.user;

import java.io.IOException;

import java.net.URL;
import java.net.URLConnection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class AddBillProd
 */
public class AddBillProd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBillProd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String msg;
		java.util.Date date = new java.util.Date();
		long millis=System.currentTimeMillis();  
        java.sql.Date sqldate=new java.sql.Date(millis);  
        System.out.println(sqldate); 
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		String monthname = null;
		int month = cal.get(Calendar.MONTH);
		month=month+1;
		int year = cal.get(Calendar.YEAR);
		float tax = 0;
		float discount=0;
		Connection connection = null;
		PreparedStatement statement,st,preparedStatement,stmt;
		float billamount = 0;
		int id=0;
		StringBuffer monthyear = new StringBuffer();
		String name = request.getParameter("cusName");
		
		HttpSession session = request.getSession();
		session.setAttribute("cusName", name);
		/*
		if(session.getAttribute("billingstart")==null){
			request.getRequestDispatcher("ClearData").include(request, response);
		}else{*/
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");
				
				connection.setAutoCommit(false);
				statement = (PreparedStatement) connection.prepareStatement("select * from billtable");
				ResultSet rs = statement.executeQuery();
				preparedStatement = (PreparedStatement)connection.prepareStatement("select * from tax");
			    ResultSet rs1 = preparedStatement.executeQuery();
			    boolean status = rs1.next();
			    if(status==true){
			    	tax = rs1.getFloat(1);
			    	discount=rs1.getFloat(2);
			    }
				
				while(rs.next()){
					billamount = billamount + rs.getFloat(4);
				}
				if(discount!=0){
			    	billamount = billamount - (discount/100)*billamount;	
			    }
			    if(tax!=0){
			    	billamount = billamount + billamount/tax;	
			    }
			    
			    if(month==1){
			    	monthname="JAN";
			    }else if(month==2){
			    	monthname="FEB";
			    }else if(month==3){
			    	monthname="MAR";
			    }else if(month==4){
			    	monthname="APR";
			    }else if(month==5){
			    	monthname="MAY";
			    }else if(month==6){
			    	monthname="JUN";
			    }else if(month==7){
			    	monthname="JUL";
			    }else if(month==8){
			    	monthname="AUG";
			    }else if(month==9){
			    	monthname="SEPT";
			    }else if(month==10){
			    	monthname="OCT";
			    }else if(month==11){
			    	monthname="NOV";
			    }else if(month==12){
			    	monthname="DEC";
			    }
			    
			    String yearname = Integer.toString(year);
			    monthyear.append(monthname);
			    monthyear.append(yearname);
			    String uname = session.getAttribute("UName").toString();
			  
			  try{
			    	st=(PreparedStatement)connection.prepareStatement("insert into totalsell(CustomerName,BillAmount,BillDate,Month,Year,MonthYear,UserName) values(?,?,?,?,?,?,?)");
					st.setString(1, name);
					st.setFloat(2, billamount);
					st.setDate(3, sqldate);
					st.setInt(4, month);
					st.setInt(5, year);
					st.setString(6, monthyear.toString());
					st.setString(7, uname);
					int i= st.executeUpdate();
					if(i>0){
						/*connection.commit();*/
						ResultSet rs11 = st.getGeneratedKeys();
						if(rs11.next()){
							id = rs11.getInt(1);
							monthyear.append(id);
							session.setAttribute("billid", monthyear);
								}
						}
			    }catch(Exception e){
			    	connection.rollback();
			    	/*e.printStackTrace();*/
			    	response.getWriter().println(e);
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
			}finally {
				
				try {
					stmt=(PreparedStatement)connection.prepareStatement("update totalsell set BillNumber=? where BillId=?");
					stmt.setString(1, monthyear.toString());
					stmt.setInt(2, id);
					int i = stmt.executeUpdate();
					if(i>0){
						connection.commit();
						session.removeAttribute("billing");
						session.setAttribute("billing", "none");
						boolean istatus=false;
						try{
							final URL url = new URL("http://www.google.com");
					        final URLConnection conn = url.openConnection();
					        conn.connect();
					        System.out.println("Internet Present");
					        istatus=true;
					        if(istatus){
						    	String to=request.getParameter("to").toString();
						    	if(request.getParameter("to").isEmpty()==false){
						    		String subject="Thalaai Thanks";
									msg="Dear "+name+",\n\nWe hope that you like our food and service, \nThanks for Purchase of OrderId "+monthyear+" of amount "+billamount+"\n\n\n Thank you, Please Visit Again.";
									Mailer.send(to, subject, msg);
						    	}
						    }
						}catch(Exception e){
							e.printStackTrace();
							connection.rollback();
						}
					 
					}
					
					connection.close();
					response.sendRedirect("billFrame.jsp");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					try {
						connection.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					e.printStackTrace();
				}
			}
	// }
}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
