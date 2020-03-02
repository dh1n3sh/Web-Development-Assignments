<%@ page errorPage="errorpage.jsp" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="cart" scope="session" class="beans.ShoppingCart" />
<html>

<head>
  <link rel="stylesheet" href="nav.css">
  <title>Shopping Cart Contents</title>

</head>

<body style="font-family: 'Raleway', sans-serif;
font-weight: 500;

font-size: 30px;">
  <div class="topnav">
    <a href="AddToShoppingCart.jsp">Home</a>
    <a class="active" href="ShoppingCart.jsp">Cart</a>
  </div>
  <p></p>
  <br>
  <center>
    <table width="300" border="1" cellspacing="0" cellpadding="2" border="0">
      <h2><b>Shopping Cart Contents</b></h2>
      <br>
      <tr>
        <th>Description</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Subtotal</th>
      </tr>
      <%
      Enumeration e = cart.getEnumeration();
      String[] tmpItem;
      // Iterate over the cart
      while (e.hasMoreElements()) {
        tmpItem = (String[])e.nextElement();
        %>
      <tr>
        <td><%=tmpItem[1] %></td>
        <td align="center">$<%=tmpItem[2] %></td>
        <td align="center"><%=tmpItem[3] %></td>
        <td align="center">$<%=Float.parseFloat(tmpItem[2])*Float.parseFloat(tmpItem[3]) %> </td>
      </tr>



      <%
      }
    %>
      <tr>
        <td>Total</td>
        <td></td>
        <td align="center"><%=cart.getNumOfItems() %></td>
        <td align="center">$<%=cart.getCost() %></td>
      </tr>
    </table>
  </center>
  <!-- <a href="AddToShoppingCart.jsp">Back to Catalog</a> -->
</body>

</html>