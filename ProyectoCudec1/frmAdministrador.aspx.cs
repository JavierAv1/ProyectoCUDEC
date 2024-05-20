using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ProyectoCudec1
{
    public partial class frmAdministrador : System.Web.UI.Page
    {
        private INNOTECEntities context = new INNOTECEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                LoadDropdowns();
            }
        }

        private void BindData()
        {
            gvDepartamento.DataSource = context.Departamento.ToList();
            gvDepartamento.DataBind();

            gvProveedor.DataSource = context.Proveedor.ToList();
            gvProveedor.DataBind();

            gvCategoria.DataSource = context.Categoria.ToList();
            gvCategoria.DataBind();

            gvSubcategoria.DataSource = context.Subcategoria.ToList();
            gvSubcategoria.DataBind();

            gvUsuario.DataSource = context.usuario.ToList();
            gvUsuario.DataBind();
        }

        private void LoadDropdowns()
        {
            ddlCategoriaDepartamento.DataSource = context.Categoria.ToList();
            ddlCategoriaDepartamento.DataTextField = "Nombre";
            ddlCategoriaDepartamento.DataValueField = "idCategoria";
            ddlCategoriaDepartamento.DataBind();

            ddlCategoriaSubcategoria.DataSource = context.Categoria.ToList();
            ddlCategoriaSubcategoria.DataTextField = "Nombre";
            ddlCategoriaSubcategoria.DataValueField = "idCategoria";
            ddlCategoriaSubcategoria.DataBind();

            ddlTipoUsuario.DataSource = context.TipoUsuario.ToList();
            ddlTipoUsuario.DataTextField = "TipoUsuario1";
            ddlTipoUsuario.DataValueField = "idTipousuario";
            ddlTipoUsuario.DataBind();
        }

        protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                foreach (TableCell cell in e.Row.Cells)
                {
                    foreach (Control control in cell.Controls)
                    {
                        if (control is LinkButton button)
                        {
                            if (button.CommandName == "Edit")
                            {
                                button.CssClass = "btn btn-warning";
                                button.Text = "Editar";
                            }
                            else if (button.CommandName == "Delete")
                            {
                                button.CssClass = "btn btn-danger";
                                button.Text = "Eliminar";
                            }
                        }
                    }
                }
            }
        }

        // Departamento
        protected void btnAgregarDepartamento_Click(object sender, EventArgs e)
        {
            var departamento = new Departamento
            {
                Nombre = txtDepartamentoNombre.Text
            };
            context.Departamento.Add(departamento);
            context.SaveChanges();
            BindData();
        }

        protected void gvDepartamento_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDepartamento.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void gvDepartamento_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var id = (int)gvDepartamento.DataKeys[e.RowIndex].Value;
            var departamento = context.Departamento.Find(id);
            var txtNombre = (TextBox)gvDepartamento.Rows[e.RowIndex].FindControl("txtNombre");
            departamento.Nombre = !string.IsNullOrEmpty(txtNombre.Text) ? txtNombre.Text : departamento.Nombre;
            context.SaveChanges();
            gvDepartamento.EditIndex = -1;
            BindData();
            hidActiveTab.Value = "#departamento";
        }

        protected void gvDepartamento_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDepartamento.EditIndex = -1;
            BindData();
            hidActiveTab.Value = "#departamento";
        }

        protected void gvDepartamento_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = (int)gvDepartamento.DataKeys[e.RowIndex].Value;
            var departamento = context.Departamento.Find(id);
            context.Departamento.Remove(departamento);
            context.SaveChanges();
            BindData();
            hidActiveTab.Value = "#departamento";
        }

        // Proveedor
        protected void btnAgregarProveedor_Click(object sender, EventArgs e)
        {
            var proveedor = new Proveedor
            {
                Nombre = txtProveedorNombre.Text,
                Telefono = txtProveedorTelefono.Text,
                Direccion = txtProveedorDireccion.Text
            };
            context.Proveedor.Add(proveedor);
            context.SaveChanges();
            BindData();
        }

        protected void gvProveedor_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProveedor.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void gvProveedor_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var id = (int)gvProveedor.DataKeys[e.RowIndex].Value;
            var proveedor = context.Proveedor.Find(id);
            var txtNombre = (TextBox)gvProveedor.Rows[e.RowIndex].FindControl("txtNombre");
            var txtTelefono = (TextBox)gvProveedor.Rows[e.RowIndex].FindControl("txtTelefono");
            var txtDireccion = (TextBox)gvProveedor.Rows[e.RowIndex].FindControl("txtDireccion");
            proveedor.Nombre = !string.IsNullOrEmpty(txtNombre.Text) ? txtNombre.Text : proveedor.Nombre;
            proveedor.Telefono = !string.IsNullOrEmpty(txtTelefono.Text) ? txtTelefono.Text : proveedor.Telefono;
            proveedor.Direccion = !string.IsNullOrEmpty(txtDireccion.Text) ? txtDireccion.Text : proveedor.Direccion;
            context.SaveChanges();
            gvProveedor.EditIndex = -1;
            BindData();
            hidActiveTab.Value = "#proveedor";
        }

        protected void gvProveedor_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProveedor.EditIndex = -1;
            BindData();
            hidActiveTab.Value = "#proveedor";
        }

        protected void gvProveedor_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = (int)gvProveedor.DataKeys[e.RowIndex].Value;
            var proveedor = context.Proveedor.Find(id);
            context.Proveedor.Remove(proveedor);
            context.SaveChanges();
            BindData();
            hidActiveTab.Value = "#proveedor";
        }

        // Categoría
        protected void btnAgregarCategoria_Click(object sender, EventArgs e)
        {
            var categoria = new Categoria
            {
                Nombre = txtCategoriaNombre.Text,
                Descripcion = txtCategoriaDescripcion.Text
            };
            context.Categoria.Add(categoria);
            context.SaveChanges();
            BindData();
        }

        protected void gvCategoria_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategoria.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void gvCategoria_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var id = (int)gvCategoria.DataKeys[e.RowIndex].Value;
            var categoria = context.Categoria.Find(id);
            var txtNombre = (TextBox)gvCategoria.Rows[e.RowIndex].FindControl("txtNombre");
            var txtDescripcion = (TextBox)gvCategoria.Rows[e.RowIndex].FindControl("txtDescripcion");
            categoria.Nombre = !string.IsNullOrEmpty(txtNombre.Text) ? txtNombre.Text : categoria.Nombre;
            categoria.Descripcion = !string.IsNullOrEmpty(txtDescripcion.Text) ? txtDescripcion.Text : categoria.Descripcion;
            context.SaveChanges();
            gvCategoria.EditIndex = -1;
            BindData();
            hidActiveTab.Value = "#categoria";
        }

        protected void gvCategoria_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategoria.EditIndex = -1;
            BindData();
            hidActiveTab.Value = "#categoria";
        }

        protected void gvCategoria_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = (int)gvCategoria.DataKeys[e.RowIndex].Value;
            var categoria = context.Categoria.Find(id);
            context.Categoria.Remove(categoria);
            context.SaveChanges();
            BindData();
            hidActiveTab.Value = "#categoria";
        }

        // Subcategoría
        protected void btnAgregarSubcategoria_Click(object sender, EventArgs e)
        {
            var subcategoria = new Subcategoria
            {
                Nombre = txtSubcategoriaNombre.Text,
                idCategoria = int.Parse(ddlCategoriaSubcategoria.SelectedValue)
            };
            context.Subcategoria.Add(subcategoria);
            context.SaveChanges();
            BindData();
        }

        protected void gvSubcategoria_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvSubcategoria.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void gvSubcategoria_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var id = (int)gvSubcategoria.DataKeys[e.RowIndex].Value;
            var subcategoria = context.Subcategoria.Find(id);
            var txtNombre = (TextBox)gvSubcategoria.Rows[e.RowIndex].FindControl("txtNombre");
            subcategoria.Nombre = !string.IsNullOrEmpty(txtNombre.Text) ? txtNombre.Text : subcategoria.Nombre;
            context.SaveChanges();
            gvSubcategoria.EditIndex = -1;
            BindData();
            hidActiveTab.Value = "#subcategoria";
        }

        protected void gvSubcategoria_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSubcategoria.EditIndex = -1;
            BindData();
            hidActiveTab.Value = "#subcategoria";
        }

        protected void gvSubcategoria_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = (int)gvSubcategoria.DataKeys[e.RowIndex].Value;
            var subcategoria = context.Subcategoria.Find(id);
            context.Subcategoria.Remove(subcategoria);
            context.SaveChanges();
            BindData();
            hidActiveTab.Value = "#subcategoria";
        }

        // Usuario
        protected void btnAgregarUsuario_Click(object sender, EventArgs e)
        {
            byte[] foto = null;
            if (fuUsuarioFotoDePerfil.HasFile)
            {
                using (BinaryReader br = new BinaryReader(fuUsuarioFotoDePerfil.PostedFile.InputStream))
                {
                    foto = br.ReadBytes(fuUsuarioFotoDePerfil.PostedFile.ContentLength);
                }
            }

            var usuario = new usuario
            {
                Nombre = txtUsuarioNombre.Text,
                ApellidoPaterno = txtUsuarioApellidoPaterno.Text,
                ApellidoMaterno = txtUsuarioApellidoMaterno.Text,
                FechaDeNacimiento = DateTime.Parse(txtUsuarioFechaDeNacimiento.Text),
                Sexo = ddlUsuarioSexo.SelectedValue,
                UserName = txtUsuarioUserName.Text,
                Correo = txtUsuarioCorreo.Text,
                Contraseña = txtUsuarioContraseña.Text,
                Telefono = txtUsuarioTelefono.Text,
                Celular = txtUsuarioCelular.Text,
                FotoDePerfil = foto,
                TipoUsuario_idTipousuario = int.Parse(ddlTipoUsuario.SelectedValue)
            };
            context.usuario.Add(usuario);
            context.SaveChanges();
            BindData();
        }

        protected void gvUsuario_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsuario.EditIndex = e.NewEditIndex;
            LoadDropdowns();
            BindData();
        }

        protected void gvUsuario_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var id = (int)gvUsuario.DataKeys[e.RowIndex].Value;
            var usuario = context.usuario.Find(id);

            var txtNombre = (TextBox)gvUsuario.Rows[e.RowIndex].FindControl("txtNombre");
            var txtApellidoPaterno = (TextBox)gvUsuario.Rows[e.RowIndex].FindControl("txtApellidoPaterno");
            var txtApellidoMaterno = (TextBox)gvUsuario.Rows[e.RowIndex].FindControl("txtApellidoMaterno");
            var txtFechaDeNacimiento = (TextBox)gvUsuario.Rows[e.RowIndex].FindControl("txtFechaDeNacimiento");
            var ddlSexo = (DropDownList)gvUsuario.Rows[e.RowIndex].FindControl("ddlSexo");
            var txtUserName = (TextBox)gvUsuario.Rows[e.RowIndex].FindControl("txtUserName");
            var txtCorreo = (TextBox)gvUsuario.Rows[e.RowIndex].FindControl("txtCorreo");
            var txtContraseña = (TextBox)gvUsuario.Rows[e.RowIndex].FindControl("txtContraseña");
            var txtTelefono = (TextBox)gvUsuario.Rows[e.RowIndex].FindControl("txtTelefono");
            var txtCelular = (TextBox)gvUsuario.Rows[e.RowIndex].FindControl("txtCelular");
            var fuFotoDePerfil = (FileUpload)gvUsuario.Rows[e.RowIndex].FindControl("fuFotoDePerfil");
            int ddlTipoUsuario = 3;/*(DropDownList)gvUsuario.Rows[e.RowIndex].FindControl("ddlTipoUsuario");*/

            usuario.Nombre = !string.IsNullOrEmpty(txtNombre.Text) ? txtNombre.Text : usuario.Nombre;
            usuario.ApellidoPaterno = !string.IsNullOrEmpty(txtApellidoPaterno.Text) ? txtApellidoPaterno.Text : usuario.ApellidoPaterno;
            usuario.ApellidoMaterno = !string.IsNullOrEmpty(txtApellidoMaterno.Text) ? txtApellidoMaterno.Text : usuario.ApellidoMaterno;
            usuario.FechaDeNacimiento = !string.IsNullOrEmpty(txtFechaDeNacimiento.Text) ? DateTime.Parse(txtFechaDeNacimiento.Text) : usuario.FechaDeNacimiento;
            usuario.Sexo = ddlSexo.SelectedValue;
            usuario.UserName = !string.IsNullOrEmpty(txtUserName.Text) ? txtUserName.Text : usuario.UserName;
            usuario.Correo = !string.IsNullOrEmpty(txtCorreo.Text) ? txtCorreo.Text : usuario.Correo;
            usuario.Contraseña = !string.IsNullOrEmpty(txtContraseña.Text) ? txtContraseña.Text : usuario.Contraseña;
            usuario.Telefono = !string.IsNullOrEmpty(txtTelefono.Text) ? txtTelefono.Text : usuario.Telefono;
            usuario.Celular = !string.IsNullOrEmpty(txtCelular.Text) ? txtCelular.Text : usuario.Celular;

            if (fuFotoDePerfil.HasFile)
            {
                using (BinaryReader br = new BinaryReader(fuFotoDePerfil.PostedFile.InputStream))
                {
                    usuario.FotoDePerfil = br.ReadBytes(fuFotoDePerfil.PostedFile.ContentLength);
                }
            }

            usuario.TipoUsuario_idTipousuario = ddlTipoUsuario;
            context.SaveChanges();
            gvUsuario.EditIndex = -1;
            BindData();
            hidActiveTab.Value = "#usuario";
        }

        protected void gvUsuario_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsuario.EditIndex = -1;
            BindData();
            hidActiveTab.Value = "#usuario";
        }

        protected void gvUsuario_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = (int)gvUsuario.DataKeys[e.RowIndex].Value;
            var usuario = context.usuario.Find(id);
            context.usuario.Remove(usuario);
            context.SaveChanges();
            BindData();
            hidActiveTab.Value = "#usuario";
        }
    }
}
