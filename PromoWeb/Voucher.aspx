<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Voucher.aspx.cs" Inherits="PromoWeb.Voucher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card shadow-lg">
                    <div class="card-body">
                        <h5 class="card-title text-center mb-4">Ingrese su Voucher</h5>

                        <!-- TextBox de código del voucher -->
                        <div class="mb-3">
                            <asp:TextBox ID="txtVoucher" runat="server" CssClass="form-control mx-auto" Style="width: 250px;" placeholder="Ej: ABC12345"></asp:TextBox>
                        </div>

                        <!-- Botón Validar -->
                        <div class="d-grid mb-2">
                            <asp:Button ID="btnValidar" runat="server" Text="Validar" CssClass="btn btn-success mx-auto" Style="width: 250px;" OnClick="btnValidar_Click" />
                        </div>

                        <!-- Label para mostrar mensaje de error -->
                        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger d-block text-center" Visible="false"></asp:Label>

                    </div>
                </div>
            </div>
        </div>
    </div>


      <!-- Modal -->
    <div class="modal fade" id="mensajeModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Atención</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" onclick="window.location.href='Default.aspx'" aria-label="Volver al inicio"></button>
          </div>
          <div class="modal-body">
            <asp:Label ID="lblModalMensaje" runat="server" Text=""></asp:Label>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="window.location.href='Default.aspx'">Volver al inicio</button>
          </div>
        </div>
      </div>
    </div>

</asp:Content>
