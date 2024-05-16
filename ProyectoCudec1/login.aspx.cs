using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoCudec1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void button1_Click(object sender, EventArgs e)
        {
            login();
        }
        public void login()
        {
            string vcorreo = txtuser.Text;
            string vcontraseña = txtPassword.Text; // Asegúrate de obtener la contraseña del campo de texto correspondiente

            using (var context = new INNOTECEntities())
            {
                // Intenta encontrar un usuario que coincida con el correo proporcionado
                var usuario = context.usuarios.FirstOrDefault(u => u.User_Name == vcorreo);

                if (usuario != null)
                {
                    // Si se encuentra un usuario con el correo proporcionado, verifica si la contraseña coincide
                    if (usuario.Contraseña == vcontraseña)
                    {
                        // La contraseña coincide, aquí puedes continuar con lo que necesites hacer
                        Response.Redirect("index.aspx");
                    }
                    else
                    {
                        // La contraseña no coincide
                        Label1.Text = ("Contraseña incorrecta");
                    }
                }
                else
                {
                    // No se encontró ningún usuario con el correo proporcionado
                    Label1.Text = ("Usuario no encontrado");
                }
            }
        }
    }
}