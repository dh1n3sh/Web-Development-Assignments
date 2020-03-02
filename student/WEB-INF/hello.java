import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

// Extend HttpServlet class
public class hello extends HttpServlet {
 
   private String message;

   public void init() throws ServletException {
      // Do required initialization
      message = "Hello ";
   }

   public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
      
      // Set response content type
      response.setContentType("text/html");

      // Actual logic goes here.
      PrintWriter out = response.getWriter();
      out.println("<h1>" + message + "</h1>");
      RequestDispatcher view = request.getRequestDispatcher("form.html");
        // don't add your web-app name to the path

        view.forward(request, response);  
   }

   protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
 
        // code to process the form...
       PrintWriter out = response.getWriter();
         // out.println("<h1>" + message +request.getParameter("name")+ "</h1>");
         out.println("<html>\n" + "<head></head>\n" +"<body bgcolor = \"#f0f0f0\">\n" +
               "<h1 align = \"center\">FORM</h1>\n" +
               "<table style=\" border : 2px solid black\">\n" +
                  "<tr><td><b>First Name : </b></td>\n" +
                  "<td>" + request.getParameter("name") + "</td>\n</tr>\n" +
                  "<tr><td><b>User Name : </b></td>\n" +
                  "<td>" + request.getParameter("username") + "</td>\n</tr>\n" +
                  "<tr><td><b>Password : </b></td>\n" +
                  "<td>" + request.getParameter("pwd") + "</td>\n</tr>\n" +
                  "<tr><td><b>Email : </b></td>\n" +
                  "<td>" + request.getParameter("emailid") + "</td>\n</tr>\n" +
               "</table>\n" +
            "</body>" +
         "</html>"
      );
         
 
    }
   public void destroy() {
      // do nothing.
   }
}