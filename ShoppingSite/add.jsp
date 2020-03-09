<%@ page errorPage="errorpage.jsp" %>
<%@ page import="java.util.*" %>

<!-- <jsp:useBean id="cart" scope="session" class="beans.ShoppingCart" /> -->
<html>

<head>
  <title>Online Shopping</title>
  <link rel="stylesheet" href="nav.css">
  </head>

<body style="font-family: 'Raleway', sans-serif;
font-weight: 500;

font-size: 30px;">
<% 

    String id = request.getParameter("id");
    if ( id != null ) {
      String type = request.getParameter("Submit");
        if(type!=null) {
        if (type.equals("Add"))   {
            String desc = request.getParameter("desc");
              Float price = new Float(request.getParameter("price"));
              
              cart.addItem(id, desc, price.floatValue(), 1);
          }
          else if (type.equals("RemoveAll")) {
            cart.removeItem(id);
        }
        else if (type.equals("Remove")) {
          String desc = request.getParameter("desc");
              Float price = new Float(request.getParameter("price"));
              
              cart.reduceqty(id, desc, price.floatValue(), 1);
        }
      }
  }
  %>
 <div class="topnav">
    <a class="active" href="add.jsp">Home</a>
    <a href="ShoppingCart.jsp"> Cart</a>
    <a style="float: right;">Shopping Cart Total Quantity: <%=cart.getNumOfItems() %></a>
    <a style="float: right;"> Total Estimated Price: $<%=cart.getCost() %></a>

  </div>
<center>
    <h1>Online Electronic Store</h1>
  </center>
 <table width="800px" cellspacing="70" cellpadding="10" align="center">
    <!-- <tr>
      <th>Image</th>
      <th colspan="2">Description</th>

      <th>Price</th>
      <th>Add/Remove</th>
    </tr> -->
    <tr>

      <td><img src="phone.jpg" width="300" ;height="100"></td>
      <td colspan="5">
        <form action="add.jsp" method="post">
          <strong>IPhone</strong><br>
          $19.95
      <td align="center">
        <button type="submit" name="Submit" value="Add"><img src="add2cart.jpg" width="48" height="48"> </button>


        <!-- <input type="submit" name="Submit" value="RemoveAll"><br> -->
        <!-- <br><input type="image" name="Submit" alt="Submit" src="add2cart.jpg" value="RemoveAll"> -->

      </td>
      <td> <Button type="submit" value="RemoveAll" name="Submit"> <img src="remove.png" width="48" height="48"></Button>
      </td>
      <input type="hidden" name="id" value="1">
      <input type="hidden" name="desc" value="IPhone">
      <input type="hidden" name="price" value="19.95">

      </form>
      </td>
      <td>
  <select>
<option>1</option>
<option>2</option>

<option>3</option>  <select>
        <%-- <br><input type="submit" name="Submit" value="Remove"><br> --%>
      </td>
    </tr>
    <!-- <tr>
      <td colspan="10">
      <hr>
    </td>
    </tr> -->
    <tr>

      <td><img src="laptop.jpg" width="300" ;height="100"></td>
      <td colspan="5">
        <form action="add.jsp" method="post">
          <strong>Gaming Laptop</strong> <br>
          $20.95
      </td>
      <td align="center">
        <button type="submit" name="Submit" value="Add"><img src="add2cart.jpg" width="48" height="48"> </button>


      </td>
      <td>

        <Button type="submit" value="RemoveAll" name="Submit"> <img src="remove.png" width="48" height="48"></Button>
        <!-- <br><input type="submit" name="Submit" value="RemoveAll"></td> -->
        <input type="hidden" name="id" value="2">
        <input type="hidden" name="desc" value="TUF Gaming Laptop">
        <input type="hidden" name="price" value="20.95">

      </td>
      <td>
   
        <%-- <br><input type="submit" name="Submit" value="Remove"><br> --%>
      </td>
      </form>
    </tr>
    <tr>

      <td><img src="tv.jpg" width="300" ;height="200" style="padding:30px;"></td>
      <td colspan="5">
        <form action="add.jsp" method="post">
          <strong>Smart TV</strong><br>
          $21.95
      </td>

      <td align="center">
        <button type="submit" name="Submit" value="Add"><img src="add2cart.jpg" width="48" height="48"> </button>


      </td>
      <td>
        <Button type="submit" value="RemoveAll" name="Submit"> <img src="remove.png" width="48" height="48"></Button>
      </td>
      <input type="hidden" name="id" value="3">
      <input type="hidden" name="desc" value="tv">
      <input type="hidden" name="price" value="21.95">
      </form>
      </td>
      <td>

        <%-- <br><input type="submit" name="Submit" value="Remove"><br> --%>
      </td>
    </tr>
   
  </table>
</body>
</html>