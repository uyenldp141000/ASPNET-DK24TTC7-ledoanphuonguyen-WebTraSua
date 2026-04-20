CREATE TABLE [dbo].[NguoiDung] (
    [MaND]     INT            IDENTITY (1, 1) NOT NULL,
    [TenDN]    NVARCHAR (50)  NOT NULL,
    [MatKhau]  NVARCHAR (50)  NOT NULL,
    [Email]    NVARCHAR (100) NULL,
    [Quyen]    INT            DEFAULT 0 NOT NULL, -- 0: Member, 1: Admin
    PRIMARY KEY CLUSTERED ([MaND] ASC)
);

-- Thêm sẵn 1 tài khoản Admin mẫu
INSERT INTO [dbo].[NguoiDung] (TenDN, MatKhau, Quyen) VALUES ('admin', '123', 1);



-- Thêm cột thời gian vào bảng NguoiDung
ALTER TABLE NguoiDung ADD NgayTao DATETIME DEFAULT GETDATE();
ALTER TABLE NguoiDung ADD LanDangNhapCuoi DATETIME;

-- Bảng DonHang để thống kê (Mỗi user có nhiều đơn hàng)
CREATE TABLE DonHang (
    MaDH INT IDENTITY(1,1) PRIMARY KEY,
    MaND INT,
    NgayDat DATETIME DEFAULT GETDATE(),
    TongTien DECIMAL(18,2),
    FOREIGN KEY (MaND) REFERENCES NguoiDung(MaND) ON DELETE CASCADE
);

SELECT N.MaND, N.TenDN, N.NgayTao, N.LanDangNhapCuoi, 
       COUNT(D.MaDH) AS SoDon, 
       ISNULL(SUM(D.TongTien), 0) AS TongTien
FROM NguoiDung N
LEFT JOIN DonHang D ON N.MaND = D.MaND
GROUP BY N.MaND, N.TenDN, N.NgayTao, N.LanDangNhapCuoi