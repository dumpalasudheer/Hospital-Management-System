<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.AppointmentDao"%>
<%@ page import="com.db.DbConnect"%>
<%@ page import="com.entity.Appointment"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../components/cssTags.jsp"%>
<title>Doctor Dashboard</title>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
    background: rgb(245, 248, 251);
    border-radius: 10px;
    padding: 20px;
}

body {
    background-color: rgb(221, 229, 240);
}

.table th, .table td {
    text-align: center;
    vertical-align: middle;
}

.table th {
    background-color: rgb(230, 236, 240);
    font-weight: bold;
}

.table-responsive {
    margin-top: 15px;
}
</style>
</head>
<body>
    <%@ include file="navbar.jsp"%>

    <c:if test="${empty doctObj}">
        <c:redirect url="../doctor.jsp"></c:redirect>
    </c:if>

    <div class="container-fluid p-4">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 fw-bold text-center text-success">Appointment List</p>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Age</th>
                                        <th scope="col">Appointment Date</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Phone No</th>
                                        <th scope="col">Treatment For</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    Doctor d = (Doctor) session.getAttribute("doctObj");
                                    AppointmentDao dao = new AppointmentDao(DbConnect.getConn());
                                    List<Appointment> lst = dao.getAppointmentDetailsbyDoctId(d.getId());
                                    for (Appointment doc : lst) {
                                    %>
                                    <tr>
                                        <td><%= doc.getName() %></td>
                                        <td><%= doc.getGender() %></td>
                                        <td><%= doc.getAge() %></td>
                                        <td><%= doc.getAppointDate() %></td>
                                        <td><%= doc.getEmail() %></td>
                                        <td><%= doc.getPhnNno() %></td>
                                        <td><%= doc.getDisease() %></td>
                                        <td><%= doc.getStatus() %></td>
                                        <td>
                                            <form action="../updateStatus" method="post">
                                                <input type="hidden" name="id" value="<%= doc.getId() %>">
                                                <input type="hidden" name="doctId" value="<%= d.getId() %>">
                                                <select name="status" class="form-select form-select-sm">
                                                	<option>--select--</option>
                                                    <option value="approved">Approved</option>
                                                    <option value="rejected">Rejected</option>
                                                    <option value="completed">Completed</option>
                                                </select>
                                                <button type="submit" class="btn btn-primary btn-sm mt-2">Update</button>
                                            </form>
                                        </td>
                                    </tr>
                                    <% } %>
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
