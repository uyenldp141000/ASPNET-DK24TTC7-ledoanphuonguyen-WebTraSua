# 📅 Báo Cáo Tiến Độ - Tuần 1

**Dự án:** Website Bán Trà Sữa Pinky
**Người thực hiện:** [Lê Đoàn Phương Uyên]
**Thời gian:** 09/04/2026 - 16/04/2026

## ✅ Các công việc đã hoàn thành
1. **Khởi tạo dự án:**
   - Tạo Project ASP.NET Web Forms trong Visual Studio.
   - Thiết lập cấu trúc thư mục chuẩn (`App_Data`, `Images`).
2. **Thiết kế Cơ sở dữ liệu:**
   - Tạo Database `TraSuaDB.mdf`.
   - Thiết kế bảng `SanPham` với các trường: `MaSP`, `TenSP`, `HinhAnh`, `GiaTien`.
   - Nhập dữ liệu mẫu cho danh mục trà sữa.
3. **Kết nối và Hiển thị:**
   - Cấu hình chuỗi kết nối (ConnectionString) trong `Web.config`.
   - Viết code C# (ADO.NET) để lấy dữ liệu từ SQL Server.
   - Sử dụng `asp:DataList` để hiển thị danh sách sản phẩm lên trang `Default.aspx`.
4. **Xử lý lỗi (Debug):**
   - Khắc phục lỗi kết nối cơ sở dữ liệu.
   - Sửa lỗi hiển thị hình ảnh và đường dẫn tài nguyên.
   - Xử lý lỗi kiểu dữ liệu (Data Type) khi truy vấn SQL.

## 📸 Kết quả đạt được
- Giao diện trang chủ đã hiển thị danh sách trà sữa dưới dạng lưới.
- Dữ liệu được đổ động từ Database lên Web.
- Hình ảnh hiển thị đúng theo tên file được lưu trong DB.

## 🚩 Khó khăn gặp phải
- Gặp lỗi xung đột khi tạo bảng (Object already exists) nhưng đã xử lý bằng cách xóa và tạo lại Database sạch.
- Lỗi hiển thị hình ảnh do sai đường dẫn thư mục ảo `~`.

## ⏭️ Kế hoạch tuần 2
- Thiết kế giao diện trang Đăng nhập / Đăng ký.
- Xây dựng chức năng xác thực người dùng.