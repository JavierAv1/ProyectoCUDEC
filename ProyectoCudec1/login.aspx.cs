﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoCudec1
{
  
    public partial class WebForm3 : System.Web.UI.Page
    {
        public static int _TipoRolUsuario = 0;
        public static int _UserId = 0;

        public static int RolUsuario
        {
            get { return _TipoRolUsuario; }
            set { _TipoRolUsuario = value; }
        }

        public static int UserId
        {
            get { return _UserId; }
            set { _UserId = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (_TipoRolUsuario == 0) 
            {
                
            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }
        protected void button1_Click(object sender, EventArgs e)
        {
            login();
        }
        public void login()
        {
            string vcorreo = txtuser.Text;
            string vcontraseña = txtPassword.Text; // Asegúrate de obtener la contraseña del campo de texto correspondiente
            try
            {
                using (var context = new INNOTECEntities())
                {
                    // Intenta encontrar un usuario que coincida con el correo proporcionado
                    var usuario = context.usuario.FirstOrDefault(u => u.UserName == vcorreo);

                    if (usuario != null)
                    {
                        // Si se encuentra un usuario con el correo proporcionado, verifica si la contraseña coincide
                        if (usuario.Contraseña == vcontraseña)
                        {
                            RolUsuario = usuario.TipoUsuario_idTipousuario;
                            UserId = usuario.usuario_id;

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
            catch (Exception Ex)
            {

                Label1.Text = Ex.Message;
            }
            
        }
    }
}