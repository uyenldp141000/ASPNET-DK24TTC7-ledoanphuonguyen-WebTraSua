<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="PJTraSua.DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <style>
    body { background-color: #ffe4e1; font-family: Arial; } /* Hồng nhạt */
    .login-box { 
        width: 300px; padding: 20px; margin: 100px auto; 
        background: #fff; border-radius: 15px; border: 2px solid #ffb6c1;
    }
</style>

   <title>Pinky Tea - Trà Sữa Ngọt Ngào</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-box">

    <h2 style="color:#d10047; text-align:center;">ĐĂNG NHẬP</h2>
    Tên tài khoản: <asp:TextBox ID="txtTenDN" runat="server" Width="100%"></asp:TextBox> <br /><br />
    Mật khẩu: <asp:TextBox ID="txtMatKhau" runat="server" TextMode="Password" Width="100%"></asp:TextBox> <br /><br />
    <asp:Button ID="btnDangNhap" runat="server" Text="Đăng Nhập" OnClick="btnDangNhap_Click" BackColor="#ffb6c1" Width="100%" />
    <br />
    <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
