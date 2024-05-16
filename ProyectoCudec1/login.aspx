<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Proyecto.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="stylos.css">
    <title></title>
</head>
<body>

          <div class="login-container">
        <div class="login-info-container">
            <h1 class="title">Iniciar Sesión</h1>
            <div class="login">
            </div>
            <form class="inputs-container"  runat="server" id="form1">
                <asp:TextBox class="input" type="text" id="txtuser" placeholder="Usuario" runat="server"></asp:TextBox> 
                <br>
                <asp:TextBox class="input" type="password" id="txtPassword" placeholder="Contraseña" runat="server"></asp:TextBox> 
                <br>
                <asp:Button class="btn" ID="button1" OnClick="button1_Click" runat="server"  Text="Iniciar Sesión" />
            </form>
        </div>
        <img class="image-container" src="/images/logo.svg" alt="" />
    </div>
        
    
</body>
</html>
