<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:setDataSource var="myDataSource" driver="org.apache.derby.jdbc.ClientDriver" 
    url="jdbc:derby://localhost:1527/CarDB" user="app" password="app"/>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome Admin</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
            font-size: 40px;
        }

        label {
            display: block;
            font-size: 20px;
            margin: 10px 0 5px;
            text-align: left;
            color: #555;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 16px;
            font-size: 30px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background: #007bff;
            color: white;
            padding: 15px 30px; /* Increased padding */
            font-size: 18px; /* Increased font size */
            border: none;
            border-radius: 6px; /* Adjusted border-radius for a larger button */
            cursor: pointer;
            transition: background-color 0.3s ease;
        }


        input[type="submit"]:hover {
            background: #0056b3;
        }

        .error-message {
            color: #ff6b6b;
            margin-bottom: 20px;
        }

    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2><br>
        
        <c:set var="staff_name" value="${param.staff_name}"/>
        <c:set var="staff_password" value="${param.staff_password}"/>

        <c:if test="${staff_name != null && staff_password != null}">
            <sql:query var="result" dataSource="${myDataSource}">
                SELECT * FROM Staff WHERE staff_name = ? AND staff_password = ?
                <sql:param value="${staff_name}"/>
                <sql:param value="${staff_password}"/>
            </sql:query>
            
            <c:if test="${not empty result.rowsByIndex}">
                <!-- If credentials match -->
                <p>Login successful! Welcome, ${staff_name}!</p>
                <!-- Redirect to another page, for example, a dashboard or home page -->
                <meta http-equiv="refresh" content="2;url=HomeAdmin.jsp">
            </c:if>
            
            <c:if test="${empty result.rowsByIndex}">
                <!-- If credentials do not match -->
                <p class="error-message">Invalid staff name or password. Please try again.</p>
            </c:if>
        </c:if>
        
        <!-- Login form -->
        <form action="LoginAdmin.jsp" method="post">
            
            <label for="staff_name">Staff Name:</label>
            <input type="text" id="staff_name" name="staff_name" required><br>

            <label for="staff_password">Password:</label>
            <input type="password" id="staff_password" name="staff_password" required><br>

            <input type="submit" value="Login"><br></br>
            
            <a href="LoginCustomer.jsp" style="margin-right: 20px;">Customer Login</a>
        </form>
    </div>
</body>
</html>
