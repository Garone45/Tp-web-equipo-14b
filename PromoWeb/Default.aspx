<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PromoWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-5">
        <h2 class="text-center mb-4">Bienvenido al canje de artículos</h2>
        <p class="lead text-center">Ingresá tu código para canjear un artículo exclusivo.</p>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-body">
                        <h5 class="card-title text-center">Canjear código</h5>
                        <div class="mb-3">
                            <label for="txtCodigo" class="form-label">Código del artículo</label>
                            <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" placeholder="Ej: ABC12345" />
                        </div>
                        <div class="d-grid">
                            <asp:Button ID="btnCanjear" runat="server" CssClass="btn btn-success" Text="Canjear" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>