﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ProyectoCudec1.WebForm4" EnableEventValidation="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="Style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Refaccionaria</title>
    <style>
        .icono-redes {
            font-size: 2rem;
            color: #3b5998;
            margin: 10px;
        }

        .menu-icons-container img.icon {
            margin: 0 10px;
        }

        .btn-custom {
            margin-left: 10px;
        }

        .navbar-custom {
            margin-top: 80px; /* Aumentar margen superior para asegurar espacio adecuado */
        }

        .card-img-placeholder {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 200px; /* Ajustar según el tamaño de las imágenes */
            background-color: #f8f9fa;
        }

        .bi-image-placeholder {
            font-size: 3rem;
            color: #6c757d;
        }

        .card {
            width: 35rem;
            margin: 15px;
        }

        .card img {
            height: 180px;
            object-fit: cover;
        }

        .carousel-item {
            display: flex;
            justify-content: center;
        }
        
        .carousel-inner {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card-img-placeholder {
            height: 180px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="p-3">
            <div class="d-flex justify-content-between align-items-center">
                <div class="d-flex align-items-center">
                    <h1 class="logo">Refaccionaria</h1>
                    <img src="src/logo.jpg" alt="Logo" class="icon">
                    <img src="scr/usuario.png" alt="" class="icon">
                </div>
                <div>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-secondary btn-custom" PostBackUrl="~/Login.aspx" />
                </div>
                <asp:LinkButton ID="btnCarritoCompras" runat="server" CssClass="btn btn-primary btn-custom me-2" OnClick="btnCarritoCompras_Click">
                    <i class="bi bi-cart"></i> Carrito de Compras
                </asp:LinkButton>
            </div>
            <div class="mt-2 d-flex justify-content-end">
                <asp:Button ID="btnAdminProduct" runat="server" Text="Administrar Productos" CssClass="btn btn-primary btn-custom me-2" Visible="false" PostBackUrl="~/frmProducto.aspx" />
                <asp:Button ID="btnAdminAccess" runat="server" Text="Acceso Administrador" CssClass="btn btn-danger btn-custom" Visible="false" PostBackUrl="~/frmAdministrador.aspx" />
            </div>
        </header>
        <div class="container navbar-custom">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Accesorios</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Tren Motriz</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Suspensión</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Frenos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Motor</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Lubricantes y Químicos</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Filtros</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Coche</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Camión</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Baterías</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">24V</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">12V</a></li>
                                </ul>
                            </li>
                        </ul>
                        <form class="d-flex" role="search">
                            <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Buscar</button>
                        </form>
                    </div>
                </div>
            </nav>
        </div>

        <!-- Carrusel de productos -->
        <div id="productosCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <asp:Repeater ID="ProductosRepeater" runat="server" OnItemDataBound="ProductosRepeater_ItemDataBound" OnItemCommand="ProductosRepeater_ItemCommand">
                    <ItemTemplate>
                        <div class="carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>">
                            <div class="card mb-4 shadow-sm">
                                <asp:Literal ID="ImageLiteral" runat="server" />
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                    <p class="card-text"><%# Eval("DescripcionDelProducto") %></p>
                                    <asp:LinkButton ID="btnAddToCart" runat="server" CommandName="AddToCart" CommandArgument='<%# Eval("idProductos") %>' Text="Añadir al Carrito" CssClass="btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#productosCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#productosCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <!-- Paginación -->
      <%--  <div class="row">
            <div class="col-md-12 text-center">
                <asp:Button ID="idSiguiente" runat="server" Text="Siguiente" CssClass="btn btn-secondary btn-custom" OnClick="idSiguiente_Click" />
                <asp:Button ID="idAnterior" runat="server" Text="Anterior" CssClass="btn btn-secondary btn-custom" OnClick="idAnterior_Click" />
            </div>
        </div>--%>

        <br>
        <div class="container" style="padding-right: 10px; border-right: 1px solid #0b0b0b;">
            <span class="placeholder col-12 bg-secondary"></span>
        </div>
        <div class="container" style="background-image: url('src/Background.jpeg'); background-repeat: no-repeat; background-position: center; background-size: cover;">
            <div class="container">
                <div class="container text-center">
                    <div class="row align-items-center">
                        <div class="col m-4">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1117.91456900156!2d-99.1975342227435!3d19.53296452700432!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85d21d50f953a725%3A0x80f21e0bba22de68!2sUniversidad%20Multicultural%20CUDEC!5e0!3m2!1ses!2smx!4v1702406788608!5m2!1ses!2smx" width="400" height="455" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                        <div class="col m-4">
                            <div class="card" width="400" height="460">
                                <img src="src/Refacciones.jpeg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Nuestros Servicios</h5>
                                    <p class="card-text">Somos una empresa dedicada a la venta de refacciones de autos pequeños y grandes.</p>
                                    <a href="tel:5544880525" class="btn btn-primary">LLamar</a>
                                </div>
                            </div>
                        </div>
                        <div class="col m-4">
                            <div class="container text-center">
                                <div class="row align-items-center">
                                    <div class="col m-4">
                                        <a href="facebook.com">
                                            <i class="bi bi-facebook icono-redes"></i>
                                        </a>
                                        <a href="https://api.whatsapp.com/send?phone=5215544880525&text=Hola">
                                            <i class="bi bi-whatsapp icono-redes"></i>
                                        </a>
                                        <a href="facebook.com">
                                            <i class="bi bi-instagram icono-redes"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="container" style="padding-right: 10px; border-right: 1px solid #0b0b0b;">
            <span class="placeholder col-12 bg-secondary"></span>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4lQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>
