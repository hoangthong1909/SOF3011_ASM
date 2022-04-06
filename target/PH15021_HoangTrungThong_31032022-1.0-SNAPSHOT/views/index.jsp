<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 4/3/22
  Time: 11:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ecommerce</title>
    <link rel="icon" href="./public/images/logo_icon.png">
    <!-- Dùn lấy icon -->
    <link rel="stylesheet" href="./public/font/fontawesome-free-5.15.1-web/css/all.min.css">
    <link rel="stylesheet" href="./public/font/fontawesome-free-5.15.1-web/css/fontawesome.min.css">
    <!-- Dùn lấy icon -->
    <link rel="stylesheet" href="./public/themify-icons/themify-icons.css">
    <!-- css trang -->
    <link rel="stylesheet" href="./public/css/main.css">
    <link rel="stylesheet" href="./public/css/index.css">
    <link rel="stylesheet" href="./public/css/reponsive_main.css">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://kit.fontawesome.com/29b41ee1c8.js" crossorigin="anonymous"></script>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <!-- Font ngoài -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"/> -->

</head>
<body>

<div class="app">
    <header class="header">
        <div class="container-fluid header_topbar">
            <ul class="header_topbar_list header_topbar_list_right">

                <li class="header_topbar_item header_topbar_item_cart" title="Giỏ hàng">
                    <label for="input_checkbox__cart"  onclick="modalCheckboxCart()">
                        <i class="fa fa-shopping-cart header_topbar-icon " aria-hidden="true"></i>
                        <span class="header_topbar_item_cart_number">3</span>
                    </label>
                </li>
                <!-- Nếu chưa đăng nhập -->
                <!-- <li class="header_topbar_item" title="Đăng nhập/Đăng xuất">
                    <a href="">
                        <i class="fa fa-user header_topbar-icon" aria-hidden="true"></i>
                    </a>
                </li> -->
                <!-- Nếu đã đăng nhập -->
                <li class="header_topbar_item header_topbar_account">
                    <div class="header_topbar_user">
                        <img src="./public/images/avatar.jpg" alt="" class="header_topbar_item_avatar">
                    </div>
                    <!-- <a href="" class="header_topbar_user">
                        <img src="./public/images/avatar.jpg" alt="" class="header_topbar_item_avatar">
                    </a> -->
                    <div class="header_topbar_user_menu">
                        <ul class="header_topbar_user_list">
                            <li class="header_topbar_user_item">
                                <span style="color: #26a998;">Xin chào: </span><span style="color: red;">Khải</span>
                            </li>
                            <li class="header_topbar_user_item">
                                <a href="">Thông tin tài khoản</a>
                            </li>
                            <li class="header_topbar_user_item">
                                <a href="">Đơn mua</a>
                            </li>
                            <li class="header_topbar_user_item">
                                <a href="">Đăng xuất</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="header_topbar_item header_topbar_bars"  title="Danh mục">
                    <label for="app_modal_category_input">
                        <i class="fas fa-bars header_topbar-icon"></i>
                    </label>

                </li>
            </ul>
        </div>
        <!-- <div class="container-fluid header_navbar app_header_navbar" id="header_navbar"> -->
        <div class="container-fluid header_navbar" id="header_navbar">

            <ul class="header_navbar_list">
                <li class="header_navbar_item">
                    <a href="./index.html" class="header_navbar_item_kw">Trang chủ</a>
                </li>
                <li class="header_navbar_item header_navbar_item_product">
                    <span class="header_navbar_item_kw">Sản phẩm</span>
                    <!-- Hover Sản Phẩm -->
                    <div class="header_navbar_item_product_modal" id="item_product">
                        <div class="header_navbar_item_product_list">
                            <ul class="header_navbar_item_product_list_ul">
                                <li class="header_navbar_item_product_list_ul_key"><a href="">ÁO</a></li>
                                <li><a href="./category.html">Áo sơ mi</a></li>
                                <li><a href="./category.html">Áo polo</a></li>
                                <li><a href="./category.html">Áo len</a></li>
                                <li><a href="./category.html">Áo T-Shirt</a></li>
                                <li><a href="./category.html">Áo khoác</a></li>
                                <li><a href="./category.html">Áo thun dài tay</a></li>
                            </ul>
                            <ul class="header_navbar_item_product_list_ul">
                                <li class="header_navbar_item_product_list_ul_key"><a href="">Quần</a></li>
                                <li><a href="./category.html">Quần âu</a></li>
                                <li><a href="./category.html">Quần kaki</a></li>
                                <li><a href="./category.html">Quần thể thao</a></li>
                                <li><a href="./category.html">Quần jeans</a></li>
                                <li><a href="./category.html">Quần Short</a></li>
                            </ul>
                            <ul class="header_navbar_item_product_list_ul">
                                <li class="header_navbar_item_product_list_ul_key"><a href="">Đồ lót</a></li>
                                <li><a href="./category.html">Boxer</a></li>
                                <li><a href="./category.html">Brief</a></li>
                            </ul>
                            <ul class="header_navbar_item_product_list_ul">
                                <li class="header_navbar_item_product_list_ul_key"><a href="">Phụ kiện</a></li>
                                <li><a href="./category.html">Thắt lưng</a></li>
                                <li><a href="./category.html">Ví nam</a></li>
                                <li><a href="./category.html">Cà vạt</a></li>
                                <li><a href="./category.html">Cặp da</a></li>
                                <li><a href="./category.html">Giày da</a></li>
                                <li><a href="./category.html">Vali</a></li>
                            </ul>
                            <ul class="header_navbar_item_product_list_ul">
                                <li class="header_navbar_item_product_list_ul_key"><a href="">Kidman</a></li>
                                <li><a href="./category.html">Áo sơ mi</a></li>
                                <li><a href="./category.html">Áo polo</a></li>
                                <li><a href="./category.html">Áo len</a></li>
                                <li><a href="./category.html">Áo T-Shirt</a></li>
                                <li><a href="./category.html">Áo khoác</a></li>
                                <li><a href="./category.html">Áo thun dài tay</a></li>
                            </ul>
                        </div>

                    </div>
                </li>
                <li class="header_navbar_item">
                    <span class="header_navbar_item_kw">Bộ sưu tập</span>
                </li>
                <li class="header_navbar_item header_navbar_item_logo">
                    <a href="./index.html"><img src="./public/images/logo-typo.png" alt=""></a>
                </li>
                <li class="header_navbar_item">
                    <a href="" class="header_navbar_item_kw"><span>Tin tức</span></a>
                </li>
                <li class="header_navbar_item">
                    <span class="header_navbar_item_kw">Đồng phục</span>
                </li>
                <li class="header_navbar_item">
                    <a href="" class="header_navbar_item_kw"><span>Liên hệ</span></a>
                </li>
            </ul>
        </div>
        <!-- <div class="header_hidden"></div> -->

        <!-- Search sản phẩm-->

    </header>

    <!-- END HEADER -->

    <!-- CONTAINER -->


    <!-- END CONTAINER -->

    <!-- FOOTER -->

    <!-- END FOOTER -->







</div>
<!-- END APP -->

<!-- modal Cart -->

<jsp:include page="${view}"/>
<jsp:include page="${view1}"/>
<jsp:include page="${view1}"/>
<jsp:include page="${view1}"/>
<jsp:include page="${view1}"/>

</body>
<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- Ajjax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
<!-- Jss trang -->
<script src="./public/js/main.js"></script>
<script src="./public/js/index.js"></script>
</html>
