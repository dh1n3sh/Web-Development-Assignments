import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.SimpleDateFormat;

public class search extends HttpServlet
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

			PreparedStatement st = conn.prepareStatement("select * from info where id = ?");
			st.setString(1,request.getParameter("id"));
			ResultSet rs = st.executeQuery();

			int rwcnt = 0;

			while(rs.next())
			{
				rwcnt++;

				if(rwcnt==1)
				{
					out.println("<table>");
					out.println("<tr><th>ID</th><th>NAME</th><th>ROLL NO.</th>");
				}

				out.println("<div>");
				out.println(rs.getString(1) + "");
				out.println(rs.getString(2) + "");
				out.println(rs.getInt(3) + "");
				out.println(rs.getString(4) + "");
				out.println(rs.getInt(5) + "");
				out.println(rs.getInt(6) + "");
				out.println(rs.getDate(7) + "");
				out.println(rs.getString(8));
				out.println("<div>");

			}

			if(rwcnt==0)
			{
				out.println("No such record found.!");
			}

		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	}
}