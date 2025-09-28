<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PromoWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="card text-center mb-4" style="background-image: url('https://i.pinimg.com/1200x/b4/3e/32/b43e324618406e41dbe1c08c899a7c70.jpg'); background-size: contain; background-position: center;  height: 400px; color: white; position: relative;">
        <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.4); z-index: 1;">
        </div>
        <div class="card-header">
            Novedades
        </div>
        <div class="card-body" style="position: relative; z-index: 2;">
            <h1 class="card-title mb-2 text-center text-uppercase fw-bold" style = "color: #ff6f61; text-shadow: 2px 2px 4px rgba(0,0,0,0.3); letter-spacing: 1px;">¡Nuevo local!</h1>
            <h5> 📍San Fernando</h5>
            <p class="card-text mx-auto text-justify mt-3" style="max-width: 600px;font-size: 18px;">
                La Perla abrió sus puertas con una amplia variedad de artículos de computación, 
   laptops, accesorios gamer y lo último en tecnología. 
   Los primeros clientes podrán aprovechar descuentos especiales en placas de video, 
   periféricos y combos de PC armadas.
            </p>
            
        </div>
        <div class="card-footer text-body-secondary" style="position: relative; z-index: 2;">
            Hace 1 día
        </div>
    </div>


    <div class="card text-center " style="background-image: url('https://i.pinimg.com/1200x/91/8b/b2/918bb2f5d7d7aefd5267653a34f54e99.jpg'); background-size: cover; background-position: center;  height: 400px; color: white; position: relative;">
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
