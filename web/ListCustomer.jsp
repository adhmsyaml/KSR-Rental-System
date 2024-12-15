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
        <title>List Customer</title>
        
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
        
        <h1> List Customer </h1><br>
        <div class="form-container">
        <c:set var="username" value="${param.username}"/>
        <c:set var="custname" value="${param.custname}"/>
        <c:set var="custemail" value="${param.custemail}"/>
        <c:set var="custnum" value="${param.custnum}"/>
        <c:set var="custpass" value="${param.custpass}"/>

        <c:if test="${username != null && custname != null && custemail != null && custnum != null && custpass != null}">
            <sql:update var="result" dataSource="${myDataSource}">
                INSERT INTO Customer (username, custname, custemail, custnum, custpass)
                VALUES (?, ?, ?, ?, ?)
                <sql:param value="${username}"/>
                <sql:param value="${custname}"/>
                <sql:param value="${custemail}"/>
                <sql:param value="${custnum}"/>
                <sql:param value="${custpass}"/>
            </sql:update>
        </c:if>

       

        <sql:query var="result" dataSource="${myDataSource}">
            SELECT * FROM Customer
        </sql:query>

        <table border="1">
            <tr>
                <c:forEach var="columnName" items="${result.columnNames}">
                    <th><c:out value="${columnName}"/></th>
                </c:forEach>
            </tr>
            <c:forEach var="row" items="${result.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </div>
    </body>
</html>
