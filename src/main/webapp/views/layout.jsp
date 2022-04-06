<%--
  Created by IntelliJ IDEA.
  User: thongpro
  Date: 3/17/22
  Time: 10:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
    <title>Trang chủ</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <script src="https://kit.fontawesome.com/29b41ee1c8.js" crossorigin="anonymous"></script>
    <style>
        /* input.ng-valid {
            border: 2px solid green;
            border-radius: 4px;
        } */

        .loading {
            background: rgba(0, 0, 0, .5);
            width: 100%;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 999;
        }

        .spinner-center {
            top: 50%;
            left: 50%;
            position: absolute;
        }
    </style>
</head>

<body>
<div class="container">
    <header class="row">
        <div class="col-12">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                            class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://caodang.fpt.edu.vn/wp-content/uploads/1900x750-3.png"
                             class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="https://caodang.fpt.edu.vn/wp-content/uploads/179133859_1390460777993405_366676460905399720_n.png"
                             class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src=https://caodang.fpt.edu.vn/wp-content/uploads/Banner-PC-1.png"
                             class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </header>
    <nav class="row navbar navbar-expand-lg navbar-dark bg-dark sticky-top m-0 p-1 ">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#my-navbar"
                    aria-controls="my-navbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="my-navbar">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item row ">
                        <a class="nav-link bi bi-house-door-fill" href="#home"> &nbsp;&nbsp;FPT Polytechnic
                            &nbsp;&nbsp;</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link bi bi-blockquote-left" href="#introduce"> &nbsp;&nbsp;Giới
                            thiệu&nbsp;&nbsp;</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link bi bi-telephone-fill" href="#contact"> &nbsp;&nbsp;Liên
                            hệ&nbsp;&nbsp;</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link bi bi-envelope" href="#feedback"> &nbsp;&nbsp;Góp ý&nbsp;&nbsp;</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link bi bi-question-circle-fill" href="#qa">&nbsp;&nbsp;Hỏi
                            đáp&nbsp;&nbsp;</a>
                    </li>
                </ul>
                <!-- <span class="navbar-text p-0"> -->
                <li class="nav-item dropdown row">
                    <a class="nav-link dropdown-toggle bi bi-person-fill navbar-text" href="#"
                       id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        &nbsp;&nbsp;Xin Chào &nbsp;&nbsp;
                    </a>
                    <ul class="dropdown-menu bg-secondary" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item responsive-font-example"
                               href="#login">Đăng Nhập</a></li>
                        <li><a class="dropdown-item responsive-font-example"
                               href="#register">Đăng Ký</a></li>
                        <li><a class="dropdown-item responsive-font-example"
                               href="#login">Đăng Xuất</a></li>
                        <li><a class="dropdown-item responsive-font-example"
                               href="#changepassword">Đổi Mật Khẩu</a>
                        </li>
                        <li><a class="dropdown-item responsive-font-example">Cập Nhập Tài
                            Khoản</a></li>
                    </ul>
                </li>
            </div>
        </div>
    </nav>
    <ul class="nav justify-content-center">
        <li class="nav-item">
            <a class="nav-link " href="/create">User</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/createCategory">Category</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/createProduct">Product</a>
        </li>
    </ul>

    <jsp:include page="${view}"/>
    <jsp:include page="${view1}"/>

    <footer class="row bg-secondary ms-0 me-0">
        <div class="col-sm-3">
            <img src="https://phothongcaodang.fpt.edu.vn/wp-content/uploads/LOGO-PTC%C4%90-White-Transparency.png"
                 class="w-75 pt-2" alt="">
        </div>
        <div class="col-sm-3 pt-3">
            <h5 class="text-uppercase text-white">Thông tin liên hệ</h5>
            <p class="text-white">
                <i class="bi bi-envelope-fill"></i> Email: caodangefpt.edu.vn
                <br>
                <i class="bi bi-telephone-fill"></i> <span class="text-decoration-underline">(024) 7300 1955</span>
            </p>
        </div>
        <div class="col-sm-6 pt-3">
            <h5 class="text-uppercase text-white">Địa chỉ cơ sở Hà Nội</h5>
            <p class="text-white">
                <i class="bi bi-geo-alt-fill"></i> Tòa nhà FPT Polytechnic, Phố Trịnh Văn Bô, Nam Từ Liêm, Hà Nội
                <br>
                <i class="bi bi-telephone-fill"></i> <span class="text-decoration-underline">(024) 8582 0808</span>
            </p>
        </div>
    </footer>
</div>
</body>

</html>