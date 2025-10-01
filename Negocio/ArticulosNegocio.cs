using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;
using Dominio;

namespace Negocio
{
    internal class ArticulosNegocio
    {
        public List<ArticulosNegocio> listar()
        {
            List<ArticulosNegocio> lista = new List<ArticulosNegocio>();
            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader lector;

            try
            {
                conexion.ConnectionString = "server=.\\SQLEXPRESS; database = CATALOGO_P3_DB; integrated security=true ";
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "SELECT A.Id,A.Codigo,A.Nombre,A.Descripcion, ISNULL(M.Id, 0) AS IdMarca, ISNULL(C.Id, 0) AS IdCategoria,ISNULL(I.Id, 0) AS IdImagen, ISNULL(M.Descripcion, 'Sin marca') AS Marca, ISNULL(C.Descripcion, 'Sin categoría') AS Categoria, A.Precio, I.ImagenUrl FROM Articulos A LEFT JOIN Marcas M ON M.Id = A.IdMarca LEFT JOIN Categorias C ON C.Id = A.IdCategoria LEFT JOIN Imagenes I ON I.IdArticulo = A.Id;";//"Select A.Id, Codigo, Nombre, A.Descripcion,M.Descripcion Marca,C.Descripcion Categoria,A.IdMarca,A.IdCategoria,A.Id, Precio From Articulos A, Marcas M, CATEGORIAS C where M.id = A.idMarca and C.id = A.idCategoria";
                comando.Connection = conexion;
                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Articulos aux = new Articulos();
                    aux.IDArticulo = (int)lector["Id"];
                    aux.Marca = new Marcas();
                    aux.Marca.IDMarca = (int)lector["IdMarca"];
                    aux.Categorias = new Categorias();
                    aux.Categorias.IDCategoria = (int)lector["IdCategoria"];

                    //aux.IDArticulo = (int)lector["Id"];
                    aux.Nombre = (string)lector["Nombre"];
                    aux.CodigoArticulo = (string)lector["Codigo"];
                    aux.Descripcion = (string)lector["Descripcion"];
                    // aux.UrlImagen = (string)lector["ImagenUrl"];

                    if (!(lector["Marca"] is DBNull))
                        aux.Marca.Descripcion = (string)lector["Marca"];
                    if (!(lector["Categoria"] is DBNull))
                        aux.Categorias.Descripcion = (string)lector["Categoria"];
                    if (!(lector["Precio"] is DBNull))
                        aux.Precio = Convert.ToDecimal(lector["Precio"]);

                    aux.Imagen = new Imagenes();
                    if (!(lector["ImagenUrl"] is DBNull))
                        aux.Imagen.UrlImagen = (string)lector["ImagenUrl"];
                    else
                        aux.Imagen.UrlImagen = "";
                }

                conexion.Close();
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
