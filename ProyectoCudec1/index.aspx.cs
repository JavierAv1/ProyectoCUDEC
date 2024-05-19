using System;
using System.Linq;
using System.Web.UI;
using X.PagedList;

namespace ProyectoCudec1
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        private INNOTECEntities _context = new INNOTECEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
            int pageNumber = 1;
            if (Request.QueryString["page"] != null)
            {
                int.TryParse(Request.QueryString["page"], out pageNumber);
            }

            int pageSize = 10;
            var productos = _context.Productos.ToPagedList(pageNumber, pageSize);
            ProductosRepeater.DataSource = productos;
            ProductosRepeater.DataBind();

            PagedListPager.DataSource = productos;
            PagedListPager.DataBind();
        }
    }
}
