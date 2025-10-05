using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Negocio
{
    public class AccesoDatos
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataReader lector;

        public SqlDataReader Lector => lector;

        public AccesoDatos()
        {
            conexion = new SqlConnection("server=.\\SQLEXPRESS; database=PROMOS_DB; integrated security=true");
            comando = new SqlCommand();
        }

        
        public void setearConsulta(string consulta)
        {
            comando.Parameters.Clear();   // limpiamos cualquier parámetro viejo
            comando.CommandText = consulta;
            comando.CommandType = System.Data.CommandType.Text;

            // Cerramos la conexión anterior si quedó abierta
            if (conexion.State == System.Data.ConnectionState.Open)
                conexion.Close();
        }

        public void setearParametro(string nombre, object valor)
        {
            // Usamos DBNull.Value si el valor es null
            comando.Parameters.AddWithValue(nombre, valor ?? DBNull.Value);
        }

        
        public void ejecutarLectura()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

       
        public void ejecutarAccion()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        
        public void cerrarConexion()
        {
            if (lector != null)
            {
                lector.Close();
                lector = null;
            }

            if (conexion.State == System.Data.ConnectionState.Open)
                conexion.Close();
        }

        // Consulta si existe un voucher
        public bool CodigoExiste(string codigo)
        {
            bool existe = false;
            setearConsulta("SELECT CodigoVoucher, FechaCanje FROM Vouchers WHERE CodigoVoucher = @codigo");
            setearParametro("@codigo", codigo);
            ejecutarLectura();

            if (Lector.Read())
            {
                if(Lector["FechaCanje"] == DBNull.Value)
                {
                    existe = true;
                    cerrarConexion(); // Cerramos lectura antes de hacer el UPDATE

                    // Ahora actualizamos la fecha de canje
                    setearConsulta("UPDATE Vouchers SET FechaCanje = @fecha WHERE CodigoVoucher = @codigo");
                    setearParametro("@fecha", DateTime.Now);
                    setearParametro("@codigo", codigo);
                    ejecutarLectura(); 
                    cerrarConexion();

                }
                else if (Lector["FechaCanje"] != DBNull.Value)
                {
                    existe = false;
                }
              
            }
            

                cerrarConexion();
            return existe;
        }

        // Obtener imágenes de un artículo
        public List<string> ObtenerImagenesArticulo(int articuloId)
        {
            List<string> urls = new List<string>();
            setearConsulta("SELECT ImagenUrl FROM IMAGENES WHERE IdArticulo = @IdArticulo");
            setearParametro("@IdArticulo", articuloId);
            ejecutarLectura();

            while (Lector.Read())
            {
                urls.Add(Lector["ImagenUrl"].ToString());
            }

            cerrarConexion();
            return urls;
        }
    }
}
