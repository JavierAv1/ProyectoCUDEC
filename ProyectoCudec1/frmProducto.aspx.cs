﻿using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace ProyectoCudec1
{
    public partial class frmProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            using (INNOTECEntities context = new INNOTECEntities())
            {
                gvProducts.DataSource = context.Productos.ToList();
                gvProducts.DataBind();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            byte[] imageBytes = null;
            if (fileImage.HasFile)
            {
                imageBytes = fileImage.FileBytes;
            }

            using (INNOTECEntities context = new INNOTECEntities())
            {
                var product = new Producto
                {
                    Nombre = txtName.Text,
                    Descripcion_del_producto = txtDescription.Text,
                    Precio = Convert.ToInt32(txtPrice.Text),
                    Cantidad = Convert.ToInt32(txtQuantity.Text),
                    Imagen_del_producto = imageBytes,
                    Departamento_idDepartamento = 1,  
                    Proveedor_idProveedor = 1     
                };

                context.Productos.Add(product);
                context.SaveChanges();
            }
            BindGridView();
        }

        protected void gvProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProducts.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void gvProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvProducts.Rows[e.RowIndex];
            int productId = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Values[0]);

            using (INNOTECEntities context = new INNOTECEntities())
            {
                var product = context.Productos.Find(productId);
                product.Nombre = (row.Cells[1].Controls[0] as TextBox).Text;
                product.Descripcion_del_producto = (row.Cells[2].Controls[0] as TextBox).Text;
                product.Precio = Convert.ToInt32((row.Cells[3].Controls[0] as TextBox).Text);
                product.Cantidad = Convert.ToInt32((row.Cells[4].Controls[0] as TextBox).Text);

                context.SaveChanges();
            }
            gvProducts.EditIndex = -1;
            BindGridView();
        }

        protected void gvProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProducts.EditIndex = -1;
            BindGridView();
        }

        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int productId = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Values[0]);

            using (INNOTECEntities context = new INNOTECEntities())
            {
                var product = context.Productos.Find(productId);
                context.Productos.Remove(product);
                context.SaveChanges();
            }
            BindGridView();
        }
    }
}