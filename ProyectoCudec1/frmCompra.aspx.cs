using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoCudec1
{
    public partial class frmCompra : System.Web.UI.Page
    {
        private INNOTECEntities _context = new INNOTECEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCarrito();
            }
        }

        private void CargarCarrito()
        {
            int userId = WebForm3.UserId;

            var carrito = _context.Compra.Where(c => c.idusuario == userId && c.idproducto != null).Select(c => new
            {
                c.Productos.Nombre,
                c.Productos.DescripcionDelProducto,
                c.Cantidad,
                c.Productos.Precio,
                c.idproducto
            }).ToList();

            gvCarrito.DataSource = carrito;
            gvCarrito.DataBind();

            if (carrito.Any())
            {
                CalcularTotal(carrito);
            }
            else
            {
                lblTotalProductos.Text = "No hay productos en el carrito.";
                lblTotalPedido.Text = string.Empty;
            }
        }

        private void CalcularTotal(IEnumerable<dynamic> carrito)
        {
            int totalProductos = carrito.Sum(c => c.Cantidad);
            decimal totalPedido = carrito.Sum(c => c.Cantidad * c.Precio);

            lblTotalProductos.Text = $"Total de Productos: {totalProductos}";
            lblTotalPedido.Text = $"Total del Pedido: {totalPedido:C}";
        }

        protected void txtCantidad_TextChanged(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((TextBox)sender).NamingContainer;
            int idProducto = Convert.ToInt32(gvCarrito.DataKeys[row.RowIndex].Value);
            TextBox txtCantidad = (TextBox)row.FindControl("txtCantidad");
            int nuevaCantidad = int.Parse(txtCantidad.Text);

            var compra = _context.Compra.FirstOrDefault(c => c.idproducto == idProducto && c.idusuario == WebForm3.UserId);
            if (compra != null)
            {
                compra.Cantidad = nuevaCantidad;
            }

            _context.SaveChanges();
            CargarCarrito();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int idProducto = Convert.ToInt32((sender as Button).CommandArgument);

            // Buscar la compra asociada al idProducto
            var compra = _context.Compra.FirstOrDefault(c => c.idproducto == idProducto && c.idusuario == WebForm3.UserId);

            if (compra != null)
            {
                // Eliminar la compra
                _context.Compra.Remove(compra);
                _context.SaveChanges();

                CargarCarrito();
            }
        }


        protected void btnComprar_Click(object sender, EventArgs e)
        {
            int userId = WebForm3.UserId; 
            var compras = _context.Compra.Where(c => c.idusuario == userId && c.idproducto != null).ToList();

            foreach (var compra in compras)
            {
                var envio = new Envio
                {
                    CodigoPostal = "", // Asigna los valores correspondientes
                    Estado = "",
                    Calle = "",
                    Colonia = "",
                    Municipio = "",
                    Numero = 0,
                    idCompra = compra.idCompra,
                    Status = 0
                };
                _context.Envio.Add(envio);
            }

            _context.SaveChanges();
            Response.Redirect("~/frmComprar.aspx");
        }
    }
}
