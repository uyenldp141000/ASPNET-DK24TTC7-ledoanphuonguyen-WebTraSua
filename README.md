# 🌸 Website Bán Trà Sữa Pinky - ASP.NET

Dự án môn học: Phát triển ứng dụng Web.
Sinh viên thực hiện: [Lê Đoàn Phương Uyên]
MSSV: [170124726]

## 📝 Giới thiệu dự án
Website được thiết kế dành cho tiệm trà sữa Pinky, cho phép người dùng xem menu sản phẩm, xem chi tiết và thực hiện đặt hàng trực tuyến. Dự án sử dụng công nghệ ASP.NET Web Forms, ngôn ngữ C# và cơ sở dữ liệu SQL Server.

## 🛠 Công nghệ sử dụng
- **Ngôn ngữ:** C#
- **Framework:** ASP.NET Web Forms (.NET Framework)
- **Cơ sở dữ liệu:** SQL Server (LocalDB)
- **Giao diện:** HTML5, CSS3, ASP.NET Controls

## 🚀 Hướng dẫn cài đặt và chạy dự án
1. **Mở dự án:** Mở file `.sln` bằng Visual Studio (phiên bản 2019 trở lên).
2. **Cấu hình Database:** - Đảm bảo file `TraSuaDB.mdf` nằm trong thư mục `App_Data`.
   - Kiểm tra chuỗi kết nối trong `Web.config` khớp với cấu hình máy cá nhân.
3. **Hình ảnh:** Các file ảnh sản phẩm phải được đặt trong thư mục `/Images/`.
4. **Chạy dự án:** Nhấn `F5` hoặc nút `Start` trên Visual Studio để chạy trên trình duyệt.

## 📂 Cấu trúc thư mục quan trọng
- `/App_Data`: Chứa file cơ sở dữ liệu `.mdf`.
- `/Images`: Chứa ảnh các món trà sữa.
- `Default.aspx`: Trang chủ hiển thị danh sách sản phẩm.
- `Web.config`: File cấu hình hệ thống và chuỗi kết nối.

## Tuần 2

# Pinky Tea Store - Hệ thống Quản lý Bán Trà Sữa (v2)

Dự án này là một ứng dụng Web Forms ASP.NET được thiết kế để quản lý cửa hàng trà sữa trực tuyến với giao diện màu hồng đặc trưng.

## 🚀 Các tính năng đã hoàn thiện
- **Hệ thống xác thực người dùng:**
    - Chức năng Đăng ký tài khoản với cơ chế chống trùng lặp Tên đăng nhập.
    - Chức năng Đăng nhập/Đăng xuất linh hoạt.
    - Thanh điều hướng (Header) thông minh: Tự động ẩn/hiện các nút chức năng dựa trên trạng thái đăng nhập (Session).
- **Trang Quản trị (Admin Dashboard):**
    - Quản lý sản phẩm (CRUD).
    - **Quản lý người dùng nâng cao:**
        - Xem danh sách toàn bộ khách hàng.
        - Thống kê tự động: Ngày tạo tài khoản, lần đăng nhập cuối, tổng số đơn hàng đã đặt và tổng chi tiêu.
        - Chức năng xóa người dùng trực tiếp khỏi hệ thống (có xác nhận trước khi xóa).
- **Giao diện:** Thiết kế theo tông màu Pinky (#ffe4e1) đồng nhất trên toàn hệ thống.
## Các tính năng được thêm
- **Đăng nhập/Đăng ký:** Hệ thống phân quyền Member/Admin.
- **Liên hệ:** Xem thông tin liên hệ của cửa hàng (Dữ liệu động từ SQL).
- **Phản ánh:** Gửi ý kiến đóng góp (Chỉ dành cho tài khoản đã đăng nhập).
- **Quản trị:** Admin có quyền cập nhật thông tin liên hệ và quản lý phản hồi.

## 🛠 Công nghệ sử dụng
- **Frontend:** ASP.NET Web Forms, HTML/CSS, (Flexbox), ASP.NET Controls.
- **Backend:** C# (.NET Framework).
- **Database:** SQL Server (sử dụng ADO.NET để kết nối và truy vấn).

## 📖 Hướng dẫn cài đặt và khởi chạy
1. **Database:** Chạy script tạo bảng `NguoiDung` và `DonHang` trong SQL Server. Đảm bảo bảng `NguoiDung` có các cột `NgayTao`, `LanDangNhapCuoi`.
2. **Cấu hình:** Mở file `Web.config`, cập nhật `connectionStrings` có tên `TraSuaDB` khớp với SQL Server Instance trên máy bạn.
3. **Build:** Mở solution trong Visual Studio, nhấn `Build -> Build Solution`.
4. **Run:** Chọn `Default.aspx` làm Start Page và nhấn `F5`.

## Tuần 3 Tạo giỏ hàng và các tính năng mới

## Các tính năng đã hoàn thiện:
- [x] **Giỏ hàng:** Thêm/giảm số lượng, xóa sản phẩm, tính tổng tiền tự động.
- [x] **Mini Cart:** Giỏ hàng thu nhỏ ở trang chủ hiển thị số lượng sản phẩm.
- [x] **Tin tức & Sự kiện:** Hệ thống hiển thị bài viết mới nhất từ Database.
- [x] **Ưu đãi & Khuyến mãi:** Áp dụng mã giảm giá (Mã mặc định: `datnuoc`).
- [x] **Giao diện:** Thiết kế tông màu hồng phấn (Pastel Pink) chủ đạo.
- [x] **Nhận diện thương hiệu:** Cập nhật logo tại trang Đăng nhập và Trang chủ.

## Lịch sử lỗi đã khắc phục (Troubleshooting):
Trong quá trình triển khai các tính năng mới, nhóm đã ghi nhận và giải quyết các lỗi sau:

1. **Lỗi `CS1061` (Thiếu định nghĩa sự kiện):**
   - **Mô tả:** Phát sinh khi thêm nút "Áp dụng" mã giảm giá do hàm sự kiện chưa được khai báo trong file code-behind (`.cs`).
   - **Khắc phục:** Định nghĩa lại hàm `btnApplyCoupon_Click` trong `GioHang.aspx.cs` và đảm bảo tên hàm khớp 100% với thuộc tính `OnClick` ở giao diện.

2. **Lỗi hiển thị hình ảnh tin tức:**
   - **Mô tả:** Khung ảnh hiển thị trống (dấu X đỏ) dù cấu trúc Repeater đã đúng.
   - **Khắc phục:** Cập nhật lại đường dẫn file ảnh trong Database `TinTuc` và sử dụng `ResolveUrl("~/" + ...)` để đảm bảo đường dẫn ảnh luôn chính xác bất kể vị trí trang.

3. **Lỗi tính toán tổng tiền (Giá trị bằng 0 hoặc không cập nhật):**
   - **Mô tả:** Tổng tiền không thay đổi khi áp dụng mã giảm giá hoặc sau khi thay đổi số lượng sản phẩm.
   - **Khắc phục:** Tách biệt logic tính toán vào hàm `BindCart()` và sử dụng `Session["Discount"]` để lưu trạng thái giảm giá, đảm bảo hàm này luôn được gọi lại sau mỗi thao tác cập nhật giỏ hàng.

4. **Lỗi cú pháp SQL (`SQL80001`):**
   - **Mô tả:** Gặp lỗi khi thực thi câu lệnh SQL do sai lệch tên cột hoặc thiếu giá trị trong mệnh đề `WHERE`.
   - **Khắc phục:** Kiểm tra lại schema của bảng `SanPham` và `TinTuc`, đảm bảo các cột `DonGia`, `MaSP` được truy vấn đúng tên trong câu lệnh SELECT/UPDATE.

## Công nghệ sử dụng:
- Ngôn ngữ: ASP.NET (C#)
- Database: SQL Server (TraSuaDB)
- Frontend: HTML5, CSS3

## 📖 Hướng dẫn cài đặt và khởi chạy
1. **Database:** Chạy script tạo bảng `NguoiDung` và `DonHang` trong SQL Server. Đảm bảo bảng `NguoiDung` có các cột `NgayTao`, `LanDangNhapCuoi`.
2. **Cấu hình:** Mở file `Web.config`, cập nhật `connectionStrings` có tên `TraSuaDB` khớp với SQL Server Instance trên máy bạn.
3. **Build:** Mở solution trong Visual Studio, nhấn `Build -> Build Solution`.
4. **Run:** Chọn `Default.aspx` làm Start Page và nhấn `F5`.