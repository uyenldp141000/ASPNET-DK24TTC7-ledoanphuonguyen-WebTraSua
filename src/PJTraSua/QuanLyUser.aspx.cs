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
    public partial class QuanLyUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData(); // Gọi hàm load dữ liệu
            }
        }

        void LoadData()
        {
            string strCon = ConfigurationManager.ConnectionStrings["TraSuaDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strCon))
            {
                // Sử dụng LEFT JOIN để lấy thông tin user kèm thống kê đơn hàng
                string sql = @"SELECT N.MaND, N.TenDN, N.NgayTao, N.LanDangNhapCuoi, 
                              COUNT(D.MaDH) AS SoDon, 
                              ISNULL(SUM(D.TongTien), 0) AS TongTien
                       FROM NguoiDung N
                       LEFT JOIN DonHang D ON N.MaND = D.MaND
                       GROUP BY N.MaND, N.TenDN, N.NgayTao, N.LanDangNhapCuoi";

                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                System.Data.DataTable dt = new System.Data.DataTable();
                da.Fill(dt);

                gvUser.DataSource = dt;
                gvUser.DataBind();
            }
        }

        // Xử lý xóa User
        protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvUser.DataKeys[e.RowIndex].Value);
            string strCon = ConfigurationManager.ConnectionStrings["TraSuaDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strCon))
            {
                string sql = "DELETE FROM NguoiDung WHERE MaND = @id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            LoadData(); // Tải lại danh sách
        }
    }
}