<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <title>DB Test</title>
  </head>
  <body>

  <h2>Results</h2>
<table>
<%

Context initContext = new InitialContext();
Context envContext  = (Context)initContext.lookup("java:/comp/env");
DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
Connection conn = ds.getConnection();

Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select id, name, rating from candy_ratings");

while(rs.next()) {
%>
<tr>
<td><%= rs.getString("name") %></td><td><%= rs.getString("rating") %></td>
</tr>


<%
}

rs.close();
stmt.close();
conn.close();

%>
</table>
  </body>
</html>