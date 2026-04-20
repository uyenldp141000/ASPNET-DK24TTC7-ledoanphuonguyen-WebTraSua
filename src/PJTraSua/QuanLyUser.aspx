<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuanLyUser.aspx.cs" Inherits="PJTraSua.QuanLyUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

               
     <div style="background-color: #ffe4e1; padding: 20px; border-radius: 15px; border: 2px solid #ffb6c1; margin: 20px;">
         <div style="margin-bottom: 15px;">
        <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="Admin.aspx" 
            style="text-decoration: none; color: #d10047; font-weight: bold; padding: 5px 10px; background: white; border-radius: 5px; border: 1px solid #d10047;">
            &laquo; Trở lại trang Admin
        </asp:HyperLink>
    </div>
    <h2 style="color: #d10047; text-align: center;">QUẢN LÝ NGƯỜI DÙNG</h2>
    
    <asp:GridView ID="gvUser" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MaND" OnRowDeleting="gvUser_RowDeleting" 
        Width="100%" CellPadding="10" ForeColor="#333333" GridLines="None">
        
        <HeaderStyle BackColor="#ffb6c1" ForeColor="White" Font-Bold="True" />
        <AlternatingRowStyle BackColor="#fff0f5" />
    <Columns>
        <asp:BoundField DataField="TenDN" HeaderText="Tên User" />
            <asp:BoundField DataField="NgayTao" HeaderText="Ngày tạo" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="LanDangNhapCuoi" HeaderText="Đăng nhập cuối" />
            <asp:BoundField DataField="SoDon" HeaderText="Số đơn" />
            <asp:BoundField DataField="TongTien" HeaderText="Tổng tiền (VNĐ)" DataFormatString="{0:N0}" />
            
            <asp:TemplateField HeaderText="Thao tác">
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" Text="Xóa" CommandName="Delete" 
                        OnClientClick="return confirm('Bạn chắc chắn muốn xóa user này?');"
                        BackColor="#ff69b4" ForeColor="White" BorderStyle="None" style="padding:5px 10px; cursor:pointer;" />
                </ItemTemplate>
            </asp:TemplateField>
    </Columns>
</asp:GridView>
        <div>
        </div>
    </form>
</body>
</html>
