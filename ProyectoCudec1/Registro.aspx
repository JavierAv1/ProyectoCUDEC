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
            <div class="login"></div>
            <form class="inputs-container" runat="server" id="form1" enctype="multipart/form-data">
                <asp:TextBox class="input" type="text" ID="reguser" placeholder="Correo" runat="server"></asp:TextBox>
                <br>
                <asp:TextBox class="input" type="text" ID="TextBox2" placeholder="Nombre" runat="server"></asp:TextBox>
                <br>
                <asp:TextBox class="input" type="text" ID="TxtAPaterno" placeholder="Apellido Paterno" runat="server"></asp:TextBox>
                <br>
                <asp:TextBox class="input" type="text" ID="TxtAMaterno" placeholder="Apellido Materno" runat="server"></asp:TextBox>
                <br>
                <asp:TextBox class="input" type="password" ID="regpass" placeholder="Contraseña" runat="server"></asp:TextBox>
                <br>
                <asp:TextBox class="input" type="text" ID="regcel" placeholder="Teléfono" runat="server"></asp:TextBox>
                <br>
                <asp:TextBox class="input" type="text" ID="reguser2" placeholder="Usuario" runat="server"></asp:TextBox>
                <br>
                <asp:TextBox class="input" type="text" ID="txtFechaNacimiento" placeholder="Fecha de Nacimiento" runat="server"></asp:TextBox>
                <asp:Calendar ID="calFechaNacimiento" runat="server" OnSelectionChanged="calFechaNacimiento_SelectionChanged"></asp:Calendar>
                <br>
                <asp:DropDownList ID="ddlSexo" runat="server" CssClass="input">
                    <asp:ListItem Text="Seleccione Género" Value=""></asp:ListItem>
                    <asp:ListItem Text="Hombre" Value="Hombre"></asp:ListItem>
                    <asp:ListItem Text="Mujer" Value="Mujer"></asp:ListItem>
                </asp:DropDownList>
                <br>
                <asp:FileUpload ID="fileUploadFoto" runat="server" CssClass="input" />
                <br>
                <asp:Button class="btn" ID="button1" runat="server" OnClick="button1_Click" Text="Registrar" />
                <asp:Label ID="Label1" runat="server" Text="" />
            </form>
        </div>
    </div>
</body>
</html>
