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
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            string ten = txtTenDN.Text.Trim();
            string mk = txtMatKhau.Text.Trim();

            // Kiểm tra không được để trống
            if (string.IsNullOrEmpty(ten) || string.IsNullOrEmpty(mk))
            {
                lblThongBao.Text = "Vui lòng nhập đầy đủ tên và mật khẩu!";
                return;
            }

            string strCon = ConfigurationManager.ConnectionStrings["TraSuaDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strCon))
            {
                string sql = "SELECT * FROM NguoiDung WHERE TenDN=@ten AND MatKhau=@mk";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@ten", ten);
                cmd.Parameters.AddWithValue("@mk", mk);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // Lưu thông tin vào Session
                    Session["User"] = dr["TenDN"].ToString();
                    int quyen = Convert.ToInt32(dr["Quyen"]);

                    if (quyen == 1) Response.Redirect("Admin.aspx");
                    else Response.Redirect("Default.aspx");
                }
                else
                {
                    lblThongBao.Text = "Sai tài khoản hoặc mật khẩu!";
                }
                string sqlUpdate = "UPDATE NguoiDung SET LanDangNhapCuoi = GETDATE() WHERE TenDN = @ten";
                SqlCommand cmdUpdate = new SqlCommand(sqlUpdate, con);
                cmdUpdate.Parameters.AddWithValue("@ten", ten);
                cmdUpdate.ExecuteNonQuery();
            }
        }
    }
}