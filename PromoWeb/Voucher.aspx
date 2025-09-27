<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Voucher.aspx.cs" Inherits="PromoWeb.Voucher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="container mt-5">
     <div class="row justify-content-center">
         <div class="col-md-4">
             <div class="card shadow-lg">
                 <div class="card-body">
                     <h5 class="card-title text-center">Ingreso de Voucher</h5>
                     <div class="mb-3">
                         <label for="voucher" class="form-label">Código</label>
                         <input type="text" id="voucher" class="form-control" placeholder="Ej: ABC12345">
                     </div>
                     <div class="d-grid">
                         <button class="btn btn-success">Validar</button>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>

</asp:Content>
