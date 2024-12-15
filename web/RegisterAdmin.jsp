<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:setDataSource var="myDataSource" driver="org.apache.derby.jdbc.ClientDriver" 
    url="jdbc:derby://localhost:1527/CarDB" user="app" password="app"/>

<!DOCTYPE html>
<html>
<head>
    <title>Insert Staff</title>
    <style>
        /* Styling goes here */
    </style>
</head>
<body>
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

        <form action="RegisterAdmin.jsp" method="post">
            <label for="staff_name">Staff Name:</label>
            <input type="text" id="staff_name" name="staff_name"><br>

            <label for="staff_position">Position:</label>
            <input type="text" id="staff_position" name="staff_position"><br>

            <label for="staff_email">Staff Email:</label>
            <input type="email" id="staff_email" name="staff_email"><br>

            <label for="staff_phone">Staff Phone:</label>
            <input type="text" id="staff_phone" name="staff_phone"><br>

            <label for="staff_password">Password:</label>
            <input type="password" id="staff_password" name="staff_password"><br>

            <input type="submit" value="SUBMIT">
        </form>

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
