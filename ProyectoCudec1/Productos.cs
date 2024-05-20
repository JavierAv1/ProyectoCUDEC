//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoCudec1
{
    using System;
    using System.Collections.Generic;
    
    public partial class Productos
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Productos()
        {
            this.Compra = new HashSet<Compra>();
        }
    
        public int idProductos { get; set; }
        public string Nombre { get; set; }
        public string DescripcionDelProducto { get; set; }
        public int Precio { get; set; }
        public Nullable<int> Cantidad { get; set; }
        public byte[] ImagenDelProducto { get; set; }
        public int idProveedor { get; set; }
        public int idDepartamento { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Compra> Compra { get; set; }
        public virtual Departamento Departamento { get; set; }
        public virtual Proveedor Proveedor { get; set; }
    }
}