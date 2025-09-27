using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

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
            VouchersNegocio negocio = new VouchersNegocio();

            if (negocio.CodigoExiste(codigo))
            {
                lblMensaje.Visible = false;
                Response.Redirect("VoucherValido.aspx?codigo=" + Server.UrlEncode(codigo));
                // Aquí podés poner la acción si el voucher es válido
            }
            else
            {
                lblMensaje.Text = "El voucher es inválido";
                lblMensaje.Visible = true;
            }
        }
    }
}