<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhanAnh.aspx.cs" Inherits="PJTraSua.PhanAnh" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Gửi phản ánh</title>
    <style>
        .container { width: 500px; margin: 50px auto; padding: 20px; border: 1px solid #ddd; border-radius: 10px; }
        .input-group { margin-bottom: 15px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 style="color: #d10047;">📝 GỬI PHẢN ÁNH</h2>
            <div class="input-group">
                Họ tên:<br /> <asp:TextBox ID="txtTen" runat="server" Width="100%"></asp:TextBox>
            </div>
            <div class="input-group">
                SĐT:<br /> <asp:TextBox ID="txtSdt" runat="server" Width="100%"></asp:TextBox>
            </div>
            <div class="input-group">
                Nội dung:<br /> <asp:TextBox ID="txtNoiDung" runat="server" TextMode="MultiLine" Height="100px" Width="100%"></asp:TextBox>
            </div>
            <asp:Button ID="btnGui" runat="server" Text="Gửi phản ánh" OnClick="btnGui_Click" BackColor="#ff69b4" ForeColor="White" />
        </div>
    </form>
</body>
</html>