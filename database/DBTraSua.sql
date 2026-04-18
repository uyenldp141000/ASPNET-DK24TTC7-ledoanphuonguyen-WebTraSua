CREATE TABLE [dbo].[SanPham] (
    [MaSP]    INT            IDENTITY (1, 1) NOT NULL,
    [TenSP]   NVARCHAR (100) NOT NULL,
    [HinhAnh] NVARCHAR (200) NULL,
    [GiaTien] DECIMAL (18, 0) NULL,
    PRIMARY KEY CLUSTERED ([MaSP] ASC)
);