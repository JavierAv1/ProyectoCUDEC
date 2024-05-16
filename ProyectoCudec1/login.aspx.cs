using ProyectoCudec1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;


namespace Proyecto
{
    public partial class WebForm1 : System.Web.UI.Page
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
                var usuario = context.usuarios.FirstOrDefault(u => u.Correo == vcorreo);

                if (usuario != null)
                {
                    // Si se encuentra un usuario con el correo proporcionado, verifica si la contraseña coincide
                    if (usuario.Contraseña == vcontraseña)
                    {
                        // La contraseña coincide, aquí puedes continuar con lo que necesites hacer

                    }
                    else
                    {
                        // La contraseña no coincide
                        Console.WriteLine("Contraseña incorrecta");
                    }
                }
                else
                {
                    // No se encontró ningún usuario con el correo proporcionado
                    Console.WriteLine("Usuario no encontrado");
                }
            }
        }

    }


}