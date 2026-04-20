<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="PJTraSua.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    
    <form id="form1" runat="server">

        <div style="margin-bottom: 20px;">
    <a href="Admin.aspx" style="margin-right: 20px;">Quản lý Sản phẩm</a>
    <a href="QuanLyUser.aspx" style="font-weight: bold; color: blue;">Quản lý Người dùng</a>
</div>

        <div style="text-align: right; margin: 10px;">
    <asp:Label ID="lblUser" runat="server" Text="Xin chào, User"></asp:Label>
    <asp:Button ID="btnDangXuat" runat="server" Text="Đăng xuất" 
        OnClick="btnDangXuat_Click" 
        BackColor="#ffb6c1" BorderStyle="None" />
</div>
        <div style="background-color: #ffe4e1; padding: 30px; font-family: Arial;">
    <h2 style="color: #d10047; text-align: center;">QUẢN TRỊ SẢN PHẨM</h2>
    
    <asp:GridView ID="gvSanPham" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MaSP" DataSourceID="SqlDataSource1" Width="100%" 
        BackColor="White" CellPadding="10">
        <Columns>
            <asp:BoundField DataField="MaSP" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="TenSP" HeaderText="Tên Trà Sữa" />
            <asp:BoundField DataField="HinhAnh" HeaderText="Ảnh" />
            <asp:BoundField DataField="GiaTien" HeaderText="Giá Tiền" />
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" HeaderText="Thao tác" />
        </Columns>
    </asp:GridView>
            <div style="margin-top: 20px; border-top: 1px solid #ffb6c1; padding-top: 20px;">
    <h3>Thêm sản phẩm mới</h3>
    
Tên: <asp:TextBox ID="txtTenMoi" runat="server"></asp:TextBox>
Ảnh: <asp:FileUpload ID="fileAnhMoi" runat="server" /> 
Giá: <asp:TextBox ID="txtGiaMoi" runat="server"></asp:TextBox>
<asp:Button ID="btnThem" runat="server" Text="Thêm" OnClick="btnThem_Click" />
</div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TraSuaDB %>" 
        DeleteCommand="DELETE FROM [SanPham] WHERE [MaSP] = @MaSP" 
        InsertCommand="INSERT INTO [SanPham] ([TenSP], [HinhAnh], [GiaTien]) VALUES (@TenSP, @HinhAnh, @GiaTien)" 
        SelectCommand="SELECT * FROM [SanPham]" 
        UpdateCommand="UPDATE [SanPham] SET [TenSP] = @TenSP, [HinhAnh] = @HinhAnh, [GiaTien] = @GiaTien WHERE [MaSP] = @MaSP">
        <DeleteParameters>
            <asp:Parameter Name="MaSP" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="TenSP" Type="String" />
            <asp:Parameter Name="HinhAnh" Type="String" />
            <asp:Parameter Name="GiaTien" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenSP" Type="String" />
            <asp:Parameter Name="HinhAnh" Type="String" />
            <asp:Parameter Name="GiaTien" Type="Decimal" />
            <asp:Parameter Name="MaSP" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</div>
    </form>
</body>
</html>
