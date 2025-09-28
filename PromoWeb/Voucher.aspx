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

</asp:Content>
