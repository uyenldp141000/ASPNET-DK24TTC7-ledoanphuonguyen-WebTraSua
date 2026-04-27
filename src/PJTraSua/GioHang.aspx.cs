using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PJTraSua
{
    public partial class GioHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }

        protected void gvGioHang_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // 1. Lấy ID sản phẩm từ CommandArgument
            int productId = Convert.ToInt32(e.CommandArgument);

            // 2. Lấy danh sách giỏ hàng hiện tại từ Session
            List<CartItem> cart = (List<CartItem>)Session["Cart"];

            // 3. Kiểm tra xem lệnh được gọi là gì
            if (e.CommandName == "Tang")
            {
                var item = cart.Find(x => x.ProductID == productId);
                if (item != null) item.Quantity++;
            }
            else if (e.CommandName == "Giam")
            {
                var item = cart.Find(x => x.ProductID == productId);
                if (item != null && item.Quantity > 1) item.Quantity--;
            }
            else if (e.CommandName == "XoaSP")
            {
                cart.RemoveAll(x => x.ProductID == productId);
            }

            // 4. Lưu lại vào Session và nạp lại dữ liệu cho GridView
            Session["Cart"] = cart;
            BindCart(); // Hàm này dùng để nạp lại dữ liệu lên GridView và tính tổng tiền
        }

        private void BindCart()
        {
            // 1. Lấy giỏ hàng từ Session
            List<CartItem> cart = (List<CartItem>)Session["Cart"];

            // 2. Kiểm tra nếu giỏ hàng có dữ liệu thì mới hiển thị
            if (cart != null && cart.Count > 0)
            {
                gvGioHang.DataSource = cart; // Gán dữ liệu cho bảng
                gvGioHang.DataBind();        // "Đổ" dữ liệu vào bảng (cực kỳ quan trọng)

                // 3. Tính tổng tiền
                double tongTien = cart.Sum(x => x.Total);
                if (Session["Discount"] != null)
                {
                    double discount = Convert.ToDouble(Session["Discount"]);
                    double giaSauGiam = tongTien * (1 - discount);
                    lblTongTien.Text = giaSauGiam.ToString("N0"); // Hiển thị giá đã giảm
                }
                else
                {
                    lblTongTien.Text = tongTien.ToString("N0"); // Hiển thị giá gốc
                }
            }
            else
            {
                lblTongTien.Text = "0";
            }
        }
        // Hàm xử lý khi nhấn nút "Xác nhận đặt hàng"
        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            List<CartItem> cart = (List<CartItem>)Session["Cart"];

            if (cart == null || cart.Count == 0)
            {
                Response.Write("<script>alert('Giỏ hàng của bạn đang trống!');</script>");
                return;
            }

            // Gợi ý logic lưu vào Database (Bạn cần điều chỉnh theo bảng DonHang của bạn)
            try
            {
                // 1. Kết nối SQL và chèn vào bảng DonHang (Mã khách hàng, Ngày đặt, Tổng tiền...)
                // 2. Chèn từng món trong 'cart' vào bảng ChiTietDonHang

                // Sau khi lưu xong thì xóa giỏ hàng
                Session["Cart"] = null;
                Response.Write("<script>alert('Đặt hàng thành công!'); window.location='Default.aspx';</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Có lỗi xảy ra khi đặt hàng!');</script>");
            }
        }

        // Hàm xử lý khi nhấn nút "Hủy giỏ hàng"
        protected void btnHuy_Click(object sender, EventArgs e)
        {
            // Xóa toàn bộ giỏ hàng trong Session
            Session["Cart"] = null;

            // Nạp lại trang để thấy giỏ hàng trống
            Response.Redirect("GioHang.aspx");
        }

        protected void btnApplyCoupon_Click(object sender, EventArgs e)
        {
            if (txtCoupon.Text.Trim() == "datnuoc")
            {
                Session["Discount"] = 0.3; // Lưu tỷ lệ giảm
                lblMessage.Text = "Áp dụng thành công! Bạn được giảm 30%.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Session["Discount"] = null; // Xóa nếu mã sai
                lblMessage.Text = "Mã giảm giá không hợp lệ!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }

            // GỌI LẠI HÀM NÀY ĐỂ CẬP NHẬT TỔNG TIỀN VÀ BẢNG
            BindCart();
        }


    }
}