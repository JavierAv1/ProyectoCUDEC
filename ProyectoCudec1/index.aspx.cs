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

            Button2.Enabled = productos.HasPreviousPage;
            Button1.Enabled = productos.HasNextPage;
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
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            // Obtener el ID del producto desde el argumento del comando
            int productoID = Convert.ToInt32((sender as Button).CommandArgument);

            // Llamar al método para agregar el producto al carrito
            AddProductToCart(productoID);
        }


        protected void AddProductToCart(int productoID)
        {
            int UserId = WebForm3.UserId;
            // Obtener el ID del usuario actualmente autenticado (aquí asumo que tienes un sistema de autenticación implementado)
            int userID =  UserId; // Debes implementar esta función para obtener el ID del usuario actual

            // Calcular la fecha actual
            DateTime fechaDeCompra = DateTime.Now;

            // Calcular la fecha de vencimiento (15 días después de la fecha de compra)
            DateTime fechaDeVencimiento = fechaDeCompra.AddDays(15);

            // Insertar la información de la compra en la base de datos
            using (var context = new INNOTECEntities())
            {
                Compra nuevaCompra = new Compra
                {
                    idusuario = userID,
                    idproducto = productoID,
                    Cantidad = 1,
                    FechaDeCompra = fechaDeCompra,
                    FechaVencimiento = fechaDeVencimiento
                };

                // Agregar la nueva compra a la tabla Compra
                context.Compra.Add(nuevaCompra);

                // Guardar los cambios en la base de datos
                context.SaveChanges();
            }

            // Mostrar un mensaje de confirmación
            Response.Write("<script>alert('Producto añadido al carrito y comprado exitosamente!');</script>");
        }

    }
}
