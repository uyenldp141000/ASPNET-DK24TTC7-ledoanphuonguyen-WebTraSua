<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LienHe.aspx.cs" Inherits="PJTraSua.LienHe" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Liên hệ</title>
    <style>
        .box { width: 400px; margin: 50px auto; padding: 20px; border: 2px solid #ffb6c1; border-radius: 15px; background: #fff0f5; text-align: center; }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        

        <div class="box">
    <h2 style="color: #d10047;">📞 THÔNG TIN LIÊN HỆ</h2>
    <p>Hotline: <asp:Label ID="lblSDT" runat="server"></asp:Label></p>
    <p>Email: <asp:Label ID="lblEmail" runat="server"></asp:Label></p>
    
    <hr style="border: 0; border-top: 1px dashed #ffb6c1; margin: 15px 0;" />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">⬅ Quay về trang chủ</asp:HyperLink>
</div>
    </form>
</body>
</html>