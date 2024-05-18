<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAdministrador.aspx.cs" Inherits="ProyectoCudec1.frmAdministrador" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
    <title>Administrador</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="mb-4">Administrador</h2>
            
            <!-- Panel de Control -->
            <ul class="nav nav-tabs" id="adminTabs" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="departamento-tab" data-bs-toggle="tab" data-bs-target="#departamento" type="button" role="tab" aria-controls="departamento" aria-selected="true">Departamento</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="catalogo-tab" data-bs-toggle="tab" data-bs-target="#catalogo" type="button" role="tab" aria-controls="catalogo" aria-selected="false">Catálogo</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="proveedor-tab" data-bs-toggle="tab" data-bs-target="#proveedor" type="button" role="tab" aria-controls="proveedor" aria-selected="false">Proveedor</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="categoria-tab" data-bs-toggle="tab" data-bs-target="#categoria" type="button" role="tab" aria-controls="categoria" aria-selected="false">Categoría</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="subcategoria-tab" data-bs-toggle="tab" data-bs-target="#subcategoria" type="button" role="tab" aria-controls="subcategoria" aria-selected="false">Subcategoría</button>
                </li>
            </ul>
            
            <div class="tab-content mt-4" id="adminTabsContent">
                <!-- Departamento -->
                <div class="tab-pane fade show active" id="departamento" role="tabpanel" aria-labelledby="departamento-tab">
                    <h3>Departamento</h3>
                    <div class="mb-3">
                        <asp:TextBox ID="txtDepartamentoNombre" runat="server" CssClass="form-control" Placeholder="Nombre del Departamento"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="ddlCategoriaDepartamento" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Seleccione una categoría" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnAgregarDepartamento" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregarDepartamento_Click" />
                    </div>
                    <asp:GridView ID="gvDepartamento" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="idDepartamento" OnRowEditing="gvDepartamento_RowEditing" OnRowUpdating="gvDepartamento_RowUpdating" OnRowCancelingEdit="gvDepartamento_RowCancelingEdit" OnRowDeleting="gvDepartamento_RowDeleting" OnRowDataBound="gv_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="idDepartamento" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Nombre_departamento" HeaderText="Nombre" />
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
                
                <!-- Catálogo -->
                <div class="tab-pane fade" id="catalogo" role="tabpanel" aria-labelledby="catalogo-tab">
                    <h3>Catálogo</h3>
                    <div class="mb-3">
                        <asp:TextBox ID="txtCatalogoDescripcion" runat="server" CssClass="form-control" Placeholder="Descripción"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:FileUpload ID="fuCatalogoImagenes" runat="server" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="ddlCatalogoProductos" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Seleccione un producto" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnAgregarCatalogo" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregarCatalogo_Click" />
                    </div>
                    <asp:GridView ID="gvCatalogo" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="idCatalogo" OnRowEditing="gvCatalogo_RowEditing" OnRowUpdating="gvCatalogo_RowUpdating" OnRowCancelingEdit="gvCatalogo_RowCancelingEdit" OnRowDeleting="gvCatalogo_RowDeleting" OnRowDataBound="gv_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="idCatalogo" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                            <asp:BoundField DataField="imagenes" HeaderText="Imágenes" />
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
                
                <!-- Proveedor -->
                <div class="tab-pane fade" id="proveedor" role="tabpanel" aria-labelledby="proveedor-tab">
                    <h3>Proveedor</h3>
                    <div class="mb-3">
                        <asp:TextBox ID="txtProveedorNombre" runat="server" CssClass="form-control" Placeholder="Nombre del Proveedor"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtProveedorTelefono" runat="server" CssClass="form-control" Placeholder="Teléfono"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtProveedorDireccion" runat="server" CssClass="form-control" Placeholder="Dirección"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnAgregarProveedor" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregarProveedor_Click" />
                    </div>
                    <asp:GridView ID="gvProveedor" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="idProveedor" OnRowEditing="gvProveedor_RowEditing" OnRowUpdating="gvProveedor_RowUpdating" OnRowCancelingEdit="gvProveedor_RowCancelingEdit" OnRowDeleting="gvProveedor_RowDeleting" OnRowDataBound="gv_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="idProveedor" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                            <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
                
                <!-- Categoría -->
                <div class="tab-pane fade" id="categoria" role="tabpanel" aria-labelledby="categoria-tab">
                    <h3>Categoría</h3>
                    <div class="mb-3">
                        <asp:TextBox ID="txtCategoriaNombre" runat="server" CssClass="form-control" Placeholder="Nombre de la Categoría"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtCategoriaDescripcion" runat="server" CssClass="form-control" Placeholder="Descripción"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnAgregarCategoria" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregarCategoria_Click" />
                    </div>
                    <asp:GridView ID="gvCategoria" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="idCategoria" OnRowEditing="gvCategoria_RowEditing" OnRowUpdating="gvCategoria_RowUpdating" OnRowCancelingEdit="gvCategoria_RowCancelingEdit" OnRowDeleting="gvCategoria_RowDeleting" OnRowDataBound="gv_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="idCategoria" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Nombre_categoria" HeaderText="Nombre" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
                
                <!-- Subcategoría -->
                <div class="tab-pane fade" id="subcategoria" role="tabpanel" aria-labelledby="subcategoria-tab">
                    <h3>Subcategoría</h3>
                    <div class="mb-3">
                        <asp:TextBox ID="txtSubcategoriaNombre" runat="server" CssClass="form-control" Placeholder="Nombre de la Subcategoría"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="ddlCategoriaSubcategoria" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Seleccione una categoría" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnAgregarSubcategoria" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregarSubcategoria_Click" />
                    </div>
                    <asp:GridView ID="gvSubcategoria" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="idSubcategoria" OnRowEditing="gvSubcategoria_RowEditing" OnRowUpdating="gvSubcategoria_RowUpdating" OnRowCancelingEdit="gvSubcategoria_RowCancelingEdit" OnRowDeleting="gvSubcategoria_RowDeleting" OnRowDataBound="gv_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="idSubcategoria" HeaderText="ID" ReadOnly="True" />
                            <asp:BoundField DataField="Nombre_de_subcategoria" HeaderText="Nombre" />
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
