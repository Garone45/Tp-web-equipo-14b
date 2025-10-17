<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="PromoWeb.Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-5">
        <h2 class="mb-4 text-center">Ingresá tus datos</h2>

        <div class="row mb-3">
            <div class="col-md-3">
                <label for="txtDni" class="form-label">DNI</label>
                <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" Placeholder="99884466" />
                <div id="dniNoExiste" class="text-danger position-absolute" style="bottom:-20px; left:0; font-size:0.85rem;" runat="server" visible="false"></div>
            </div>
            <div class="col-md-2 d-flex align-items-end">
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary w-100" OnClick="btnBuscar_Click" />
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-3">
                <label for="txtNombre" class="form-label">Nombre</label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Placeholder="Tu nombre"  />
            </div>
            <div class="col-md-3">
                <label for="txtApellido" class="form-label">Apellido</label>
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" Placeholder="Tu apellido"  />
            </div>
            <div class="col-md-3">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" Placeholder="ejemplo@dominio.com"  />
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-3">
                <label for="txtDireccion" class="form-label">Dirección</label>
                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" Placeholder="Calle falsa 123" />
            </div>
            <div class="col-md-3">
                <label for="txtCiudad" class="form-label">Ciudad</label>
                <asp:TextBox ID="txtCiudad" runat="server" CssClass="form-control" Placeholder="Tu ciudad"/>
            </div>
            <div class="col-md-2">
                <label for="txtCP" class="form-label">CP</label>
                <asp:TextBox ID="txtCP" runat="server" CssClass="form-control" Placeholder="Tu codigo postal"/>

            </div>
            <div class="form-check mb-2 mt-3">
                <asp:CheckBox ID="chkTerminos" runat="server" CssClass="form-check-input" />
                <label class="form-check-label" for="<%= chkTerminos.ClientID %>">
                    Acepto los términos y condiciones
                </label>

                <!-- Mensaje de error -->
                <div id="chkError" class="text-danger mt-1" style="display: none; font-size: 0.85rem;">
                    Debe aceptar los términos y condiciones para continuar.
                </div>
            </div>
        </div>
        <asp:Button ID="btnGuardar" runat="server" Text="Participar!" CssClass="btn btn-success" OnClick="btnGuardar_Click" OnClientClick="return validarCampos();" CausesValidation="false" />
        <div id="camposError" class="text-danger mt-2" style="display: none; font-size: 0.9rem;">
            Por favor, complete todos los campos obligatorios.
        </div>
    </div>


    <!-- Modal de Exito -->
<div class="modal fade" id="modalExito" tabindex="-1" aria-labelledby="modalExitoLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalExitoLabel">¡Éxito!</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar" onclick="window.location.href='Default.aspx';" ></button>
      </div>
      <div class="modal-body">
       Ya estas participando con éxito ¡Mucha suerte!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="window.location.href='Default.aspx';" >Salir</button>
      </div>
    </div>
  </div>
</div>



    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const dniInput = document.getElementById("<%= txtDni.ClientID %>");
        const emailInput = document.getElementById("<%= txtEmail.ClientID %>");
        const buscarBtn = document.getElementById("<%= btnBuscar.ClientID %>");
        const chk = document.getElementById("<%= chkTerminos.ClientID %>");
        const chkError = document.getElementById("chkError"); 

    // Crear contenedor para el mensaje del DNI
    const dniError = document.createElement("div");
    dniError.className = "invalid-feedback";
    dniError.innerText = "El DNI debe contener entre 7 y 8 números";
    dniInput.parentNode.appendChild(dniError);

    // Crear contenedor para el mensaje del email
    const emailError = document.createElement("div");
    emailError.className = "invalid-feedback";
    emailInput.parentNode.appendChild(emailError);

    // Validación DNI al perder foco 
    dniInput.addEventListener("blur", function () {
        const dni = dniInput.value.trim();
        if (dni !== "" && !/^\d{7,8}$/.test(dni)) {
            dniInput.classList.add("is-invalid");
        } else {
            dniInput.classList.remove("is-invalid");
        }
    });

    // Validación email al perder foco 
    emailInput.addEventListener("blur", function () {
        const email = emailInput.value.trim();
        if (email === "") {
            emailError.innerText = "El email es obligatorio";
            emailInput.classList.add("is-invalid");
        } else if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(email)) {
            emailError.innerText = "Ingrese email válido (ej: usuario@dominio.com)";
            emailInput.classList.add("is-invalid");
        } else {
            emailInput.classList.remove("is-invalid");
        }
    });

            

    // Validación DNI antes de buscar
    buscarBtn.addEventListener("click", function (e) {
        const dni = dniInput.value.trim();

        // Solo validar si hay algo escrito
        if (dni !== "" && !/^\d{7,8}$/.test(dni)) {
            e.preventDefault(); // evita la acción de buscar
            dniInput.classList.add("is-invalid");
            dniInput.focus();
            return false;
        } else {
            dniInput.classList.remove("is-invalid");
            // Permite la búsqueda aunque el campo estre vaccio
            
        }
    });

        chk.addEventListener("change", function () {
            if (chk.checked) {
                chkError.style.display = "none";
            }
        });
        chk.addEventListener("change", function () {
            if (chk.checked) {
                chkError.style.display = "none"; // si lo tilda, se oculta el mensaje
            }
        });
});
    </script>

    <script>
        function validarCampos() {
            const dni = document.getElementById("<%= txtDni.ClientID %>");
            const nombre = document.getElementById("<%= txtNombre.ClientID %>");
            const apellido = document.getElementById("<%= txtApellido.ClientID %>");
            const email = document.getElementById("<%= txtEmail.ClientID %>");
            const direccion = document.getElementById("<%= txtDireccion.ClientID %>");
            const ciudad = document.getElementById("<%= txtCiudad.ClientID %>");
            const cp = document.getElementById("<%= txtCP.ClientID %>");
            const chk = document.getElementById("<%= chkTerminos.ClientID %>"); 
            const camposError = document.getElementById("camposError");
            const chkError = document.getElementById("chkError"); 

            let error = false;
            camposError.style.display = "none";
            chkError.style.display = "none";

            // Limpiar clases previas
            [dni, nombre, apellido, email, direccion, ciudad, cp].forEach(input => input.classList.remove("is-invalid"));

            // Validar campos obligatorios
            if (dni.value.trim() === "" || !/^\d{7,8}$/.test(dni.value.trim())) { dni.classList.add("is-invalid"); error = true; }
            if (nombre.value.trim() === "") { nombre.classList.add("is-invalid"); error = true; }
            if (apellido.value.trim() === "") { apellido.classList.add("is-invalid"); error = true; }
            if (email.value.trim() === "" || !/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(email.value.trim())) { email.classList.add("is-invalid"); error = true; }
            if (direccion.value.trim() === "") { direccion.classList.add("is-invalid"); error = true; }
            if (ciudad.value.trim() === "") { ciudad.classList.add("is-invalid"); error = true; }
            if (cp.value.trim() === "") { cp.classList.add("is-invalid"); error = true; }

            if (!chk.checked) {
                chkError.style.display = "block";
                error = true;
            }

            if (error) {
                camposError.style.display = "block";
                return false; // evita postback
            }

            return true; // permite postback
        }

    </script>


 





</asp:Content>
