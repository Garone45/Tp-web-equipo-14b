using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PromoWeb
{
    public partial class Usuarios : System.Web.UI.Page
    {
        AccesoDatos datos = new AccesoDatos();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Si viene con querystring desde VoucherValido.aspx
                string idArticulo = Request.QueryString["idArticulo"];
                if (!string.IsNullOrEmpty(idArticulo))
                {
                    ViewState["idArticulo"] = idArticulo;
                }
            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            AccesoDatos datos = new AccesoDatos();
            dniNoExiste.Visible = false; // Ocultamos mensaje cuando empieza abuscar

            if (string.IsNullOrWhiteSpace(txtDni.Text))
            {
                dniNoExiste.InnerText = "El DNI es obligatorio";
                dniNoExiste.Visible = true;
                LimpiarCampos();
                return;
            }

            try
            {
                datos.setearConsulta("SELECT Nombre, Apellido, Email, Direccion, Ciudad, CP FROM Clientes WHERE Documento = @DNI");
                datos.setearParametro("@DNI", txtDni.Text.Trim());
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    txtNombre.Text = datos.Lector["Nombre"].ToString();
                    txtApellido.Text = datos.Lector["Apellido"].ToString();
                    txtEmail.Text = datos.Lector["Email"].ToString();
                    txtDireccion.Text = datos.Lector["Direccion"].ToString();
                    txtCiudad.Text = datos.Lector["Ciudad"].ToString();
                    txtCP.Text = datos.Lector["CP"].ToString();
                }
                else
                {
                    // DNI no encontrado en BDD
                    dniNoExiste.InnerText = "El DNI no existe";
                    dniNoExiste.Visible = true;
                    LimpiarCampos();
                }
            }
            catch (Exception ex)
            {
                
                Response.Write("<script>alert('Error al buscar cliente: " + ex.Message + "');</script>");
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta(@"
                    IF EXISTS (SELECT 1 FROM Clientes WHERE Documento = @DNI)
                        UPDATE Clientes 
                        SET Nombre=@Nombre, Apellido=@Apellido, Email=@Email, Direccion=@Direccion, Ciudad=@Ciudad, CP=@CP
                        WHERE Documento=@DNI
                    ELSE
                        INSERT INTO Clientes (Documento, Nombre, Apellido, Email, Direccion, Ciudad, CP)
                        VALUES (@DNI, @Nombre, @Apellido, @Email, @Direccion, @Ciudad, @CP)");

                datos.setearParametro("@DNI", txtDni.Text.Trim());
                datos.setearParametro("@Nombre", txtNombre.Text.Trim());
                datos.setearParametro("@Apellido", txtApellido.Text.Trim());
                datos.setearParametro("@Email", txtEmail.Text.Trim());
                datos.setearParametro("@Direccion", txtDireccion.Text.Trim());
                datos.setearParametro("@Ciudad", txtCiudad.Text.Trim());
                datos.setearParametro("@CP", txtCP.Text.Trim());

                datos.ejecutarAccion();

               

                string script = @"
                var myModal = new bootstrap.Modal(document.getElementById('modalExito'));
                myModal.show();
                ";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mostrarModal", script, true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mostrarError", $"alert('Error al guardar cliente: {ex.Message}');", true);

            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        private void LimpiarCampos()
        {
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtEmail.Text = "";
            txtDireccion.Text = "";
            txtCiudad.Text = "";
            txtCP.Text = "";
        }


    }
}