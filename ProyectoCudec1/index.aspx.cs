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
            try
            {
                int pageNumber = (int)ViewState["PageNumber"];
                var productos = _context.Productos
                                        .OrderBy(p => p.Nombre)
                                        .ToPagedList(pageNumber, PageSize);

                ProductosRepeater.DataSource = productos;
                ProductosRepeater.DataBind();

                //idAnterior.Enabled = productos.HasPreviousPage;
                //idSiguiente.Enabled = productos.HasNextPage;
            }
            catch (Exception Ex)
            {

                Console.WriteLine(Ex);
            }

        }

        //protected void idAnterior_Click(object sender, EventArgs e)
        //{
        //    int pageNumber = (int)ViewState["PageNumber"];
        //    if (pageNumber > 1)
        //    {
        //        ViewState["PageNumber"] = pageNumber - 1;
        //        LoadPagedData();
        //    }
        //}

        //protected void idSiguiente_Click(object sender, EventArgs e)
        //{
        //    int pageNumber = (int)ViewState["PageNumber"];
        //    ViewState["PageNumber"] = pageNumber + 1;
        //    LoadPagedData();
        //}

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
                int productoID = Convert.ToInt32(e.CommandArgument);
                AddProductToCart(productoID);
            }
        }

        protected void AddProductToCart(int productoID)
        {
            int userId = WebForm3.UserId;
            DateTime fechaDeCompra = DateTime.Now;
            DateTime fechaDeVencimiento = fechaDeCompra.AddDays(15);
            if (userId == 0)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                using (var context = new INNOTECEntities())
                {
                    Compra nuevaCompra = new Compra
                    {
                        idusuario = userId,
                        idproducto = productoID,
                        Cantidad = 1,
                        FechaDeCompra = fechaDeCompra,
                        FechaVencimiento = fechaDeVencimiento
                    };

                    context.Compra.Add(nuevaCompra);
                    context.SaveChanges();
                }
            }

            Response.Write("<script>alert('Producto añadido al carrito y comprado exitosamente!');</script>");
        }

        protected void ProductosRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                using (INNOTECEntities context = new INNOTECEntities())
                {
                    var query = from product in context.Productos.AsEnumerable() select product;
                    Productos producto = new Productos();
                    foreach (var item in query)
                    {


                        producto.ImagenDelProducto = item.ImagenDelProducto;

                        if (context.Productos != null)
                        {
                            if (producto.ImagenDelProducto != null)
                            {
                                Literal imageLiteral = e.Item.FindControl("ImageLiteral") as Literal;
                                byte[] imagenBytes = producto.ImagenDelProducto;

                                if (imagenBytes != null && imagenBytes.Length > 0)
                                {
                                    string imagenBase64 = Convert.ToBase64String(imagenBytes);
                                    imageLiteral.Text = $"<img src='data:image/jpeg;base64,{imagenBase64}' class='img-fluid' alt='Imagen del Producto'>";
                                }
                                else
                                {
                                    imageLiteral.Text = "<div class='card-img-placeholder'><i class='bi bi-image bi-image-placeholder'></i></div>";
                                }

                            }
                            else
                            {

                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }


        }
        private string ObtenerUrlDeImagen(int idProducto)
        {
            return $"~/Images/Productos/{idProducto}.jpg";
        }
    }
}
