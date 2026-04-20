# 🌸 Website Bán Trà Sữa Pinky - ASP.NET

Dự án môn học: Phát triển ứng dụng Web.
Sinh viên thực hiện: [Lê Đoàn Phương Uyên]
MSSV: [Mã số sinh viên của bạn]

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

## 🛠 Công nghệ sử dụng
- **Frontend:** ASP.NET Web Forms, HTML/CSS.
- **Backend:** C# (.NET Framework).
- **Database:** SQL Server (sử dụng ADO.NET để kết nối và truy vấn).

## 📖 Hướng dẫn cài đặt và khởi chạy
1. **Database:** Chạy script tạo bảng `NguoiDung` và `DonHang` trong SQL Server. Đảm bảo bảng `NguoiDung` có các cột `NgayTao`, `LanDangNhapCuoi`.
2. **Cấu hình:** Mở file `Web.config`, cập nhật `connectionStrings` có tên `TraSuaDB` khớp với SQL Server Instance trên máy bạn.
3. **Build:** Mở solution trong Visual Studio, nhấn `Build -> Build Solution`.
4. **Run:** Chọn `Default.aspx` làm Start Page và nhấn `F5`.