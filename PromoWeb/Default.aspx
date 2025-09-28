<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PromoWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="card text-center">
        <div class="card-header">
            ¡Nuevo!
        </div>
        <div class="card-body">
            <h3 class="card-title mb-3 text-center text-uppercase fw-bold" style = "color: #ff6f61; text-shadow: 2px 2px 4px rgba(0,0,0,0.3); letter-spacing: 1px;">Nuevo local de La Perla en San Fernando</h3>
            <p class="card-text mx-auto text-justify mt-3" style="max-width: 600px;">
                La Perla abrió sus puertas con una amplia variedad de artículos de computación, 
   laptops, accesorios gamer y lo último en tecnología. 
   Los primeros clientes podrán aprovechar descuentos especiales en placas de video, 
   periféricos y combos de PC armadas.
            </p>
            <a href="#" class="btn btn-primary">Ver más...</a>
        </div>
        <div class="card-footer text-body-secondary">
            Hace 1 día
        </div>
    </div>


    <div class="card text-center">
        <div class="card-header">
        </div>
        <div class="card-body">
            <h5 class="card-title">¡Promo Ganá!</h5>
            <p class="card-text">
                Aprovechá nuestros cupones exclusivos:  
      <ul style="list-style: none; padding-left: 0;">
          <li>🎒 Mochila Porta Notebook</li>
          <li>🖱️ Mouse Gamer Hero G502</li>
          <li>⌨️ Teclado Mecánico 75% RK M75</li>
      </ul>
                Solo por tiempo limitado, ¡no te lo pierdas!
            </p>
            <a href="Voucher.aspx" class="btn btn-warning">Ver Promo</a>
        </div>
        <div class="card-footer text-body-secondary">
            Hasta agotar stock
        </div>
    </div>
    <!--
   
    -->
</asp:Content>
