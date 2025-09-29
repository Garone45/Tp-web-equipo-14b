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
        public bool CodigoExiste(string codigo)
        {
            bool existe = false;
            string connectionString = @"Server=.\SQLEXPRESS;Database=PROMOS_DB;Trusted_Connection=True;";
            string query = "SELECT COUNT(*) FROM dbo.Vouchers WHERE CodigoVoucher = @codigo"; //, devuelve un único número: cuántas filas cumplen la condición (CodigoVoucher = @codigo).

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@codigo", codigo);
                    con.Open();
                    int count = (int)cmd.ExecuteScalar(); // ExecuteScalar() devuelve un object genérico, así que se necesita convertirlo a entero usando (int).
                                                          //después, se guarda en la variable count;
                    existe = count > 0; // Si count es mayor que 0  el voucher existe.

                }

            }
            return existe;
        }

        public List<string> ObtenerImagenesArticulo(int articuloId)
        {
            List<string> urls = new List<string>();

            // Cadena de conexión
            string connectionString = @"Server=.\SQLEXPRESS;Database=PROMOS_DB;Trusted_Connection=True;"; ;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT ImagenUrl FROM Imagenes WHERE IdArticulo = @ArticuloId";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ArticuloId", articuloId);

                    
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // Agregamos la URL al listado
                            urls.Add(reader["ImagenUrl"].ToString());
                        }
                    }
                }
            }

            return urls;
        }


    }

    
       
    
}



