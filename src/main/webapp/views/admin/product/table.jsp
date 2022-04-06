<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 3/31/22
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<c:if test="${empty list}">
    <p class="alert alert-warning">
        Vui Lòng Thêm Mới Dữ Liệu
    </p>
</c:if>
<%--<c:if test="${!empty list}">--%>
<%--    <p class="alert alert-success">--%>
<%--        Data OK 2--%>
<%--    </p>--%>
<table class="table table-success table-striped">
    <thead>
    <tr>
        <th scope="col">Category</th>
        <th scope="col">ProductName</th>
        <th scope="col">Quantity</th>
        <th scope="col">Price</th>
        <th scope="col">Color</th>
        <th scope="col">Size</th>
        <th scope="col">Image</th>
        <th colspan="2">Manipulation</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="product">
        <tr>
            <td>${product.category.ten}</td>
            <td>${product.ten}</td>
            <td>${product.soLuong}</td>
            <td>${product.donGia}</td>
            <td>${product.mauSac}</td>
            <td>${product.kichThuoc}</td>
            <td>${product.img}</td>
            <td>
                <form action="/editProduct" method="post">
                    <input type="hidden" value="${product.id}" name="id">
                    <button class="btn btn-primary">Update</button>
                </form>
            </td>
            <td>
                <form action="/deleteProduct" method="post">
                    <input type="hidden" value="${product.id}" name="id">
                    <button class="btn btn-danger">Delete</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%--</c:if>--%>

