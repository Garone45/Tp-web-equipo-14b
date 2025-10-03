<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VoucherValido.aspx.cs" Inherits="PromoWeb.VoucherValido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container mt-4">
    <h1 class="mb-4">Voucher válido — Seleccioná tu premio</h1>

    <div class="row">
        <asp:Repeater ID="repArticulos" runat="server" OnItemDataBound="repArticulos_ItemDataBound">
            <ItemTemplate>
                <div class="col-md-4 d-flex mb-4">
                    <div class="card flex-fill">
                        <div id='carousel<%# Eval("IDArticulo") %>' class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <asp:Repeater ID="repImagenes" runat="server">
                                    <ItemTemplate>
                                        <div class='carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>'>
                                            <img src='<%# ResolveUrl(Container.DataItem.ToString()) %>' class="d-block w-100 card-img-top" />
                                        </div>
                                    </ItemTemplate> 
                                </asp:Repeater>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target='#carousel<%# Eval("IDArticulo") %>' data-bs-slide="prev">
                                <span class="carousel-control-prev-icon"></span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target='#carousel<%# Eval("IDArticulo") %>' data-bs-slide="next">
                                <span class="carousel-control-next-icon"></span>
                            </button>
                        </div>

                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("Nombre") %></h5>
                            <p class="card-text"><%# Eval("Descripcion") %></p>
                            <a href="#" class="btn btn-success w-100">Seleccionar</a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>

<style>
    .card-img-top {
        height: 200px;
        object-fit: cover;
    }
</style>

</asp:Content>

<%-- 
    =====================================================
    CÓDIGO VIEJO - NO BORRAR, SOLO REFERENCIA
    =====================================================
    <div class="container mt-4">
        <h1 class="mb-4">Voucher válido — Seleccioná tu premio</h1>
        <div class="row">

            <!-- Tarjeta 1 -->
            <div class="col-md-4 d-flex">
                <div class="card flex-fill">
                    <div id="carousel1" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="<%= //img1_t1 %>" class="d-block w-100 card-img-top" />
                            </div>
                            <div class="carousel-item">
                                <img src="<%= //img2_t1 %>" class="d-block w-100 card-img-top" />
                            </div>
                            <div class="carousel-item">
                                <img src="<%= //img3_t1 %>" class="d-block w-100 card-img-top" />
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carousel1" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carousel1" data-bs-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </button>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Mochila Gamer</h5>
                        <p class="card-text">Mochila acolchada para laptop y accesorios gaming.</p>
                        <a href="#" class="btn btn-success w-100">Seleccionar</a>
                    </div>
                </div>
            </div>

            <!-- Tarjeta 2 -->
            <div class="col-md-4 d-flex">
                <div class="card flex-fill">
                    <div id="carousel2" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="<%= //img1_t2 %>" class="d-block w-100 card-img-top" />
                            </div>
                            <div class="carousel-item">
                                <img src="<%= //img2_t2 %>" class="d-block w-100 card-img-top" />
                            </div>
                            <div class="carousel-item">
                                <img src="<%= //img3_t2 %>" class="d-block w-100 card-img-top" />
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carousel2" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carousel2" data-bs-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </button>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Mouse Gamer</h5>
                        <p class="card-text">Mouse óptico con RGB y alta precisión.</p>
                        <a href="#" class="btn btn-success w-100">Seleccionar</a>
                    </div>
                </div>
            </div>

            <!-- Tarjeta 3 -->
            <div class="col-md-4 d-flex">
                <div class="card flex-fill">
                    <div id="carousel3" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="<%= //img1_t3 %>" class="d-block w-100 card-img-top" />
                            </div>
                            <div class="carousel-item">
                                <img src="<%= //img2_t3 %>" class="d-block w-100 card-img-top" />
                            </div>
                            <div class="carousel-item">
                                <img src="<%= //img3_t3 %>" class="d-block w-100 card-img-top" />
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carousel3" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carousel3" data-bs-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </button>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Auriculares Gamer</h5>
                        <p class="card-text">Auriculares con micrófono y sonido envolvente.</p>
                        <a href="#" class="btn btn-success w-100">Seleccionar</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
--%>