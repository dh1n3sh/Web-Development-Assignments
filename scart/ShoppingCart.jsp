<%@ page errorPage="errorpage.jsp" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="cart" scope="session" class="beans.ShoppingCart" />
<html>
  <head>
    <title>Shopping Cart Contents</title>
  </head>
  <body>
    <%
    String id = request.getParameter("id");
    if ( id != null ) {
      
      cart.removeItem(id);
    }
  %>
    <center>
    <table width="300" border="1" cellspacing="0"
      cellpadding="2" border="0">
      <caption><b>Shopping Cart Contents</b></caption>
      <tr>
        <th>Description</th>
        <th>Price</th>
        <th>Quantity</th>
      </tr>
    <%
      Enumeration e = cart.getEnumeration();
      String s = cart.getQ();
      float c = cart.getCost();
      String[] tmpItem;
      // Iterate over the cart
      while (e.hasMoreElements()) {
        tmpItem = (String[])e.nextElement();
        %>
        <form action="ShoppingCart.jsp" method="POST">
        <tr>
          <td><%=tmpItem[1] %></td>
          <td align="center">$<%=tmpItem[2] %></td>
          <td align="center"><%=tmpItem[3] %></td>
          <input type="hidden" name="id" value=<%=tmpItem[0]%>>
          <td><input type="submit" value="remove"> </td>
        </tr>
      </form>
        <%
      }
    %> 
    </table>
    <p>Total Quantity is : <%=s %></p>
    <p>Total Cost is : <%=c %></p>
    </center>
    <a href="AddToShoppingCart.jsp">Back to Catalog</a>
  </body>
</html>
