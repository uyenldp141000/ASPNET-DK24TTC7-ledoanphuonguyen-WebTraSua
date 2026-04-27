using PJTraSua;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient; // Thư viện để làm việc với SQL
using System.Linq;
using System.Web.UI.WebControls;

namespace TraSuaWeb
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTinTuc();
            }

            if (HyperLink2 != null)
            {
                HyperLink2.Visible = (Session["User"] != null);
            }
            // Ẩn/Hiện link phản ánh dựa trên trạng thái đăng nhập
            HyperLink2.Visible = (Session["User"] != null);

            // Chỉ load dữ liệu trong lần chạy đầu tiên, tránh load lại khi postback
            if (!IsPostBack)
            {
                UpdateMiniCartCount();
            }
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

        private void LoadTinTuc()
        {
            // Câu lệnh lấy 3 tin tức mới nhất
            string sql = "SELECT TOP 3 TieuDe, HinhAnh, NgayDang, MoTa FROM TinTuc ORDER BY NgayDang DESC";
            DataTable dt = GetData(sql); // Dùng hàm GetData bạn đã có

            if (dt.Rows.Count > 0)
            {
                rptTinTuc.DataSource = dt;
                rptTinTuc.DataBind(); // Lệnh này bắt buộc phải có!
            }
            else
            {
                // Nếu bảng trống, in ra thông báo để biết lỗi
                Response.Write("<script>alert('Không có tin tức nào trong database!');</script>");
            }
        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            // Kiểm tra đăng nhập 
            if (Session["User"] == null)
            {
                Response.Redirect("DangNhap.aspx");
                return;
            }

            // Lấy ID sản phẩm từ nút bấm
            Button btn = (Button)sender;
            int productId = int.Parse(btn.CommandArgument);
            if (productId == 0)
            {
                Response.Write("<script>alert('Lỗi: Không lấy được ID sản phẩm!');</script>");
                return;
            }
            // Lấy hoặc Khởi tạo giỏ hàng (List các món đồ)
            List<CartItem> cart = (List<CartItem>)Session["Cart"];
            if (cart == null)
            {
                cart = new List<CartItem>(); // Nếu chưa có giỏ thì tạo mới một cái giỏ trống
            }

            // Kiểm tra xem món này đã có trong giỏ chưa
            CartItem item = cart.Find(x => x.ProductID == productId);

            if (item != null)
            {
                //  số lượng lên 1
                item.Quantity++;
            }
            else
            {
                
                
                DataTable dt = GetData("SELECT TenSP, GiaTien, HinhAnh FROM SanPham WHERE MaSP = " + productId);
                if (dt.Rows.Count > 0)
                {
                    cart.Add(new CartItem
                    {
                        ProductID = productId,
                        ProductName = dt.Rows[0]["TenSP"].ToString(),
                        Price = double.Parse(dt.Rows[0]["GiaTien"].ToString()),
                        Quantity = 1,
                        ImageUrl = dt.Rows[0]["HinhAnh"].ToString()
                    });
                }
            }

            // 5. Cất cái giỏ đã cập nhật ngược lại vào Session
            Session["Cart"] = cart;

            // 6. Chuyển sang trang giỏ hàng để xem kết quả
            UpdateMiniCartCount();

            LayDuLieu();
        }
        private void UpdateMiniCartCount()
        {
            List<CartItem> cart = (List<CartItem>)Session["Cart"];
            if (cart != null)
            {
                // Tính tổng số lượng của TẤT CẢ sản phẩm
                int totalQuantity = cart.Sum(x => x.Quantity);
                lblCartCount.Text = totalQuantity.ToString();
            }
            else
            {
                lblCartCount.Text = "0";
            }
        }


        public DataTable GetData(string sql)
        {
            // Lấy chuỗi kết nối từ file Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["TraSuaDB"].ConnectionString;

            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }
            return dt;
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