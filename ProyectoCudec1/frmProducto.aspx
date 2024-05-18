﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmProducto.aspx.cs" Inherits="ProyectoCudec1.frmProducto" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrar Productos</title>
    
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .btn-edit {
            background-color: #5cb85c;
            color: white;
        }
        .btn-delete {
            background-color: #d9534f;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="mb-4">Administrar Productos</h2>
            <asp:Button ID="btnHome" runat="server" Text="Inicio" CssClass="btn btn-secondary mb-3" PostBackUrl="~/index.aspx" />
            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="idProductos" CssClass="table table-striped table-bordered" OnRowEditing="gvProducts_RowEditing" OnRowUpdating="gvProducts_RowUpdating" OnRowCancelingEdit="gvProducts_RowCancelingEdit" OnRowDeleting="gvProducts_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="idProductos" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Descripcion_del_producto" HeaderText="Descripción" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Editar" CssClass="btn btn-edit btn-sm" />
                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Eliminar" CssClass="btn btn-delete btn-sm" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Actualizar" CssClass="btn btn-primary btn-sm" />
                            <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancelar" CssClass="btn btn-secondary btn-sm" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <div class="form-row">
                <div class="form-group col-md-3">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Nombre" />
                </div>
                <div class="form-group col-md-3">
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" Placeholder="Descripción" />
                </div>
                <div class="form-group col-md-2">
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" Placeholder="Precio" />
                </div>
                <div class="form-group col-md-2">
                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" Placeholder="Cantidad" />
                </div>
                <div class="form-group col-md-2">
                    <asp:FileUpload ID="fileImage" runat="server" CssClass="form-control-file" />
                </div>
            </div>
            <asp:Button ID="btnInsert" runat="server" Text="Insertar" CssClass="btn btn-primary" OnClick="btnInsert_Click" />
        </div>
    </form>
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>