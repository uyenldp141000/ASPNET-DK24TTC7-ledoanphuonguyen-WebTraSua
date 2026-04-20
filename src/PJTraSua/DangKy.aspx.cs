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
    public partial class DangKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnDangKy_Click(object sender, EventArgs e)
        {
            string ten = txtTenDN.Text.Trim();
            string mk = txtMatKhau.Text.Trim();

            // Kiểm tra trống
            if (string.IsNullOrEmpty(ten) || string.IsNullOrEmpty(mk))
            {
                lblThongBao.Text = "Vui lòng nhập đầy đủ thông tin!";
                return;
            }

            // Kết nối Database
            string strCon = ConfigurationManager.ConnectionStrings["TraSuaDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strCon))
            {
                try
                {
                    // Kiểm tra trùng tên tài khoản (nếu cần thiết)
                    string sqlCheck = "SELECT COUNT(*) FROM NguoiDung WHERE TenDN = @ten";
                    SqlCommand cmdCheck = new SqlCommand(sqlCheck, con);
                    cmdCheck.Parameters.AddWithValue("@ten", ten);

                    con.Open();
                    int count = (int)cmdCheck.ExecuteScalar();

                    if (count > 0)
                    {
                        lblThongBao.Text = "Tên đăng nhập đã tồn tại!";
                    }
                    else
                    {
                        // Thêm tài khoản mới với quyền là 0 (Member)
                        string sqlInsert = "INSERT INTO NguoiDung (TenDN, MatKhau, Quyen) VALUES (@ten, @mk, 0)";
                        SqlCommand cmdInsert = new SqlCommand(sqlInsert, con);
                        cmdInsert.Parameters.AddWithValue("@ten", ten);
                        cmdInsert.Parameters.AddWithValue("@mk", mk);

                        cmdInsert.ExecuteNonQuery();
                        lblThongBao.ForeColor = System.Drawing.Color.Green;
                        lblThongBao.Text = "Đăng ký thành công! Đang chuyển hướng...";
                        Response.AddHeader("REFRESH", "3;URL=DangNhap.aspx");
                    }
                }
                catch (Exception ex)
                {
                    lblThongBao.Text = "Lỗi hệ thống: " + ex.Message;
                }
            }
        }
    }
}