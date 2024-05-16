<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Proyecto.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="Style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title></title>
</head>
<body style="background-color: rgb(241, 248, 248);">

    
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
      <div class="container" style="background-image: url('Images/Background3.jpeg');background-repeat: no-repeat;background-position: center; background-size: cover;">
        <div class="container text-center">
          <div class="row align-items-center">
              <div class="col m-4">
                <div id="carouselExampleInterval2" class="carousel slide" data-bs-ride="carousel" style="width: 60%; height: 60%; margin: auto;">
                  <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="10000">
                      <img src="Images/Diesel.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                      <img src="Images/Anticongelante.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                      <img src="Images/Aceite.jpg" class="d-block w-100" alt="...">
                    </div>
                  </div>
                  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval2" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                  </button>
                  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval2" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                  </button>
                </div>
              </div>
              <div class="col m-4">
                <div id="carouselExampleInterval1" class="carousel slide" data-bs-ride="carousel" style="width: 60%; height: 60%; margin: auto;">
                  <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="10000">
                      <img src="Images/Diesel.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                      <img src="Images/Anticongelante.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                      <img src="Images/Aceite.jpg" class="d-block w-100" alt="...">
                    </div>
                  </div>
                  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval1" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                  </button>
                  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval1" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                  </button>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="container" style="background-image: url('Images/Background3.jpeg');background-repeat: no-repeat;background-position: center; background-size: cover;">
        <div class="container text-center">
          <div class="row align-items-center">
              <div class="col m-4">
                <div id="carouselExampleInterval4" class="carousel slide" data-bs-ride="carousel" style="width: 60%; height: 60%; margin: auto;">
                  <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="10000">
                      <img src="Images/Diesel.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                      <img src="Images/Anticongelante.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                      <img src="Images/Aceite.jpg" class="d-block w-100" alt="...">
                    </div>
                  </div>
                  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval4" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                  </button>
                  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval4" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                  </button>
                </div>
              </div>
              <div class="col m-4">
                <div id="carouselExampleInterval5" class="carousel slide" data-bs-ride="carousel" style="width: 60%; height: 60%; margin: auto;">
                  <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="10000">
                      <img src="Images/Diesel.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item" data-bs-interval="2000">
                      <img src="Images/Anticongelante.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                      <img src="Images/Aceite.jpg" class="d-block w-100" alt="...">
                    </div>
                  </div>
                  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval5" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                  </button>
                  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval5" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                  </button>
                </div>
              </div>
            </div>
          </div>
      </div>
      <br>
      <div class="container" style="padding-right: 10px;border-right: 1px solid #0b0b0b;">
        <span class="placeholder col-12 bg-secondary"></span>
      </div>
      </div>
      <div class="container" style="background-image: url('Images/Background.jpeg');background-repeat: no-repeat;background-position: center; background-size: cover;" >
        <div class="container">
          <div class="container text-center">
            <div class="row align-items-center">
                <div class="col m-4">
                  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1117.91456900156!2d-99.1975342227435!3d19.53296452700432!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85d21d50f953a725%3A0x80f21e0bba22de68!2sUniversidad%20Multicultural%20CUDEC!5e0!3m2!1ses!2smx!4v1702406788608!5m2!1ses!2smx" width="400" height="455" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>>
                </div>
                <div class="col m-4">
                  <div class="card" width="400" height="460" >
                    <img src="Images/Refacciones.jpeg" class="card-img-top" alt="..." >
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
                            <i  class="bi bi-facebook icono-redes" ></i> <!-- Sustituye 'fa-home' con el nombre del icono que desees -->
                          </a>
                            <a href="https://api.whatsapp.com/send?phone=5215544880525&text=Hola">
                              <i  class="bi bi-whatsapp icono-redes" ></i> <!-- Sustituye 'fa-home' con el nombre del icono que desees -->
                            </a>
                            <a href="facebook.com">
                              <i  class="bi bi-instagram icono-redes"></i> <!-- Sustituye 'fa-home' con el nombre del icono que desees -->
                            </a>
                        </div>
                      </div>
                </div>
              </div>
            </div>
        </div>
      </div>
      <div class="container">

      </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>
