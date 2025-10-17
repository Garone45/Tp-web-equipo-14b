<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VoucherValido.aspx.cs" Inherits="PromoWeb.VoucherValido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container mt-4">
    <h1 class="mb-4">Seleccioná tu premio</h1>

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
                            <a href="Usuarios.aspx" class="btn btn-success w-100">Seleccionar</a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>

<style>
    .card-img-top {
        height: 300px;
        object-fit: contain

    }
</style>

</asp:Content>
