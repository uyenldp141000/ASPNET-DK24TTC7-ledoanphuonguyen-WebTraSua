using System;
using System.Data;
using System.Data.SqlClient; // Thư viện để làm việc với SQL
using System.Configuration;

namespace TraSuaWeb
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (lnkPhanAnh != null)
            {
                lnkPhanAnh.Visible = (Session["User"] != null);
            }
            // Ẩn/Hiện link phản ánh dựa trên trạng thái đăng nhập
            lnkPhanAnh.Visible = (Session["User"] != null);

            // Chỉ load dữ liệu trong lần chạy đầu tiên, tránh load lại khi postback
            if (!IsPostBack)
            {
                LayDuLieu();
            }
            if (Session["User"] != null)
            {
                // Đã đăng nhập: Chỉ hiện nút Đăng xuất
                lblUser.Text = "Xin chào, " + Session["User"].ToString();
                btnDangNhap.Visible = false;
                btnDangKy.Visible = false;
                btnDangXuat.Visible = true;
            }
            else
            {
                // Chưa đăng nhập: Hiện nút Đăng nhập và Đăng ký
                lblUser.Text = "Chào khách";
                btnDangNhap.Visible = true;
                btnDangKy.Visible = true;
                btnDangXuat.Visible = false;
            }
        }

        private void LayDuLieu()
        {
            // 1. Lấy chuỗi kết nối từ Web.config
            string strCon = ConfigurationManager.ConnectionStrings["TraSuaDB"].ConnectionString;

            // 2. Mở kết nối
            using (SqlConnection con = new SqlConnection(strCon))
            {
                // 3. Câu lệnh truy vấn
                string sql = "SELECT * FROM SanPham";

                // 4. Dùng Adapter đổ dữ liệu vào DataTable
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // 5. Gán vào Control hiển thị (ví dụ DataList hoặc GridView)
                dlSanPham.DataSource = dt;
                dlSanPham.DataBind();
            }
        }

        protected void btnDangXuat_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("DangNhap.aspx");
        }
        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            Response.Redirect("DangNhap.aspx");
        }

        protected void btnDangKy_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("DangKy.aspx");
        }

        

    }

    
}