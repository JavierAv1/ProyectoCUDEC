<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="ProyectoCudec1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="stylos.css">
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
        <div class="container text-center">
  <div class="row">
    <div class="col">
      <asp:Button class="btn" ID="botonToggle" runat="server"  Text="Agregar Producto" />
    </div>
    <div class="col">
      <asp:Button class="btn" ID="Button2" runat="server"  Text="Agregar Proveedor" />
    </div>
    <div class="col">
      <asp:Button class="btn" ID="Button3" runat="server"  Text="Agregar Categoria" />
    </div>
      <div class="col">
      <asp:Button class="btn" ID="Button4" runat="server"  Text="Agregar Departamento" />
    </div>
      <div class="col">
      <asp:Button class="btn" ID="Button9" runat="server"  Text="Agregar SubCategoria" />
    </div>
  </div>
</div>
     <div class="login-container" >
<div class="login-info-container" ID="divagregarproducto" style="display:none">
    <h1 class="title">Registrar Producto</h1>
    <div class="login" >
    </div>
    <form class="inputs-container"   id="form2">
        <asp:TextBox class="input" type="text" id="regNombre" placeholder="Nombre" runat="server"></asp:TextBox> 
        <br>
        <asp:TextBox class="input" type="text" id="regdesc" placeholder="Descripcion" runat="server"></asp:TextBox> 
        <br>
        <asp:TextBox class="input" type="text" id="regprecio" placeholder="Precio" runat="server"></asp:TextBox> 
        <br>
        <asp:TextBox class="input" type="text" id="regcan" placeholder="Cantidad" runat="server"></asp:TextBox> 
        <br>
         <div class="mb-3">
      <label for="disabledSelect" class="form-label"> selecciona Departamento</label>
      <select id="selectDep" class="form-select">
        <option>Roshfrands</option>
      </select>
    </div>
        <div class="mb-3">
      <label for="disabledSelect" class="form-label"> selecciona Provedor</label>
      <select id="selectpro" class="form-select">
        <option>Roshfrands</option>
      </select>
    </div>

        <form asp-action="SubirImagen" enctype="multipart/form-data" method="post">
        <input type="file" name="archivo" />
        <button type="submit">Subir imagen</button>
        </form>
        <asp:Button class="btn" ID="regprod" runat="server" Text="Registrar" />
         <asp:Label ID="Label1" runat="server" Text="" />
    </form>
        </div>
<div class="login-info-container" ID="divagregarprovedor" style="display:none">
    <h1 class="title">Registrar Proveedor</h1>
    <div class="login">
    </div>
    <form class="inputs-container"   id="form6">
        <asp:TextBox class="input" type="text" id="regpnombre" placeholder="Nombre" runat="server"></asp:TextBox> 
        <br>
        <asp:TextBox class="input" type="text" id="regptel" placeholder="Telefono" runat="server"></asp:TextBox> 
        <br>
        <asp:TextBox class="input" type="text" id="regpdire" placeholder="Direccion" runat="server"></asp:TextBox> 
        <br>
        <asp:Button class="btn" ID="regprov" runat="server" Text="Registrar" />
         <asp:Label ID="Label2" runat="server" Text="" />
    </form>
        </div>
         <div class="login-info-container" ID="divagregarCategoria" style="display:none">
    <h1 class="title">Registrar Categoria</h1>
    <div class="login">
    </div>
    <form class="inputs-container"   id="form3">
        <asp:TextBox class="input" type="text" id="TextBox1" placeholder="Nombre" runat="server"></asp:TextBox> 
        <br>
        <asp:TextBox class="input" type="text" id="TextBox2" placeholder="Descripcion" runat="server"></asp:TextBox> 
        <br>
        
        <asp:Button class="btn" ID="Button1" runat="server" Text="Registrar" />
         <asp:Label ID="Label3" runat="server" Text="" />
    </form>
        </div>
                  <div class="login-info-container" ID="divagregardepartamento" style="display:none">
    <h1 class="title">Registrar Departamento</h1>
    <div class="login">
    </div>
    <form class="inputs-container"   id="form4">
        <asp:TextBox class="input" type="text" id="TextBox4" placeholder="Nombre" runat="server"></asp:TextBox> 
        <br>
          <div class="mb-3">
      <label for="disabledSelect" class="form-label"> selecciona Categoria</label>
      <select id="selectpro" class="form-select">
        <option>Aceites</option>
      </select>
        <asp:Button class="btn" ID="Button5" runat="server" Text="Registrar" />
         <asp:Label ID="Label4" runat="server" Text="" />
    </form>
        </div>
        
          <div class="login-info-container" ID="subcatego" style="display:none">
    <h1 class="title">Registrar Departamento</h1>
    <div class="login">
    </div>
    <form class="inputs-container"   id="form5">
        <asp:TextBox class="input" type="text" id="TextBox3" placeholder="Nombre" runat="server"></asp:TextBox> 
        <br>
        <asp:TextBox class="input" type="text" id="TextBox5" placeholder="Descripcion" runat="server"></asp:TextBox> 
        <br>
        <asp:Button class="btn" ID="Button7" runat="server" Text="Registrar" />
         <asp:Label ID="Label5" runat="server" Text="" />
    </form>
        </div>
         </div>
          </form>
      

    <script>
        document.getElementById("Button2").addEventListener("click", function () {
            var div = document.getElementById("divagregarproducto");
            var div2 = document.getElementById("divagregarprovedor");
            var div3 = document.getElementById("divagregarCategoria");
            var div4 = document.getElementById("divagregardepartamento");
            var div5 = document.getElementById("subcatego");
            if (div2.style.display === "none") {
                div2.style.display = "block";
                div.style.display = "none";
                div3.style.display = "none";
                div4.style.display = "none";
                div5.style.display = "none";
            } else {
                div2.style.display = "none";
            }
        });
        document.getElementById("botonToggle").addEventListener("click", function () {
            var div = document.getElementById("divagregarproducto");
            var div2 = document.getElementById("divagregarprovedor");
            var div3 = document.getElementById("divagregarCategoria");
            var div4 = document.getElementById("divagregardepartamento");
            var div5 = document.getElementById("subcatego");
            if (div.style.display === "none") {
                div.style.display = "block";
                div2.style.display = "none";
                div3.style.display = "none";
                div4.style.display = "none";
                div5.style.display = "none";
            } else {
                div.style.display = "none";
            }
        });
        document.getElementById("Button3").addEventListener("click", function () {
            var div = document.getElementById("divagregarproducto");
            var div2 = document.getElementById("divagregarprovedor");
            var div3 = document.getElementById("divagregarCategoria");
            var div4 = document.getElementById("divagregardepartamento");
            var div5 = document.getElementById("subcatego");
            if (div3.style.display === "none") {
                div3.style.display = "block";
                div2.style.display = "none";
                div.style.display = "none";
                div4.style.display = "none";
                div5.style.display = "none";
            } else {
                div3.style.display = "none";
            }
        });
        document.getElementById("Button4").addEventListener("click", function () {
            var div = document.getElementById("divagregarproducto");
            var div2 = document.getElementById("divagregarprovedor");
            var div3 = document.getElementById("divagregarCategoria");
            var div4 = document.getElementById("divagregardepartamento");
            var div5 = document.getElementById("subcatego");
            if (div4.style.display === "none") {
                div4.style.display = "block";
                div2.style.display = "none";
                div.style.display = "none";
                div3.style.display = "none";
                div5.style.display = "none";
            } else {
                div4.style.display = "none";
            }
        });
        document.getElementById("Button9").addEventListener("click", function () {
            var div = document.getElementById("divagregarproducto");
            var div2 = document.getElementById("divagregarprovedor");
            var div3 = document.getElementById("divagregarCategoria");
            var div4 = document.getElementById("divagregardepartamento");
            var div5 = document.getElementById("subcatego");
            if (div5.style.display === "none") {
                div5.style.display = "block";
                div2.style.display = "none";
                div.style.display = "none";
                div3.style.display = "none";
                div4.style.display = "none";
            } else {
                div5.style.display = "none";
            }
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>