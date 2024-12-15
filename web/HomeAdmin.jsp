<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:setDataSource var="myDataSource" driver="org.apache.derby.jdbc.ClientDriver" 
    url="jdbc:derby://localhost:1527/CarDB" user="app" password="app"/>

<%-- 
    Document   : ListCusrtomer
    Created on : Dec 11, 2024, 10:48:01 PM
    Author     : USER
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Admin</title>
        
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f9;
            }

            nav {
                background-color: #007bff;
                padding: 30px 50px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                color: white;
            }

            nav a {
                color: white;
                text-decoration: none;
                margin: 0 10px;
                font-size: 20px;
                transition: color 0.3s;
            }

            nav a:hover {
                color: #ffdd57;
            }

         
        </style>
    </head>
    <body>
        
        <nav>
            <div>
                
                <a href="Logout.jsp">Logout</a
            </div>
        </nav>

        
        <a href="ListCustomer.jsp">List Customer</a>
        <a href="ListAdmin.jsp">List Admin</a>
        <a href="RegisterAdmin.jsp">Register if no Account</a>
   
 
    
    </body>
</html>
