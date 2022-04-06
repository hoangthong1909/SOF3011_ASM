<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<h2>
    <fmt></fmt>
</h2>
<c:if test="${empty ds}">
    <p class="alert alert-warning">
        Vui Lòng Thêm Mới Dữ Liệu
    </p>
</c:if>
<c:if test="${!empty sessionScope.error}">
    <div class="alert alert-danger">
        ${sessionScope.error}
    </div>
    <c:remove var="error" scope="session"/>
</c:if>
<c:if test="${!empty sessionScope.message}">
    <div class="alert alert-success">
            ${sessionScope.message}
    </div>
    <c:remove var="message" scope="session"/>
</c:if>
<%--<c:if test="${!empty ds}">--%>
<%--    <p class="alert alert-success">--%>
<%--        Data OK--%>
<%--    </p>--%>
<table class="table table-success table-striped">
    <thead>
    <tr>
        <%--            <th scope="col">Avatar</th>--%>
        <th scope="col">Name</th>
        <th scope="col">Address</th>
        <th scope="col">Phone</th>
        <th scope="col">Email</th>
        <th scope="col">Gender</th>
        <th scope="col">Permission</th>
        <th colspan="2">Manipulation</th>
        <%--            <th scope="col">Custommer</th>--%>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${ds}" var="user">
        <tr>
                <%--                <td>${user.avatar}</td>--%>
            <td>${user.hoTen}</td>
            <td>${user.diaChi}</td>
            <td>${user.sdt}</td>
            <td>${user.email}</td>
            <td>
                <c:choose>
                    <c:when test="${user.gioiTinh==1}">Boy</c:when>
                    <c:when test="${user.gioiTinh==0}">Girl</c:when>
                    <c:otherwise>-</c:otherwise>
                </c:choose>
            </td>
            <td>${user.nguoiDung==true ? "Admin" : "User"}</td>
            <td>
                <form action="edit" method="post">
                    <input type="hidden" value="${user.id}" name="id" >
                    <button class="btn btn-primary">Update</button>
                </form>
            </td>
           <td>
               <form action="delete" method="post">
                   <input type="hidden" value="${user.id}" name="id">
                   <button class="btn btn-danger">Delete</button>
               </form>
           </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%--</c:if>--%>
