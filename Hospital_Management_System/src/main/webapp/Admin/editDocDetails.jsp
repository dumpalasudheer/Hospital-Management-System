<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.SpecialistDao"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Specialist"%>
<%@ page import="com.db.DbConnect"%>
<%@ page import="com.entity.Doctor"%>
<%@ page import="com.dao.DoctorDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../components/cssTags.jsp"%>
<title>Doctor Info</title>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
    background: rgb(193, 197, 201);
}

body {
    background-color: rgb(221, 229, 240);
}
</style>
</head>
<body>
    <%@ include file="navbar.jsp"%>
    <div class="container-fluid mt-4 offset-md-4">
        <div class="row">
            <!-- Card for Adding Doctor -->
            <div class="col-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center">Edit Doctor Details</p>
                        <c:if test="${not empty ErrMsg}">
                            <p class="fs-3 text-center text-danger">${errorMsg}</p>
                            <c:remove var="ErrMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty succMsg}">
                            <p class="fs-3 text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        DoctorDao dao2 = new DoctorDao(DbConnect.getConn());
                        Doctor d = dao2.getDoctorbyId(id);
                        %>

                        <form action="../updateDoctor" method="post">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label> 
                                <input type="text" required name="fullName" class="form-control"
                                    value="<%=d.getFullName()%>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Qualification</label> 
                                <input type="text" required name="qualification" class="form-control"
                                    value="<%=d.getQualification()%>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Specialist</label> 
                                <select name="specialisation" required class="form-control">
                                    <option value="<%=d.getSpecialisation()%>" selected><%=d.getSpecialisation()%></option>
                                    <%
                                    SpecialistDao dao = new SpecialistDao(DbConnect.getConn());
                                    List<Specialist> list = dao.getAllSpecialist();
                                    for (Specialist s : list) {
                                    %>
                                    <option value="<%=s.getSpecialistName()%>"><%=s.getSpecialistName()%></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label> 
                                <input type="email" required name="email" class="form-control"
                                    value="<%=d.getEmail()%>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Mobile Number</label> 
                                <input type="text" required name="mobileNo" class="form-control"
                                    value="<%=d.getMobileNo()%>">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label> 
                                <input type="text" required name="password" class="form-control"
                                    value="<%=d.getPassword()%>">
                            </div>
                            <input type = "hidden" name = "id" value="<%=d.getId()%>">
                            <button type="submit" class="btn btn-primary col-md-12">Update Details</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
