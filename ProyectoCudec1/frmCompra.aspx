<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmCompra.aspx.cs" Inherits="ProyectoCudec1.frmCompra" EnableEventValidation="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Carrito de Compras</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Carrito de Compras</h2>
            <asp:Button ID="btnHome" runat="server" Text="Inicio" CssClass="btn btn-secondary mb-3" PostBackUrl="~/index.aspx" />
            <asp:GridView ID="gvCarrito" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" DataKeyNames="idProducto">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Producto" />
                    <asp:BoundField DataField="DescripcionDelProducto" HeaderText="Descripción" />
                    <asp:TemplateField HeaderText="Cantidad">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCantidad" runat="server" Text='<%# Bind("Cantidad") %>' CssClass="form-control" AutoPostBack="true" OnTextChanged="txtCantidad_TextChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Precio" HeaderText="Precio Unitario" DataFormatString="{0:C}" />
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandArgument='<%# Eval("idProducto") %>' OnClick="btnEliminar_Click" CssClass="btn btn-danger" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="mt-3">
                <asp:Label ID="lblTotalProductos" runat="server" CssClass="h5"></asp:Label>
                <br />
                <asp:Label ID="lblTotalPedido" runat="server" CssClass="h5"></asp:Label>
            </div>
            <div class="mt-4">
                <asp:Button ID="btnComprar" runat="server" Text="Comprar" OnClick="btnComprar_Click" CssClass="btn btn-success" />
                <asp:Button ID="btnRegresar" runat="server" Text="Regresar al Inicio" PostBackUrl="~/index.aspx" CssClass="btn btn-secondary" />
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
