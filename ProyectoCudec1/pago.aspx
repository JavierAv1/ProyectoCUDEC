<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pago.aspx.cs" Inherits="Proyecto.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="stilos.css">
    <title></title>
</head>
<body>
    
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
      <div class="progress-checkout-container">
        <div class="progress-step-container">
            <div class="step-check">
                <span class="step-title">Compra</span>
            </div>
        </div>
        <div class="progress-step-container">
            <div class="step-check">
                <span class="step-title">Pago</span>
            </div>
        </div>
        <div class="progress-step-container">
            <div class="step-check">
                <span class="step-title">Envio</span>
            </div>
        </div>
      </div>
      <div class="form-container">
        <h2 class="form-title">Detalles de Pago</h2>
        <form id="form2" class="checkout-form" runat="server">
            <div class="input-line">
                <label for="name">Nombre de la Tarjeta</label>
                <asp:TextBox type="text" name="name" runat="server" placeholder="Su Nombre y Apellido"></asp:TextBox>
            </div>
            <div class="input-line">
                <label for="name">Numero de Tarjeta</label>
                <asp:TextBox type="text" name="name" runat="server" placeholder="1112-2244-4455-6666"></asp:TextBox>
            </div>
            <div class="input-container">
                <div class="input-line">
                    <label for="name">Expira</label>
                    <asp:TextBox type="text" name="date" id="date" runat="server" placeholder="09-22"></asp:TextBox>
                </div>
                <div class="input-line">
                    <label for="name">CVC</label>
                    <asp:TextBox type="text" name="cv" id="cv" runat="server" placeholder="****"></asp:TextBox>
                </div>
            </div>
           <asp:Button  type="button" Text="Siguiente"  runat="server"/>
        </form>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>
