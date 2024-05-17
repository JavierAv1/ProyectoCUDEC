<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="ProyectoCudec1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="ccs2.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title></title>
    <style>
        /* Estilos personalizados aquí */
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <header>
      <h1 class="logo">Refaccionaria</h1>
      <img src="Images/logo.jpg" alt="" class="icon">
      <div class="menu-icons-container">
          <img src="images/Carrito.png" alt="" class="icon">
          <img src="images/usuario.png" alt="" class="icon">
          
        </div>
  </header>
  <br>
  <br>
  <br>
 
      <div class="container" >
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
                  <a class="nav-link" href="#">Lubricantes y Quimicos</a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Filtros
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Coche</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">Camion</a></li>
                  </ul>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Baterías
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">24V</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">12V</a></li>
                  </ul>
                </li>
              </ul>
              <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="right: 3%;" >
                <button class="btn btn-outline-success" type="submit" style="right: 20%;">Search</button>
              </form>
            </div>
          </div>
        </nav>
      </div>
      <br>
      <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Descripción</th>
                <th>Provedoor</th>
                <th>Departamento</th>
                <th>Proveedor</th>
            </tr>
        </thead>
        <tbody>
            @foreach (var producto in Model)
            {
                <tr>
                    <td>@producto.Nombre</td>
                    <td>@producto.Precio</td>
                    <td>
                        <form asp-action="Eliminar" asp-route-id="@producto.Id" method="post">
                            <button type="submit">Eliminar</button>
                        </form>
                        <form asp-action="Modificar" asp-route-id="@producto.Id" method="post">
                            <button type="submit">Modificar</button>
                        </form>
                    </td>
                </tr>
            }
        </tbody>
    </table>

    <h2>Agregar Nuevo Producto</h2>
    <form asp-action="Agregar" method="post">
        <label>Nombre:</label>
        <input type="text" name="Nombre" />
        <br />
        <label>Precio:</label>
        <input type="text" name="Precio" />
        <br />
        <button type="submit">Agregar</button>
    </form>

          </form>
      </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>