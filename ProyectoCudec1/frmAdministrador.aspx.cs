using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            gvDepartamento.DataSource = context.Departamentoes.ToList();
            gvDepartamento.DataBind();

            gvCatalogo.DataSource = context.Catologoes.ToList();
            gvCatalogo.DataBind();

            gvProveedor.DataSource = context.Proveedors.ToList();
            gvProveedor.DataBind();

            gvCategoria.DataSource = context.Categorias.ToList();
            gvCategoria.DataBind();

            gvSubcategoria.DataSource = context.Subcategorias.ToList();
            gvSubcategoria.DataBind();
        }

        private void LoadDropdowns()
        {
            ddlCategoriaDepartamento.DataSource = context.Categorias.ToList();
            ddlCategoriaDepartamento.DataTextField = "Nombre_categoria";
            ddlCategoriaDepartamento.DataValueField = "idCategoria";
            ddlCategoriaDepartamento.DataBind();

            ddlCategoriaSubcategoria.DataSource = context.Categorias.ToList();
            ddlCategoriaSubcategoria.DataTextField = "Nombre_categoria";
            ddlCategoriaSubcategoria.DataValueField = "idCategoria";
            ddlCategoriaSubcategoria.DataBind();

            ddlCatalogoProductos.DataSource = context.Productos.ToList();
            ddlCatalogoProductos.DataTextField = "Nombre";
            ddlCatalogoProductos.DataValueField = "idProductos";
            ddlCatalogoProductos.DataBind();
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
                Nombre_departamento = txtDepartamentoNombre.Text,
                id_categoria = int.Parse(ddlCategoriaDepartamento.SelectedValue)
            };
            context.Departamentoes.Add(departamento);
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
            var departamento = context.Departamentoes.Find(id);
            departamento.Nombre_departamento = (gvDepartamento.Rows[e.RowIndex].FindControl("txtNombre") as TextBox).Text;
            context.SaveChanges();
            gvDepartamento.EditIndex = -1;
            BindData();
        }

        protected void gvDepartamento_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDepartamento.EditIndex = -1;
            BindData();
        }

        protected void gvDepartamento_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = (int)gvDepartamento.DataKeys[e.RowIndex].Value;
            var departamento = context.Departamentoes.Find(id);
            context.Departamentoes.Remove(departamento);
            context.SaveChanges();
            BindData();
        }

        // Catálogo
        protected void btnAgregarCatalogo_Click(object sender, EventArgs e)
        {
            byte[] imagenes = null;
            if (fuCatalogoImagenes.HasFile)
            {
                using (var binaryReader = new System.IO.BinaryReader(fuCatalogoImagenes.PostedFile.InputStream))
                {
                    imagenes = binaryReader.ReadBytes(fuCatalogoImagenes.PostedFile.ContentLength);
                }
            }
            var catalogo = new Catologo
            {
                descripcion = txtCatalogoDescripcion.Text,
                imagenes = imagenes,
                Productos_idProductos = int.Parse(ddlCatalogoProductos.SelectedValue)
            };
            context.Catologoes.Add(catalogo);
            context.SaveChanges();
            BindData();
        }

        protected void gvCatalogo_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCatalogo.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void gvCatalogo_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var id = (int)gvCatalogo.DataKeys[e.RowIndex].Value;
            var catalogo = context.Catologoes.Find(id);
            catalogo.descripcion = (gvCatalogo.Rows[e.RowIndex].FindControl("txtDescripcion") as TextBox).Text;
            context.SaveChanges();
            gvCatalogo.EditIndex = -1;
            BindData();
        }

        protected void gvCatalogo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCatalogo.EditIndex = -1;
            BindData();
        }

        protected void gvCatalogo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = (int)gvCatalogo.DataKeys[e.RowIndex].Value;
            var catalogo = context.Catologoes.Find(id);
            context.Catologoes.Remove(catalogo);
            context.SaveChanges();
            BindData();
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
            context.Proveedors.Add(proveedor);
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
            var proveedor = context.Proveedors.Find(id);
            proveedor.Nombre = (gvProveedor.Rows[e.RowIndex].FindControl("txtNombre") as TextBox).Text;
            proveedor.Telefono = (gvProveedor.Rows[e.RowIndex].FindControl("txtTelefono") as TextBox).Text;
            proveedor.Direccion = (gvProveedor.Rows[e.RowIndex].FindControl("txtDireccion") as TextBox).Text;
            context.SaveChanges();
            gvProveedor.EditIndex = -1;
            BindData();
        }

        protected void gvProveedor_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProveedor.EditIndex = -1;
            BindData();
        }

        protected void gvProveedor_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = (int)gvProveedor.DataKeys[e.RowIndex].Value;
            var proveedor = context.Proveedors.Find(id);
            context.Proveedors.Remove(proveedor);
            context.SaveChanges();
            BindData();
        }

        // Categoría
        protected void btnAgregarCategoria_Click(object sender, EventArgs e)
        {
            var categoria = new Categoria
            {
                Nombre_categoria = txtCategoriaNombre.Text,
                Descripcion = txtCategoriaDescripcion.Text
            };
            context.Categorias.Add(categoria);
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
            var categoria = context.Categorias.Find(id);
            categoria.Nombre_categoria = (gvCategoria.Rows[e.RowIndex].FindControl("txtNombre") as TextBox).Text;
            categoria.Descripcion = (gvCategoria.Rows[e.RowIndex].FindControl("txtDescripcion") as TextBox).Text;
            context.SaveChanges();
            gvCategoria.EditIndex = -1;
            BindData();
        }

        protected void gvCategoria_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategoria.EditIndex = -1;
            BindData();
        }

        protected void gvCategoria_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = (int)gvCategoria.DataKeys[e.RowIndex].Value;
            var categoria = context.Categorias.Find(id);
            context.Categorias.Remove(categoria);
            context.SaveChanges();
            BindData();
        }

        // Subcategoría
        protected void btnAgregarSubcategoria_Click(object sender, EventArgs e)
        {
            var subcategoria = new Subcategoria
            {
                Nombre_de_subcategoria = txtSubcategoriaNombre.Text,
                idSubcategoria = int.Parse(ddlCategoriaSubcategoria.SelectedValue)
            };
            context.Subcategorias.Add(subcategoria);
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
            var subcategoria = context.Subcategorias.Find(id);
            subcategoria.Nombre_de_subcategoria = (gvSubcategoria.Rows[e.RowIndex].FindControl("txtNombre") as TextBox).Text;
            context.SaveChanges();
            gvSubcategoria.EditIndex = -1;
            BindData();
        }

        protected void gvSubcategoria_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSubcategoria.EditIndex = -1;
            BindData();
        }

        protected void gvSubcategoria_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var id = (int)gvSubcategoria.DataKeys[e.RowIndex].Value;
            var subcategoria = context.Subcategorias.Find(id);
            context.Subcategorias.Remove(subcategoria);
            context.SaveChanges();
            BindData();
        }
    }
}

