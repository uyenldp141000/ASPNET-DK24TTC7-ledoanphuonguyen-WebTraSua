using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PJTraSua
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                lblUser.Text = "Xin chào, " + Session["User"].ToString();
            }
            else
            {
                // Nếu chưa đăng nhập mà cố tình vào trang member, bắt login
                Response.Redirect("DangNhap.aspx");
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (fileAnhMoi.HasFile)
            {
                // 1. Lưu file ảnh vào thư mục /Images/
                string fileName = fileAnhMoi.FileName;
                string path = Server.MapPath("~/Images/") + fileName;
                fileAnhMoi.SaveAs(path);

                // 2. Lưu tên file vào Database
                string connString = ConfigurationManager.ConnectionStrings["TraSuaDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connString))
                {
                    string sql = "INSERT INTO SanPham (TenSP, HinhAnh, GiaTien) VALUES (@ten, @anh, @gia)";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@ten", txtTenMoi.Text);
                    cmd.Parameters.AddWithValue("@anh", fileName); // Chỉ lưu tên file, ví dụ: "trasua.jpg"
                    cmd.Parameters.AddWithValue("@gia", decimal.Parse(txtGiaMoi.Text)); // Đảm bảo là số

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                gvSanPham.DataBind(); // Cập nhật lại GridView
            }
            else
            {
                Response.Write("<script>alert('Vui lòng chọn ảnh!');</script>");
            }
            // 1. Xóa sạch các thông tin đăng nhập trong Session
            Session.Abandon(); // Hủy bỏ tất cả Session
            Session.Clear();   // Xóa giá trị trong các Session

            // 2. Chuyển hướng về trang Đăng nhập
            Response.Redirect("DangNhap.aspx");
        }
        protected void btnDangXuat_Click(object sender, EventArgs e)
        {
            // 1. Xóa sạch các thông tin đăng nhập trong Session
            Session.Abandon(); // Hủy bỏ tất cả Session
            Session.Clear();   // Xóa giá trị trong các Session

            // 2. Chuyển hướng về trang Đăng nhập
            Response.Redirect("DangNhap.aspx");
        }
    }
}