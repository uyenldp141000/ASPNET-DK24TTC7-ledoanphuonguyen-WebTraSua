# Báo cáo Tiến độ Tuần 2 - Pinky Tea Store (Chi tiết)

## 1. Các hạng mục đã hoàn thành
- **Giao diện Header:** Tối ưu hóa logic hiển thị nút Đăng nhập/Đăng ký khi khách chưa login và hiện Tên người dùng/Đăng xuất khi đã login.
- **Xử lý Tài khoản:**
    - Xây dựng thành công trang `DangKy.aspx`.
    - Thêm cơ chế kiểm tra `COUNT(*)` để ngăn chặn việc người dùng đăng ký tên trùng với tài khoản đã có.
    - Thiết lập chuyển hướng tự động về trang Đăng nhập sau khi đăng ký thành công.
- **Quản trị User:**
    - Tạo trang `QuanLyUser.aspx` với GridView.
    - Viết truy vấn SQL phức tạp sử dụng `LEFT JOIN` và `GROUP BY` để lấy dữ liệu thống kê đơn hàng từ bảng `DonHang` sang bảng `NguoiDung`.
    - Giao diện Admin được tùy chỉnh CSS sang màu hồng phấn, có nút quay lại trang chủ Admin.
- **Liên hệ và Phản Ánh
    - Tạo trang liên hệ hiển thị thông tin Hotline và Email. Dữ liệu được quản lý tập trung trong SQL Server, cho phép Admin cập nhật mà không cần can thiệp code
    - Trang Phản ánh Form thu thập ý kiến người dùng (Họ tên, SĐT, Nội dung).
    - Cơ chế bảo mật sử dụng Session["User"] để xác thực người dùng. Nếu chưa đăng nhập, hệ thống sẽ từ chối truy cập và chuyển hướng về trang Đăng nhập.
## 2. Nhật ký Lỗi và Giải quyết (Troubleshooting)

| STT | Lỗi gặp phải | Nguyên nhân | Cách khắc phục |
|:---:|:---|:---|:---|
| 1 | **CS1061**: definition missing | Khai báo `OnClick` trong .aspx nhưng chưa có hàm tương ứng trong .cs. | Bổ sung các hàm `btn_Click` vào file code-behind (.aspx.cs). |
| 2 | **DataBinding Error**: 'SoDon' not found | GridView yêu cầu cột `SoDon` nhưng lệnh SQL chỉ lấy các cột cơ bản của bảng User. | Cập nhật SQL: `COUNT(D.MaDH) AS SoDon` và sử dụng `LEFT JOIN`. |
| 3 | **Trùng lặp dữ liệu** | Chưa có logic kiểm tra tên tài khoản trước khi thực hiện lệnh INSERT. | Thêm lệnh `SELECT COUNT` kiểm tra sự tồn tại của `TenDN` trước khi Insert. |
| 4 | **Trang trắng/Không hiện bảng** | Quên gọi hàm `LoadData()` trong `Page_Load` hoặc Database chưa có dữ liệu mẫu. | Gọi `LoadData()` bên trong `if(!IsPostBack)` và thêm dữ liệu mẫu vào SQL. |
| 5 | **Lỗi SQL Query** | Sử dụng hàm SUM/COUNT mà không có mệnh đề `GROUP BY` cho các cột không tính toán. | Bổ sung `GROUP BY` cho tất cả các cột như MaND, TenDN, NgayTao... |

## 3. Kế hoạch tiếp theo
- Thiết kế bảng `SanPham` chi tiết hơn.
- Xây dựng chức năng "Thêm vào giỏ hàng" bằng Session.
- Làm trang Chi tiết sản phẩm.