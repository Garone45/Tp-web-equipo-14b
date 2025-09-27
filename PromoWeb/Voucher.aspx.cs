using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PromoWeb
{
    public partial class Voucher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnValidar_Click(object sender, EventArgs e)
        {
            string codigo = txtVoucher.Text.Trim();

            // Validación de lógica contra la db? hay que traer la consulta de si el voucher es valido en la db.
            if (!string.IsNullOrEmpty(codigo) && codigo == "ABC123")
            {
                lblMensaje.Visible = false;
                // Aquí pones lo que debe pasar si el voucher es válido
            }
            else
            {
                lblMensaje.Text = "El voucher es inválido";
                lblMensaje.Visible = true;
            }
        }
    }
}