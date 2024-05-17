using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoCudec1
{
    public partial class WebForm4 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            int rolUsuario = WebForm3.RolUsuario;
            string NombreRol;
            if (rolUsuario == 1)
            {

                NombreRol = "Rol: Administrador";
   
            }
            else if (rolUsuario == 2)
            {

                NombreRol = "Rol: Usuario";
 
            }
            else if (rolUsuario == 3)
            {
  
                NombreRol = "Rol: Capturista";
           
            }
            else
            {
                NombreRol = "Rol: visitante";
            }
        }

    }

}