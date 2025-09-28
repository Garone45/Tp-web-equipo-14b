<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PromoWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="card-custom-novedades text-center mb-4" style="background-image: url('https://i.pinimg.com/1200x/b4/3e/32/b43e324618406e41dbe1c08c899a7c70.jpg')">
        <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.4); z-index: 1;">
        </div>
        
        <div class="card-custom-conjunto-textos" style="position: relative; z-index: 2;">
            <h1 class="card-title mb-2 text-center text-uppercase fw-bold" style = "color: #ff6f61; text-shadow: 2px 2px 4px rgba(0,0,0,0.3); letter-spacing: 1px;">¡Nuevo local!</h1>
            <h5> 📍San Fernando</h5>
            <p class="card-text mx-auto text-justify mt-3" style="max-width: 600px;font-size: 18px;">
                La Perla abrió sus puertas con una amplia variedad de artículos de computación, 
   laptops, accesorios gamer y lo último en tecnología. 
   Los primeros clientes podrán aprovechar descuentos especiales en placas de video, 
   periféricos y combos de PC armadas.
            </p>
            
        </div>

        <div class="empresa-footer text-center mt-4"  style="position: relative; z-index: 3; margin-top: 20px;">
            <img src="https://us.123rf.com/450wm/fillvector/fillvector2202/fillvector220209517/182757898-icono-de-auriculares-de-l%C3%ADnea-de-ne%C3%B3n-brillante-aislado-sobre-fondo-negro-auriculares-concepto.jpg?ver=6" alt="Logo Empresa" class="laperla-logo" />
            <h4 class="card-tile mb-2">La Perla</h4>
        </div>
    </div>


    <div class="card card-custom-promo text-center " style="background-image: url('https://i.pinimg.com/1200x/91/8b/b2/918bb2f5d7d7aefd5267653a34f54e99.jpg')">
        <div class="card-header">
        </div>
        <div class="card-body">
            <h5 class="card-title mb-2 text-center text-uppercase fw-bold" style = "color: yellow; text-shadow: 2px 2px 4px rgba(0,0,0,0.3); letter-spacing: 1px;"">¡Promo Ganá!</h5>
            <p class="card-text">
                Aprovechá nuestros cupones exclusivos:  
      <ul style="list-style: none; padding-left: 0;">
          <li>🎒 Mochila Porta Notebook</li>
          <%--<li>🖱️ Mouse Gamer Hero G502</li>--%>
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
