create database ql_ban_dien_thoai;
use ql_ban_dien_thoai;

CREATE TABLE NguoiDung (
    id INT PRIMARY KEY IDENTITY(1,1),
    ho_ten NVARCHAR(100),
    email NVARCHAR(100) UNIQUE NOT NULL,
    mat_khau NVARCHAR(100) NOT NULL,
    loai_nguoi_dung NVARCHAR(20) CHECK (loai_nguoi_dung IN ('user', 'admin')) NOT NULL
);

CREATE TABLE HangDienThoai (
    id INT PRIMARY KEY IDENTITY(1,1),
    ten_hang NVARCHAR(100) NOT NULL
);

CREATE TABLE DienThoai (
    id INT PRIMARY KEY IDENTITY(1,1),
    ten_dien_thoai NVARCHAR(200) NOT NULL,
    hang_id INT FOREIGN KEY REFERENCES HangDienThoai(id),
    gia DECIMAL(18, 2) NOT NULL,
    mo_ta NVARCHAR(MAX),
    hinh_anh NVARCHAR(255)
);

CREATE TABLE GioHang (
    id INT PRIMARY KEY IDENTITY(1,1),
    nguoi_dung_id INT FOREIGN KEY REFERENCES NguoiDung(id),
    dien_thoai_id INT FOREIGN KEY REFERENCES DienThoai(id),
    so_luong INT NOT NULL CHECK (so_luong > 0)
);

CREATE TABLE DonHang (
    id INT PRIMARY KEY IDENTITY(1,1),
    nguoi_dung_id INT FOREIGN KEY REFERENCES NguoiDung(id),
    ngay_dat DATETIME DEFAULT GETDATE(),
    tong_tien DECIMAL(18, 2) NOT NULL
);

CREATE TABLE ChiTietDonHang (
    id INT PRIMARY KEY IDENTITY(1,1),
    don_hang_id INT FOREIGN KEY REFERENCES DonHang(id),
    dien_thoai_id INT FOREIGN KEY REFERENCES DienThoai(id),
    so_luong INT NOT NULL CHECK (so_luong > 0),
    gia_mua DECIMAL(18, 2) NOT NULL
);

INSERT INTO NguoiDung (ho_ten, email, mat_khau, loai_nguoi_dung) VALUES
(N'Nguyễn Văn A', 'a@gmail.com', '123456', 'user'),
(N'Lê Thị B', 'b@gmail.com', '123456', 'user'),
(N'Admin', 'admin@gmail.com', 'admin123', 'admin');

INSERT INTO HangDienThoai (ten_hang) VALUES
(N'Apple'),
(N'Samsung'),
(N'Xiaomi');

INSERT INTO DienThoai (ten_dien_thoai, hang_id, gia, mo_ta, hinh_anh) VALUES
(N'iPhone 14 Pro', 1, 28990000, N'Điện thoại cao cấp của Apple', N'iphone14.jpg'),
(N'Galaxy S23', 2, 24990000, N'Flagship của Samsung', N's23.jpg'),
(N'Xiaomi 13T', 3, 12990000, N'Giá tốt, hiệu năng cao', N'13t.jpg');

INSERT INTO GioHang (nguoi_dung_id, dien_thoai_id, so_luong) VALUES
(1, 1, 1),
(2, 3, 2),
(1, 2, 1);

INSERT INTO DonHang (nguoi_dung_id, tong_tien) VALUES
(1, 28990000),
(2, 25980000),
(1, 24990000);


INSERT INTO ChiTietDonHang (don_hang_id, dien_thoai_id, so_luong, gia_mua) VALUES
(1, 1, 1, 28990000),
(2, 3, 2, 12990000),
(3, 2, 1, 24990000);

-- 1. Người dùng
SELECT * FROM NguoiDung;

-- 2. Hãng điện thoại
SELECT * FROM HangDienThoai;

-- 3. Điện thoại
SELECT * FROM DienThoai;

-- 4. Giỏ hàng
SELECT * FROM GioHang;

-- 5. Đơn hàng
SELECT * FROM DonHang;

-- 6. Chi tiết đơn hàng
SELECT * FROM ChiTietDonHang;

