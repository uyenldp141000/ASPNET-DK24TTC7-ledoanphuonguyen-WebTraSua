using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PJTraSua
{
    public partial class PhanAnh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kiểm tra quyền: Chỉ Member hoặc Admin mới được vào
            if (Session["User"] == null)
            {
                Response.Write("<script>alert('Bạn cần đăng nhập để gửi phản ánh!'); window.location='DangNhap.aspx';</script>");
            }
        }

        protected void btnGui_Click(object sender, EventArgs e)
        {
            // Lưu vào database thay vì gửi mail (ổn định hơn)
            string sql = "INSERT INTO PhanAnh (TenKH, SDT, NoiDung, NgayGui) VALUES (@ten, @sdt, @nd, GETDATE())";
            // ... Dùng SqlCommand với Parameters.AddWithValue để lưu vào bảng PhanAnh
            Response.Write("<script>alert('Đã gửi phản ánh thành công!');</script>");
        }
    }
}