<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vouchers.aspx.cs" Inherits="PromoWeb.Vouchers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

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


    </form>
</body>
</html>
