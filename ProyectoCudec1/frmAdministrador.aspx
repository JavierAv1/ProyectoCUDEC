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
        <asp:HiddenField ID="hidActiveTab" runat="server" />
        <div class="container mt-5">
            <h2 class="mb-4">Administrador</h2>
            <asp:Button ID="btnHome" runat="server" Text="Inicio" CssClass="btn btn-secondary mb-3" PostBackUrl="~/index.aspx" />
            <!-- Panel de Control -->
            <ul class="nav nav-tabs" id="adminTabs" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="departamento-tab" data-bs-toggle="tab" data-bs-target="#departamento" type="button" role="tab" aria-controls="departamento" aria-selected="true">Departamento</button>
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
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="usuario-tab" data-bs-toggle="tab" data-bs-target="#usuario" type="button" role="tab" aria-controls="usuario" aria-selected="false">Usuario</button>
                </li>
            </ul>

            <div class="tab-content mt-4" id="adminTabsContent">
                <!-- Departamento -->
                <div class="tab-pane fade" id="departamento" role="tabpanel" aria-labelledby="departamento-tab">
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
                            <asp:TemplateField HeaderText="Nombre">
                                <ItemTemplate>
                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("Nombre") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
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
                            <asp:TemplateField HeaderText="Nombre">
                                <ItemTemplate>
                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("Nombre") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Teléfono">
                                <ItemTemplate>
                                    <asp:Label ID="lblTelefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTelefono" runat="server" Text='<%# Bind("Telefono") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Dirección">
                                <ItemTemplate>
                                    <asp:Label ID="lblDireccion" runat="server" Text='<%# Bind("Direccion") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDireccion" runat="server" Text='<%# Bind("Direccion") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
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
                        <asp:TextBox ID="txtCategoriaProvee1" runat="server" CssClass="form-control" Placeholder="Descripción"></asp:TextBox>
                        </div>
                    <div class="mb-3">
                        <asp:Button ID="btnAgregarCategoria" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregarCategoria_Click" />
                    </div>
                    <asp:GridView ID="gvCategoria" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="idCategoria" OnRowEditing="gvCategoria_RowEditing" OnRowUpdating="gvCategoria_RowUpdating" OnRowCancelingEdit="gvCategoria_RowCancelingEdit" OnRowDeleting="gvCategoria_RowDeleting" OnRowDataBound="gv_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="idCategoria" HeaderText="ID" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Nombre">
                                <ItemTemplate>
                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("Nombre") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Descripción">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescripcion" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescripcion" runat="server" Text='<%# Bind("Descripcion") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
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
                            <asp:TemplateField HeaderText="Nombre">
                                <ItemTemplate>
                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("Nombre") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>

                <!-- Usuario -->
                <div class="tab-pane fade" id="usuario" role="tabpanel" aria-labelledby="usuario-tab">
                    <h3>Usuario</h3>
                    <div class="mb-3">
                        <asp:TextBox ID="txtUsuarioNombre" runat="server" CssClass="form-control" Placeholder="Nombre"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtUsuarioApellidoPaterno" runat="server" CssClass="form-control" Placeholder="Apellido Paterno"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtUsuarioApellidoMaterno" runat="server" CssClass="form-control" Placeholder="Apellido Materno"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtUsuarioFechaDeNacimiento" runat="server" CssClass="form-control" Placeholder="Fecha de Nacimiento (dd/MM/yyyy)"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="ddlUsuarioSexo" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Seleccione sexo" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Masculino" Value="M"></asp:ListItem>
                            <asp:ListItem Text="Femenino" Value="F"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtUsuarioUserName" runat="server" CssClass="form-control" Placeholder="User Name"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtUsuarioCorreo" runat="server" CssClass="form-control" Placeholder="Correo"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtUsuarioContraseña" runat="server" CssClass="form-control" Placeholder="Contraseña"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtUsuarioTelefono" runat="server" CssClass="form-control" Placeholder="Teléfono"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:TextBox ID="txtUsuarioCelular" runat="server" CssClass="form-control" Placeholder="Celular"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <asp:FileUpload ID="fuUsuarioFotoDePerfil" runat="server" CssClass="form-control" />
                    </div>
                    <div class="mb-3">
                        <asp:DropDownList ID="ddlTipoUsuario" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Seleccione tipo de usuario" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnAgregarUsuario" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="btnAgregarUsuario_Click" />
                    </div>
                    <asp:GridView ID="gvUsuario" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="usuario_id" OnRowEditing="gvUsuario_RowEditing" OnRowUpdating="gvUsuario_RowUpdating" OnRowCancelingEdit="gvUsuario_RowCancelingEdit" OnRowDeleting="gvUsuario_RowDeleting" OnRowDataBound="gv_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="usuario_id" HeaderText="ID" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Nombre">
                                <ItemTemplate>
                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("Nombre") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Apellido Paterno">
                                <ItemTemplate>
                                    <asp:Label ID="lblApellidoPaterno" runat="server" Text='<%# Bind("ApellidoPaterno") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtApellidoPaterno" runat="server" Text='<%# Bind("ApellidoPaterno") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Apellido Materno">
                                <ItemTemplate>
                                    <asp:Label ID="lblApellidoMaterno" runat="server" Text='<%# Bind("ApellidoMaterno") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtApellidoMaterno" runat="server" Text='<%# Bind("ApellidoMaterno") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fecha de Nacimiento">
                                <ItemTemplate>
                                    <asp:Label ID="lblFechaDeNacimiento" runat="server" Text='<%# Bind("FechaDeNacimiento", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtFechaDeNacimiento" runat="server" Text='<%# Bind("FechaDeNacimiento", "{0:dd/MM/yyyy}") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sexo">
                                <ItemTemplate>
                                    <asp:Label ID="lblSexo" runat="server" Text='<%# Bind("Sexo") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="Seleccione sexo" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Masculino" Value="M"></asp:ListItem>
                                        <asp:ListItem Text="Femenino" Value="F"></asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="User Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtUserName" runat="server" Text='<%# Bind("UserName") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Correo">
                                <ItemTemplate>
                                    <asp:Label ID="lblCorreo" runat="server" Text='<%# Bind("Correo") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCorreo" runat="server" Text='<%# Bind("Correo") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contraseña">
                                <ItemTemplate>
                                    <asp:Label ID="lblContraseña" runat="server" Text='<%# Bind("Contraseña") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtContraseña" runat="server" Text='<%# Bind("Contraseña") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Teléfono">
                                <ItemTemplate>
                                    <asp:Label ID="lblTelefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTelefono" runat="server" Text='<%# Bind("Telefono") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Celular">
                                <ItemTemplate>
                                    <asp:Label ID="lblCelular" runat="server" Text='<%# Bind("Celular") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCelular" runat="server" Text='<%# Bind("Celular") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Foto de Perfil">
                                <ItemTemplate>
                                    <asp:Label ID="lblFotoDePerfil" runat="server" Text="Imagen"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:FileUpload ID="fuFotoDePerfil" runat="server" CssClass="form-control" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tipo de Usuario">
                                <ItemTemplate>
                                    <asp:Label ID="lblTipoUsuario" runat="server" Text='<%# Bind("TipoUsuario_idTipousuario") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="mb-3">
                                        <asp:DropDownList ID="ddlTipoUsuario" runat="server" CssClass="form-select">
                                            <asp:ListItem Text="Seleccione tipo de usuario" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var activeTab = document.getElementById("<%= hidActiveTab.ClientID %>").value;
            if (activeTab) {
                var tabElement = document.querySelector('[data-bs-target="' + activeTab + '"]');
                if (tabElement) {
                    var tab = new bootstrap.Tab(tabElement);
                    tab.show();
                }
            }

            document.querySelectorAll('[data-bs-toggle="tab"]').forEach(function (tab) {
                tab.addEventListener("click", function () {
                    document.getElementById("<%= hidActiveTab.ClientID %>").value = this.getAttribute('data-bs-target');
                });
            });
        });
    </script>
</body>
</html>
