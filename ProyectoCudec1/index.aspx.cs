using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using X.PagedList;

namespace ProyectoCudec1
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        private INNOTECEntities _context = new INNOTECEntities();
        private int PageSize = 2;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["PageNumber"] = 1;

                ConfigureButtonsBasedOnUserRole();
                LoadPagedData();
            }
            else
            {
                btnCarritoCompras_Click(sender, e);
            }
         
        }

        private void ConfigureButtonsBasedOnUserRole()
        {
            int rolUsuario = WebForm3.RolUsuario;
            
            switch (rolUsuario)
            {
                case 1:
                    btnAdminProduct.Visible = true;
                    btnAdminAccess.Visible = true;
                    break;
                case 2:
                    btnAdminProduct.Visible = true;
                    break;
                case 3:
                    // Usuario común
                    break;
                default:
                    // Para visitantes y otros roles no definidos
                    break;
            }
        }

        private void LoadPagedData()
        {
            int pageNumber = (int)ViewState["PageNumber"];
            var productos = _context.Productos
                                    .OrderBy(p => p.Nombre)
                                    .ToPagedList(pageNumber, PageSize);

            ProductosRepeater.DataSource = productos;
            ProductosRepeater.DataBind();

            btnPrevious.Enabled = productos.HasPreviousPage;
            btnNext.Enabled = productos.HasNextPage;
        }
        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            int pageNumber = (int)ViewState["PageNumber"];
            if (pageNumber > 1)
            {
                ViewState["PageNumber"] = pageNumber - 1;
                LoadPagedData();
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            int pageNumber = (int)ViewState["PageNumber"];
            ViewState["PageNumber"] = pageNumber + 1;
            LoadPagedData();
        }
        protected void btnCarritoCompras_Click(object sender, EventArgs e)
        {
            int userId = WebForm3._TipoRolUsuario;
            if (userId == 1 || userId == 2 || userId == 3)
            {
                Response.Redirect("~/frmCompra.aspx");
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }
        protected void ProductosRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                // Obtener el ID del producto desde el CommandArgument
                int productoID = Convert.ToInt32(e.CommandArgument);

                // Aquí deberías añadir el producto al carrito
                // Ejemplo: AddProductToCart(productoID);

                // Mostrar un mensaje de confirmación (opcional)
                Response.Write("<script>alert('Producto añadido al carrito!');</script>");
            }
        }
        protected void AddProductToCart(int productoID)
        {
            // Implementa la lógica para añadir el producto al carrito
        }

    }
}
