using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;




namespace Negocio
{
    public class VouchersNegocio
    {
        private AccesoDatos datos = new AccesoDatos();

        public bool CodigoExiste(string codigo)
        {
            // Creamos una nueva instancia de AccesoDatos para esta consulta
            AccesoDatos datos = new AccesoDatos();
            try
            {
                return datos.CodigoExiste(codigo);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        // Método para obtener las imágenes de un artículo específico
        public List<string> ObtenerImagenesArticulo(int articuloId)
        {
            // Nueva instancia de AccesoDatos para esta consulta
            AccesoDatos datos = new AccesoDatos();
            try
            {
                return datos.ObtenerImagenesArticulo(articuloId);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        // Método para validar si un código de voucher existe
    }


}



