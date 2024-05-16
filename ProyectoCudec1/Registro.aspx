<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="ProyectoCudec1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="stylos.css">
    <title>Registro</title>
</head>
<body>
     <div class="login-container">
<div class="login-info-container">
    <h1 class="title">Registrar Usuario</h1>
    <div class="login">
    </div>
    <form class="inputs-container"  runat="server" id="form1">
        <asp:TextBox class="input" type="text" id="reguser" placeholder="Correo" runat="server"></asp:TextBox> 
        <br>
        <asp:TextBox class="input" type="text" id="TextBox2" placeholder="Nombre" runat="server"></asp:TextBox> 
        <br>
        <asp:TextBox class="input" type="text" id="regpass" placeholder="Contraseñna" runat="server"></asp:TextBox> 
        <br>
        <asp:TextBox class="input" type="text" id="regcel" placeholder="Telefono" runat="server"></asp:TextBox> 
        <br>
        <asp:TextBox class="input" type="text" id="reguser2" placeholder="Usuario" runat="server"></asp:TextBox> 
        <br>
        <asp:Button class="btn" ID="button1" runat="server" OnClick="button1_Click" Text="Registrar" />
         <asp:Label ID="Label1" runat="server" Text="" />
    </form>
</body>
</html>

