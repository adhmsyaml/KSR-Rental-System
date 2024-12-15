<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:setDataSource var="myDataSource" driver="org.apache.derby.jdbc.ClientDriver" 
    url="jdbc:derby://localhost:1527/CarDB" user="app" password="app"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Admin</title>
        
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
    
    <h1> List Admin </h1><br>
    <div class="form-container">
        <c:set var="staff_name" value="${param.staff_name}"/>
        <c:set var="staff_position" value="${param.staff_position}"/>
        <c:set var="staff_email" value="${param.staff_email}"/>
        <c:set var="staff_phone" value="${param.staff_phone}"/>
        <c:set var="staff_password" value="${param.staff_password}"/>

        <c:if test="${staff_name != null && staff_position != null && staff_email != null && staff_phone != null && staff_password != null}">
            <sql:update var="result" dataSource="${myDataSource}">
                INSERT INTO Staff (staff_name, staff_position, staff_email, staff_phone, staff_password)
                VALUES (?, ?, ?, ?, ?)
                <sql:param value="${staff_name}"/>
                <sql:param value="${staff_position}"/>
                <sql:param value="${staff_email}"/>
                <sql:param value="${staff_phone}"/>
                <sql:param value="${staff_password}"/>
            </sql:update>
        </c:if>

        <sql:query var="result" dataSource="${myDataSource}">
            SELECT * FROM Staff
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
