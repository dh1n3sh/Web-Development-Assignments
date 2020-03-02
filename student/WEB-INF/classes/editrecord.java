import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.SimpleDateFormat;

public class editrecord extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{

		Connection conn;
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try
		{

			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				conn =  DriverManager.getConnection("jdbc:mysql://localhost:3308/stud","root","ssn");
			}
			catch(Exception e)
			{
				out.println(e.toString());
				return;
			}

			PreparedStatement st = conn.prepareStatement("update info set addr = ? , name = ? , roll = ? , branch = ?, year = ?, semester= ? , dob = ? where id =?");
			// st.setString(8,request.getParameter("id"));
			// st.setString(1,request.getParameter("name"));
			// st.setInt(2,Integer.parseInt(request.getParameter("rollno")));
			// st.setString(3,request.getParameter("branch"));
			// st.setInt(4,Integer.parseInt(request.getParameter("year")));
			// st.setInt(5,Integer.parseInt(request.getParameter("semester")));
			// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			// java.util.Date dob = sdf.parse(request.getParameter("dob"));
			// st.setDate(6,new java.sql.Date(dob.getTime()));
			// st.setString(7,request.getParameter("address"));
			// int rwncnt = st.executeUpdate();
			

			// Same for second parameter 
			st.setString(2, request.getParameter("name")); 

			// Execute the insert command using executeUpdate() to make changes in database 
			st.setString(3, request.getParameter("roll")); 
			st.setString(4, request.getParameter("branch")); 
			st.setString(5, request.getParameter("year")); 
			st.setString(6, request.getParameter("sem")); 
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date myDate = formatter.parse(request.getParameter("dob").toString());
			java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());
			st.setDate(7,sqlDate ); 
			st.setString(1, request.getParameter("address")); 
st.setInt(8, Integer.valueOf(request.getParameter("id"))); 
			int rwncnt = st.executeUpdate(); 

			if(rwncnt>=1)
				out.println("updated successfully.!");
			else
				out.println("No such records found . !");	
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
}