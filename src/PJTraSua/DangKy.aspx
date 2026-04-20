<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="PJTraSua.DangKy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color: #ffe4e1; padding: 30px; width: 350px; margin: 50px auto; border-radius: 15px; text-align: center; border: 2px solid #ffb6c1;">
    <h2 style="color: #d10047;">ĐĂNG KÝ TÀI KHOẢN</h2>
    
    <div style="text-align: left; margin-bottom: 10px;">
        Tên đăng nhập:<br />
        <asp:TextBox ID="txtTenDN" runat="server" Width="100%"></asp:TextBox>
    </div>
    
    <div style="text-align: left; margin-bottom: 15px;">
        Mật khẩu:<br />
        <asp:TextBox ID="txtMatKhau" runat="server" TextMode="Password" Width="100%"></asp:TextBox>
    </div>
    
    <asp:Button ID="btnDangKy" runat="server" Text="Đăng ký ngay" OnClick="btnDangKy_Click" 
                BackColor="#ffb6c1" BorderStyle="None" Width="100%" Height="35px" style="cursor:pointer;" />
    
    <br /><br />
    <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <a href="DangNhap.aspx" style="color: #d10047;">Đã có tài khoản? Đăng nhập tại đây</a>
</div>
    </form>
</body>
</html>
