using System;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoCudec1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFechaNacimiento.Attributes.Add("readonly", "true");
            }
        }

        public void agregar()
        {
            using (INNOTECEntities bd = new INNOTECEntities())
            {
                try
                {
                    byte[] foto = null;
                    if (fileUploadFoto.HasFile)
                    {
                        using (BinaryReader br = new BinaryReader(fileUploadFoto.PostedFile.InputStream))
                        {
                            foto = br.ReadBytes(fileUploadFoto.PostedFile.ContentLength);
                        }
                    }

                    DateTime? fechaNacimiento = null;
                    if (!string.IsNullOrEmpty(txtFechaNacimiento.Text))
                    {
                        fechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
                    }

                    usuario bdS = new usuario
                    {
                        Nombre = TextBox2.Text,
                        Correo = reguser.Text,
                        Contraseña = regpass.Text,
                        Celular = regcel.Text,
                        UserName = reguser2.Text,
                        FechaDeNacimiento = fechaNacimiento,
                        ApellidoPaterno = TxtAPaterno.Text,
                        ApellidoMaterno = TxtAMaterno.Text,
                        Sexo = ddlSexo.SelectedValue,
                        TipoUsuario_idTipousuario = 3,
                        FotoDePerfil = foto
                    };
                    bd.usuario.Add(bdS);
                    bd.SaveChanges();
                    Label1.Text = "Registro Exitoso";
                    Response.Redirect("login.aspx");
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

        protected void calFechaNacimiento_SelectionChanged(object sender, EventArgs e)
        {
            txtFechaNacimiento.Text = calFechaNacimiento.SelectedDate.ToString("yyyy-MM-dd");
        }

        public void limpiar()
        {
            reguser.Text = "";
            TextBox2.Text = "";
            TxtAPaterno.Text = "";
            TxtAMaterno.Text = "";
            regcel.Text = "";
            regpass.Text = "";
            reguser2.Text = "";
            txtFechaNacimiento.Text = "";
            ddlSexo.SelectedIndex = 0;
        }
    }
}
