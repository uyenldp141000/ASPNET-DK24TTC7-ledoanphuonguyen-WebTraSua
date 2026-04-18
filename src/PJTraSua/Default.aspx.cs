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
            // Chỉ load dữ liệu trong lần chạy đầu tiên, tránh load lại khi postback
            if (!IsPostBack)
            {
                LayDuLieu();
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

                // 5. Gán vào Control hiển thị 
                dlSanPham.DataSource = dt;
                dlSanPham.DataBind();
            }
        }

        
    }

    
}