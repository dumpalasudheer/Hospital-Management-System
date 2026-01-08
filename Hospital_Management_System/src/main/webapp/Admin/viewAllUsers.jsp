<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.AppointmentDao"%>
<%@ page import="com.dao.DoctorDao"%>
<%@ page import="com.dao.UserDao"%>
<%@ page import="com.entity.Appointment"%>
<%@ page import="com.db.DbConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointment Overview</title>
<%@ include file="../components/cssTags.jsp"%>
<%@ include file="navbar.jsp"%>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
    background-color: #f9f9f9;
    border-radius: 8px;
    padding: 20px;
}

.backImg {
    background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), 
                url("../img/login page.jpg");
    height: 20vh;
    width: 100%;
    background-size: cover;
    background-repeat: no-repeat;
}

body {
    background: rgb(193, 197, 201);
}

.table-responsive {
    padding: 10px;
}

.table th, .table td {
    text-align: center;
    vertical-align: middle;
}

.table th {
    background-color: #e9ecef;
}

.btn-warning {
    color: white;
    font-weight: bold;
    text-transform: uppercase;
}
</style>
</head>
<body>
    <div class="container-fluid backImg p-5">
        <p class="text-center fs-2 text-white">Patient overview</p>
    </div>
    <div class="container-fluid p-3">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 fw-bold text-center text-success">Patient Data</p>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Password</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                     UserDao dao = new UserDao(DbConnect.getConn());
                                     List<User> lst = dao.getAllUsers();
                                     for(User u:lst){
                                    %>
                                    <tr>
                                    	<td><%=u.getId()%></td>
                                        <td><%=u.getFull_name()%></td>
                                        <td><%=u.getEmail()%></td>
                                        <td><%=u.getPassword()%></td>
                                    </tr>
                                    <%
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
