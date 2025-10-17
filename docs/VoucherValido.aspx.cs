using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


namespace PromoWeb
{
    public partial class VoucherValido : System.Web.UI.Page
    {
        // Tarjeta 1
        /*  public string img1_t1;
          public string img2_t1;
          public string img3_t1;

          // Tarjeta 2
          public string img1_t2;
          public string img2_t2;
          public string img3_t2;

          // Tarjeta 3
          public string img1_t3;
          public string img2_t3;
          public string img3_t3;
          protected void Page_Load(object sender, EventArgs e)
          {

              if (!IsPostBack)
              {
                   VouchersNegocio negocio = new VouchersNegocio();

                   // Cargamos imágenes de los 3 artículos
                   var t1 = negocio.ObtenerImagenesArticulo(1);
                   var t2 = negocio.ObtenerImagenesArticulo(2);
                   var t3 = negocio.ObtenerImagenesArticulo(3);

                   // Tarjeta 1
                   img1_t1 = t1.Count > 0 ? t1[0] : "img/default.jpg";
                   img2_t1 = t1.Count > 1 ? t1[1] : "img/default.jpg";
                   img3_t1 = t1.Count > 2 ? t1[2] : "img/default.jpg";

                   // Tarjeta 2
                   img1_t2 = t2.Count > 0 ? t2[0] : "img/default.jpg";
                   img2_t2 = t2.Count > 1 ? t2[1] : "img/default.jpg";
                   img3_t2 = t2.Count > 2 ? t2[2] : "img/default.jpg";

                   // Tarjeta 3
                   img1_t3 = t3.Count > 0 ? t3[0] : "img/default.jpg";
                   img2_t3 = t3.Count > 1 ? t3[1] : "img/default.jpg";
                   img3_t3 = t3.Count > 2 ? t3[2] : "img/default.jpg"; 


              }

          }*/

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VouchersNegocio vn = new VouchersNegocio();
                ArticulosNegocio negocio = new ArticulosNegocio();

                // Traemos solo los 3 artículos que queremos mostrar
                List<Articulos> lista = new List<Articulos>();

                for (int id = 1; id <= 3; id++)
                {
                    Articulos art = negocio.listar().Find(x => x.IDArticulo == id);
                    if (art != null)
                    {
                        art.Imagenes = vn.ObtenerImagenesArticulo(art.IDArticulo); // Lista de URLs
                        lista.Add(art);
                    }
                }

                repArticulos.DataSource = lista;
                repArticulos.DataBind();
            }
        }

        protected void repArticulos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var articulo = (Articulos)e.Item.DataItem;
                var repImagenes = (Repeater)e.Item.FindControl("repImagenes");

                if (repImagenes != null && articulo.Imagenes != null)
                {
                    repImagenes.DataSource = articulo.Imagenes;
                    repImagenes.DataBind();
                }
            }
        }

    }
}