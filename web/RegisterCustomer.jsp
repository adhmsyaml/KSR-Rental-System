<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:setDataSource var="myDataSource" driver="org.apache.derby.jdbc.ClientDriver" 
    url="jdbc:derby://localhost:1527/CarDB" user="app" password="app"/>

<!DOCTYPE html>
<html>
<head>
    <title>Insert Customer</title>
    <style>
        /* Styling goes here */
    </style>
</head>
<body>
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

        <form action="RegisterCustomer.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username"><br>

            <label for="custname">Customer Name:</label>
            <input type="text" id="custname" name="custname"><br>

            <label for="custemail">Customer Email:</label>
            <input type="email" id="custemail" name="custemail"><br>

            <label for="custnum">Customer Number:</label>
            <input type="text" id="custnum" name="custnum"><br>

            <label for="custpass">Customer Password:</label>
            <input type="password" id="custpass" name="custpass"><br>

            <input type="submit" value="SUBMIT">
        </form>

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
