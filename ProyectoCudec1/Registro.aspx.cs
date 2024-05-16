using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoCudec1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        public void agregar()
        {
            using (INNOTECEntities bd = new INNOTECEntities())
            {
                try
                {
                    usuario bdS = new usuario
                    {
                        Nombre = TextBox2.Text,
                        Correo = reguser.Text,
                        Contraseña = regpass.Text,
                        Celular = regcel.Text,
                        User_Name = reguser2.Text,
                        Fecha_de_nacimiento = null,
                        Apellido_materno = null,
                        Apellido_paterno = null,
                        Sexo = null,
                        Tipo_de_usuario_idTipo_de_usuario = 2,
                        Compra = null,
                        Foto_de_perfil = null
                    };
                    bd.usuarios.Add(bdS);
                    bd.SaveChanges();
                    Label1.Text = "Registro Exitoso";
                }
                catch (Exception Ex)
                {
                    Label1.Text = Ex.Message;

                }
               
            }
        }
        protected void button1_Click(object sender, EventArgs e)
        {
            agregar();
            limpiar();
        }
        public void limpiar()
        {
            reguser.Text = "";
            TextBox2.Text = "";
            regcel.Text = "";
            regpass.Text = "";
            reguser2.Text = "";
        }
    }
}
 

    
