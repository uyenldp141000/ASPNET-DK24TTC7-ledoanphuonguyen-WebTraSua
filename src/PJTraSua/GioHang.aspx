<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="PJTraSua.GioHang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pinky Tea - Trà Sữa Ngọt Ngào</title>
    <style>
    .cart-container {
        background-color: #FFF5F7; /* Màu nền hồng rất nhạt */
        padding: 20px;
        border-radius: 15px;
        border: 1px solid #FFC0CB;
    }

    /* Tiêu đề */
    h2 {
        color: #D63384; /* Màu hồng đậm hơn cho chữ */
        text-align: center;
    }

    /* Bảng giỏ hàng */
    #gvGioHang {
        width: 100%;
        background-color: white;
        border: 1px solid #FFB7C5;
    }

    #gvGioHang th {
        background-color: #FFB7C5; /* Header bảng màu hồng phấn */
        color: white;
        padding: 10px;
    }

    /* Các nút bấm tông hồng */
    .action-buttons input {
        background-color: #FF85A2; /* Màu hồng chính */
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
    }

    .action-buttons input:hover {
        background-color: #FF5C85; /* Hồng đậm hơn khi di chuột */
    }

    /* Tổng tiền */
    .tong-tien-label {
        font-size: 18px;
        color: #D63384;
        font-weight: bold;
    }
</style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="cart-container">

            <a href="Default.aspx" class="btn-quay-ve">« Quay về trang chủ</a>
<div class="cart-container">
    <h2>GIỎ HÀNG CỦA BẠN</h2>

    <asp:GridView ID="gvGioHang" runat="server" AutoGenerateColumns="False" OnRowCommand="gvGioHang_RowCommand">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Tên sản phẩm" />
            <asp:BoundField DataField="Price" HeaderText="Đơn giá" DataFormatString="{0:N0}" />
            <asp:TemplateField HeaderText="Số lượng">
                <ItemTemplate>
                    <asp:Button ID="btnGiam" runat="server" Text="-" CommandName="Giam" CommandArgument='<%# Eval("ProductID") %>' />
                    <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>' Width="30px"></asp:TextBox>
                    <asp:Button ID="btnTang" runat="server" Text="+" CommandName="Tang" CommandArgument='<%# Eval("ProductID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Total" HeaderText="Thành tiền" DataFormatString="{0:N0}" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="btnXoa" runat="server" Text="Xóa" CommandName="XoaSP" CommandArgument='<%# Eval("ProductID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
    <div class="discount-section"> 
    <asp:TextBox ID="txtCoupon" runat="server" placeholder="Nhập mã giảm giá..."></asp:TextBox>
    <asp:Button ID="btnApplyCoupon" runat="server" Text="Áp dụng" OnClick="btnApplyCoupon_Click" />
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
</div>

    <div class="total-box">
        <h3>Tổng tiền: <asp:Label ID="lblTongTien" runat="server" Text="0"></asp:Label> USDT</h3>
    </div>

    <div class="action-buttons">
        <asp:Button ID="btnThanhToan" runat="server" Text="Xác nhận đặt hàng" OnClick="btnThanhToan_Click" />
        <asp:Button ID="btnHuy" runat="server" Text="Hủy giỏ hàng" OnClick="btnHuy_Click" />
    </div>
</div>
            </div>
    </form>
</body>
</html>
