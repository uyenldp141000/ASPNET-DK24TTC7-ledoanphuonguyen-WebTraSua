<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="PJTraSua.DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <style>

        
    .header-logo {
        position: absolute; 
        top: 20px;          
        left: 20px;         
        z-index: 100;       
    }

    
    .header-logo img {
        max-width: 150px;   
        height: auto;       
        cursor: pointer;    
    }

    body { background-color: #ffe4e1; font-family: Arial; } 
    .login-box { 
        width: 300px; padding: 20px; margin: 100px auto; 
        background: #fff; border-radius: 15px; border: 2px solid #ffb6c1;
    }
</style>

   
</head>
<body>
    <form id="form1" runat="server">
        <div class="header-logo">
            <a href="Default.aspx">
                <img src="images/logo.png" alt="Pinky Tea Logo" />  
            </a>
        </div>
        
        <h1 style="text-align: center; color: #d10047; margin-top: 50px;">
            Chào mừng đến với Pinky Tea
        </h1>
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
