<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
</head>
<body>
<%
    // Invalidate the session
    session.invalidate();

    // Redirect to the home page
    response.sendRedirect("LoginCustomer.jsp");
%>
</body>
</html>
