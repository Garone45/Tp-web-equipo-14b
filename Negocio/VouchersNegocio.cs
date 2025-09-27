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

            }   }

            return existe;
        }
    }
}
