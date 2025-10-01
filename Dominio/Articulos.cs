using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace Dominio
{
    public class Articulos
    {
        public int IDArticulo { get; set; }
        public string CodigoArticulo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public Categorias Categorias { get; set; }
        public Marcas Marca { get; set; }
        public decimal Precio { get; set; }
        public Imagenes Imagen { get; set; }
    }
}
