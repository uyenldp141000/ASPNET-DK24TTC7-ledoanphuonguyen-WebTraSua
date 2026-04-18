# ASPNET-DK24TTC7-ledoanphuonguyen-WebTraSua
Đồ án tốt nghiệp môn ASP web bán trà sữa

# TraSuaShop ASP.NET Web Forms

## Thông tin sinh viên
- Họ tên: Lê Đoàn Phương Uyên
- Lớp: DK24TTC7
- Môn học: ASP.NET
- Đề tài: Website Trà Sữa
- Giảng viên hướng dẫn: TS. Đoàn Phước Miền

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