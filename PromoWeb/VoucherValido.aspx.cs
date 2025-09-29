using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace PromoWeb
{
    public partial class VoucherValido : System.Web.UI.Page
    {

        public string img1_t1;
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
                // Aquí traes las imágenes de tu base de datos para cada artículo
                var t1 = negocio.ObtenerImagenesArticulo(1); // artículo 1
                var t2 = negocio.ObtenerImagenesArticulo(2); // artículo 2
                var t3 = negocio.ObtenerImagenesArticulo(3); // artículo 3

                img1_t1 = t1.Count > 0 ? t1[0] : "img/default.jpg";
                img2_t1 = t1.Count > 1 ? t1[1] : "img/default.jpg";
                img3_t1 = t1.Count > 2 ? t1[2] : "img/default.jpg";

                img1_t2 = t2.Count > 0 ? t2[0] : "img/default.jpg";
                img2_t2 = t2.Count > 1 ? t2[1] : "img/default.jpg";
                img3_t2 = t2.Count > 2 ? t2[2] : "img/default.jpg";

                img1_t3 = t3.Count > 0 ? t3[0] : "img/default.jpg";
                img2_t3 = t3.Count > 1 ? t3[1] : "img/default.jpg";
                img3_t3 = t3.Count > 2 ? t3[2] : "img/default.jpg";
            }
        }
    }
}