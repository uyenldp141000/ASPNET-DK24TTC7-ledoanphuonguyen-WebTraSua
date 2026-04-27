# Báo cáo tiến độ - Tuần 3


## 1. Công việc đã thực hiện:
### A. Hệ thống giỏ hàng
- Hoàn thiện logic xử lý giỏ hàng trên trang `GioHang.aspx`.
- Thêm chức năng Mini Cart (Giỏ hàng thu nhỏ) tại trang chủ giúp khách hàng dễ dàng theo dõi số lượng.
- Xử lý lỗi hiển thị tổng tiền và đồng bộ dữ liệu giữa các trang.

### B. Hệ thống Tin tức & Ưu đãi
- Tạo bảng `TinTuc` trong SQL Server.
- Xây dựng Repeater để hiển thị danh sách tin tức tại trang chủ (`Default.aspx`).
- Thiết kế layout cho các khối sự kiện, tin tức.

### C. Mã giảm giá
- Thêm chức năng nhập mã `datnuoc` để nhận ưu đãi 30% cho tổng hóa đơn.
- Xử lý logic tính toán lại giá tiền sau khi áp dụng mã.

### D. Giao diện (UI/UX)
- Cập nhật logo nhận diện thương hiệu tại trang `Login.aspx` và trang chủ `Default.aspx`.
- Chỉnh sửa toàn bộ giao diện giỏ hàng sang tông màu hồng phấn (Pastel Pink) theo phong cách hiện đại.

## 2. Khó khăn đã giải quyết:
- Xử lý lỗi `CS1061` (chưa định nghĩa hàm sự kiện) khi thêm nút áp dụng mã giảm giá.
- Giải quyết vấn đề hiển thị ảnh tin tức bị trống bằng cách kiểm tra lại đường dẫn trong Database và bổ sung file vào thư mục `images`.


