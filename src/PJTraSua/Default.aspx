<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TraSuaWeb.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pinky Tea - Trà Sữa Ngọt Ngào</title>
    <style>

        .minicart-wrapper {
    display: inline-flex; 
    align-items: center; 
    border: 2px solid #a31a1a; 
    border-radius: 8px; 
    padding: 8px 15px; 
    background-color: #ffffff; 
    font-family: Arial, sans-serif;
    cursor: pointer;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1); 
    transition: all 0.3s ease; /* Tạo hiệu ứng mượt khi di chuột */
}
        a:hover .minicart-wrapper {
    background-color: #f9f9f9;
    border-color: #801414; /* Đậm màu hơn */
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

.minicart-icon {
    width: 24px; 
    height: auto;
    margin-right: 10px; 
}

.minicart-text {
    font-size: 16px;
    font-weight: bold;
    color: #333333;
    margin-right: 15px; 
}

.minicart-badge {
    background-color: #e6e1d6; 
    color: #a31a1a; 
    border-radius: 5px;
    padding: 3px 10px; 
    min-width: 20px; 
    text-align: center;
    font-weight: bold;
}

        .header-container {
        display: flex; 
        justify-content: space-between; 
        
        align-items: center; 
        
        background-color: #ffe4e1; 
        border-bottom: 1px solid #eeeeee;

        padding: 5px 20px; 
        box-sizing: border-box;
    }
        .logo-img {
        height: 100px; 
        width: auto;
        display: block;
    }
        .login-box {
        display: flex;
        align-items: center; 
        gap: 15px; 
    }


        .nav-right a {
        text-decoration: none;
    }
    
    
    .nav-right a:hover {
        text-decoration: underline;
    }

        .header-logo {
    position: absolute; 
    top: 20px;          
    left: 20px;         
    z-index: 100;       
}

        a {
        text-decoration: none !important;
    }
        .nav-right {
    display: flex;
    gap: 10px;
    margin-left: auto; 
}

        .header-navbar {
        display: flex; 
        justify-content: space-between; 
        align-items: center; 
        background-color: #ffcccc; 
        padding: 10px 20px;
    }

    .nav-left a {
        text-decoration: none;
        color: #d10047;
        font-weight: bold;
    }

    .nav-right {
        display: flex;
        gap: 10px; 
        align-items: center;
    }
        body {
            background-color: #ffe4e1; 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }
        .header {
            text-align: center;
            padding: 20px;
            color: #d10047;
            background-color: rgba(255, 255, 255, 0.5);
            margin-bottom: 20px;
        }
        
        .product-item {
            border: 2px dashed #ffb6c1;
            padding: 15px;
            margin: 10px;
            text-align: center;
            background-color: #ffffff;
            border-radius: 15px;
            width: 220px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .product-img {
            width: 180px;
            height: 180px;
            object-fit: cover;
            border-radius: 10px;
        }
        .product-name {
            color: #333;
            font-size: 18px;
            margin: 10px 0;
        }
        .product-price {
            color: #e52b50;
            font-weight: bold;
            font-size: 16px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
                
        <div class="header-container">
    
    <div class="logo-box">
        <a href="Default.aspx">
            <img src="images/logo.png" alt="Logo Pinky Tea" class="logo-img" />
        </a>
        </div>
          <div class="login-box">   

              <a href="GioHang.aspx" style="text-decoration: none;">
    <div class="minicart-wrapper">
        <img src="images/icon_cart.png" alt="Cart" class="minicart-icon" />
        <span class="minicart-text">Giỏ hàng</span>
        <div class="minicart-badge">
            <asp:Label ID="lblCartCount" runat="server" Text="0"></asp:Label>
        </div>
    </div>
</a>

        <asp:Label ID="lblUser" runat="server" Text="Chào khách"></asp:Label>
        <asp:Button ID="btnDangNhap" runat="server" Text="Đăng nhập" OnClick="btnDangNhap_Click" />
        <asp:Button ID="btnDangKy" runat="server" Text="Đăng ký" OnClick="btnDangKy_Click" />
        <asp:Button ID="btnDangXuat" runat="server" Text="Đăng xuất" OnClick="btnDangXuat_Click" />
    
              </div>
            
</div>
            
            
   <div style="display: flex; justify-content: space-between; align-items: center; padding: 10px 20px; background-color: #ffb6c1;">
<div style="font-weight: bold; color: #d10047;">Pinky Tea Store 
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/LienHe.aspx">📞 Liên hệ</asp:HyperLink>
<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/PhanAnh.aspx" style="margin-left: 15px;">📝 Phản ánh</asp:HyperLink>
    

</div>
        </div>
        <div style="text-align: center; background-color: #ffc0cb; padding: 15px;">
            <h1>🌸 Chào mừng đến với Pinky Tea 🌸</h1>
            <p>Menu trà sữa hôm nay</p>
            </div>
            
            
        

        <div style="display: flex; justify-content: center; width: 100%;">
            <asp:DataList ID="dlSanPham" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <div class="product-item">
            <img src='<%# "images/" + Eval("HinhAnh") %>' width="100" height="100" style="object-fit: cover;" />
            <h4><%# Eval("TenSP") %></h4>
            <p>GiaTien: <%# Eval("GiaTien", "{0:N0}") %> USD</p>
            <asp:Button ID="btnAddToCart" runat="server" Text="Đặt hàng" 
                CommandArgument='<%# Eval("MaSP") %>' OnClick="btnAddToCart_Click" />
        </div>
                </ItemTemplate>
            </asp:DataList>
        </div>

        <div class="news-section">
    <h2 style="text-align:center;">TIN TỨC & SỰ KIỆN</h2>
    <asp:Repeater ID="rptTinTuc" runat="server">
        <ItemTemplate>
            <div class="news-item" style="border:1px solid #ccc; padding:15px; margin:10px; border-radius:10px; width:300px; display:inline-block; vertical-align:top;">
                <img src='<%# Eval("HinhAnh") %>' style="width:100%; height:180px; object-fit:cover; border-radius:5px;" />
                
                <h3 style="margin:10px 0;"><%# Eval("TieuDe") %></h3>
                
                <p style="color:#888; font-size:12px;"><%# Eval("NgayDang", "{0:dd/MM/yyyy}") %></p>
                
                <p><%# Eval("MoTa") %> ...</p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
    </form>
</body>
</html>