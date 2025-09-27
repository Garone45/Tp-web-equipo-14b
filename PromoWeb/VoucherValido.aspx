<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VoucherValido.aspx.cs" Inherits="PromoWeb.VoucherValido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h1 class="mb-4">Voucher válido — Seleccioná tu premio</h1>
        <div class="row">
            <!-- Tarjeta 1 -->
            <div class="col-md-4 d-flex">
                <div class="card flex-fill">
                    <img src="img/mochila.jpg" class="card-img-top" alt="Mochila Gamer" />
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">Mochila Gamer</h5>
                        <p class="card-text">Mochila acolchada para laptop y accesorios gaming.</p>
                        <div class="mt-auto">
                            <a href="#" class="btn btn-success w-100">Seleccionar</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tarjeta 2 -->
            <div class="col-md-4 d-flex">
                <div class="card flex-fill">
                    <img src="img/mouse.jpg" class="card-img-top" alt="Mouse Gamer" />
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">Mouse Gamer</h5>
                        <p class="card-text">Mouse óptico con RGB y alta precisión.</p>
                        <div class="mt-auto">
                            <a href="#" class="btn btn-success w-100">Seleccionar</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tarjeta 3 -->
            <div class="col-md-4 d-flex">
                <div class="card flex-fill">
                    <img src="img/auris.jpg" class="card-img-top" alt="Auriculares Gamer" />
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">Auriculares Gamer</h5>
                        <p class="card-text">Auriculares con micrófono y sonido envolvente.</p>
                        <div class="mt-auto">
                            <a href="#" class="btn btn-success w-100">Seleccionar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        /* Todas las imágenes con el mismo alto */
        .card-img-top {
            height: 200px;        /* ajustá este valor si querés más grande/chico */
            object-fit: cover;    /* recorta y centra la imagen */
        }
    </style>
</asp:Content>
