<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TraSuaWeb.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pinky Tea - Trà Sữa Ngọt Ngào</title>
    <style>
        
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
        <div class="header">
            <h1>🌸 Chào mừng đến với Pinky Tea 🌸</h1>
            <p>Menu trà sữa hôm nay</p>
        </div>

        <div style="display: flex; justify-content: center; width: 100%;">
            <asp:DataList ID="dlSanPham" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <div class="product-item">
                        <asp:Image ID="imgSP" runat="server" CssClass="product-img" 
                                   ImageUrl='<%# "~/Images/" + Eval("HinhAnh") %>' />
                        
                        <h3 class="product-name"><%# Eval("TenSP") %></h3>
                        
                        <p class="product-price"><%# Eval("GiaTien", "{0:0,0} USD") %></p>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>