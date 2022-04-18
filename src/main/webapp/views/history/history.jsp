<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">Shopping Cart</li>
            </ol>
        </div>
            <div class="table-responsive cart_info ">
                <table class="table table-condensed">
                    <thead>
                    <tr class="cart_menu">
                        <td class="description"><b>STT</b></td>
                        <td class="description">Khách Hàng</td>
                        <td class="description">Điện Thoại</td>
                        <td class="description">Địa Chỉ</td>
                        <td class="description">Email</td>
                        <td class="description">Ngày Đặt Hàng</td>
                        <td class="description">Tổng Tiền </td>
                        <td class="price">Trạng Thái</td>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${empty orderList}">
                        <td> <p style="color: red;font-size: 25px">Bạn chưa có đơn hàng nào!</p></td>
                    </c:if>
                    <c:forEach items="${orderList}" var="history" varStatus="status">
                        <tr>
                            <td class="cart_description">
                              <b> #${status.count}</b>
                            </td>
                            <td class="cart_description">
                                    ${history.userDatHang.hoTen}
                            </td>
                            <td class="cart_description">
                                ${history.userDatHang.sdt}
                            </td>
                            <td class="cart_description">
                                ${history.userDatHang.diaChi}
                            </td>
                            <td class="cart_description">
                                ${history.userDatHang.email}
                            </td>
                            <td class="cart_description">
                                <fmt:formatDate value="${history.dateCreate}" pattern="dd/MM/yyyy"/>
                            </td>
                            <td class="cart_total">
                                <span style="color: red"><fmt:formatNumber value="${history.tongTien}" pattern="#,###"/> VND</span>
                            </td>
                            <td class="cart_description">
                                <c:choose>
                                    <c:when test="${history.status==0}"><p style="color:#224abe">Chờ Xử Lý</p></c:when>
                                    <c:when test="${history.status==1}"><p style="color:green"></p>Đã Xác Nhận</c:when>
                                    <c:when test="${history.status==2}"><p style="color: red">Đã Hủy</p></c:when>
                                    <c:otherwise>-</c:otherwise>
                                </c:choose>
                            </td>
                            <td class="cart_description">
                                <a href="" class=" btn btn-warning">Xem Chi Tiết</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
    </div>
</section> <!--/#cart_items-->
<br>
<br>
