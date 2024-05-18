using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoCudec1
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConfigureButtonsBasedOnUserRole();
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
                    // Usuario comun
                    break;
                default:
                    // Para visitantes y otros roles no definidos
                    break;
            }
        }
    }
}
