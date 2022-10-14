create database DVBM
use DVBM

create table TaiKhoan(
	TenDangNhap varchar(30) primary key not null,
	MatKhau varchar(30) not null,
	Quyen bit
)
go

--==========================
create table HanhKhach( 
	MaHanhKhach char(10) primary key,
	LoaiHanhKhach nvarchar(50),
	Ho nvarchar(50),
	Ten nvarchar(50),
	SDT char(10),
	Email nvarchar(50),
	NgaySinh date,
	DanhXung nvarchar(50),
	HanhLy float,
	CMND char(10),
	MaNguoiDung char(10)
)
go

create table NguoiDung( 
	MaNguoiDung char(10) primary key,
	HoTen nvarchar(50),
	SDT char(10),
	Email nvarchar(50),
	TenDangNhap varchar(30)
)
go
create table PhieuDatVe(
	MaPhieuDatVe char(10) primary key,
	MaNguoiDung char(10),
	NgayDat date
)

go
create table Ve(
	MaVe char(10) primary key,
	TenLoaiVe nvarchar(50),
	SoGhe int,
	KhoangGhe nvarchar(50),
	MaPhieuDatVe char(10),
	MaLoaiVe char(10),
	MaChuyenBay char(10),

)
go


create table ChuyenBay(
	MaChuyenBay char(10) primary key,
	TGbay time(5),
	NgayBay date,
	GioBay time(7),
	LoaiMayBay char(10),
	Gia decimal(18,0),
	SaleTreEm float,
	SaleEmBe float,
	MaChangBay char(10)
)
go 

create table ChangBay(
	MaChangBay char(10) primary key,
	SanBay_CatCanh char(10),
	SanBay_HaCanh char(10)
)
go


create table SanBay(
	MaSanBay char(10) primary key,
	TenSanBay nvarchar(50),
	ViTri nvarchar(50),
	KhuVuc nvarchar(50)
)



go
create table MayBay(
	LoaiMayBay char(10) primary key,
	TenMayBay nvarchar(50),
	HangMayBay nvarchar(50),
	KyHieuHang varchar(50)
)


go
create table HoaDon(
	MaHoaDon char(10) primary key,
	ThanhTien decimal(18,0),
	MaPhieuDatVe char(10),
	NgayXuatDon char(10),
	MaHinhThucTT char(10),
	MaKhuyenMai char(10)
)
go
create table XuatHoaDon(
	MaXuat char(10) primary key,
	NgayXuat date,
	NoiXuat nvarchar(50),
	MaHoaDon char(10)
	
)
go
create table HinhThucThanhToan(
	MaHinhThucTT char(10) primary key,
	TenHinhThucTT nvarchar(50)
)

go
create table NganHang(
	MaNganHang char(10) primary key,
	TenNganHang nvarchar(50),
	MaHinhThucTT char(10)
)

go 
create table KhuyenMai(
	MaKhuyenMai char(10) primary key,
	TenKhuyenMai nvarchar(50),
	PhanTramSale float,
	ThoiGianBD date,
	ThoiGianKT date

)
-- kết nối giữa các table, tạo khóa ngoại

ALTER TABLE NguoiDung ADD FOREIGN KEY (TenDangNhap) REFERENCES TaiKhoan(TenDangNhap);
ALTER TABLE HanhKhach ADD FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung);
ALTER TABLE PhieuDatVe ADD FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung);
ALTER TABLE Ve ADD FOREIGN KEY (MaChuyenBay) REFERENCES ChuyenBay(MaChuyenBay);
ALTER TABLE Ve ADD FOREIGN KEY (MaPhieuDatVe) REFERENCES PhieuDatVe(MaPhieuDatVe);
ALTER TABLE ChuyenBay ADD FOREIGN KEY (LoaiMayBay) REFERENCES MayBay(LoaiMayBay);--------
ALTER TABLE ChuyenBay ADD FOREIGN KEY (MaChangBay) REFERENCES ChangBay(MaChangBay);
ALTER TABLE ChangBay ADD FOREIGN KEY (SanBay_CatCanh) REFERENCES SanBay(MaSanBay);
ALTER TABLE ChangBay ADD FOREIGN KEY (SanBay_HaCanh) REFERENCES SanBay(MaSanBay);
ALTER TABLE HoaDon ADD FOREIGN KEY (MaPhieuDatVe) REFERENCES PhieuDatVe(MaPhieuDatVe);
ALTER TABLE XuatHoaDon ADD FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon);
ALTER TABLE HoaDon ADD FOREIGN KEY (MaKhuyenMai) REFERENCES KhuyenMai(MaKhuyenMai);
ALTER TABLE HoaDon ADD FOREIGN KEY (MaHinhThucTT) REFERENCES HinhThucThanhToan(MaHinhThucTT);
ALTER TABLE NganHang ADD FOREIGN KEY (MaHinhThucTT) REFERENCES HinhThucThanhToan(MaHinhThucTT);


-- insert data

BEGIN /** Chuyen Bay **/
	ALTER TABLE ChuyenBay
	NOCHECK CONSTRAINT ALL
	insert into ChuyenBay(MaChuyenBay, TGbay, NgayBay, GioBay, LoaiMayBay, Gia, SaleTreEm, SaleEmBe, MaChangBay)
		values('ChuB01', '03:30:00', '2022-10-26', '23:15:00', 'VJ124', 559000, 0.2, 0.1, 'ChaB01')
	insert into ChuyenBay(MaChuyenBay, TGbay, NgayBay, GioBay, LoaiMayBay, Gia, SaleTreEm, SaleEmBe, MaChangBay)
		values('ChuB02', '03:40:00', '2022-10-16', '02:15:00', 'VJ122', 559000, 0.2, 0.1, 'Cha02')
	insert into ChuyenBay(MaChuyenBay, TGbay, NgayBay, GioBay, LoaiMayBay, Gia, SaleTreEm, SaleEmBe, MaChangBay)
		values('ChuB03', '14:30:00', '2022-10-12', '15:15:00', 'VN4567', 457000, 0.2, 0.1, 'Cha03')
	insert into ChuyenBay(MaChuyenBay, TGbay, NgayBay, GioBay, LoaiMayBay, Gia, SaleTreEm, SaleEmBe, MaChangBay)
		values('ChuB04', '05:10:00', '2022-10-13', '08:15:00', 'VN4568', 457000, 0.2, 0.1, 'Cha04')
	insert into ChuyenBay(MaChuyenBay, TGbay, NgayBay, GioBay, LoaiMayBay, Gia, SaleTreEm, SaleEmBe, MaChangBay)
		values('ChuB05', '20:30:00', '2022-10-14', '08:50:00', 'VN4568', 457000, 0.2, 0.1, 'Cha05')
	ALTER TABLE ChuyenBay
	CHECK CONSTRAINT ALL
END
go

BEGIN /** maybay **/
	ALTER TABLE MayBay
	NOCHECK CONSTRAINT ALL
	insert into MayBay(LoaiMayBay, TenMayBay, HangMayBay, KyHieuHang)
		values('VJ124', 'VietJet 124', 'VietJet', 'VJ')
	insert into MayBay(LoaiMayBay, TenMayBay, HangMayBay, KyHieuHang)
		values('VJ122', 'VietJet 122', 'VietJet', 'VJ')
	insert into MayBay(LoaiMayBay, TenMayBay, HangMayBay, KyHieuHang)
		values('VN4567', 'Vietnam airlines - Pacific 4567', 'Vietnam airlines - Pacific', 'VN')
	insert into MayBay(LoaiMayBay, TenMayBay, HangMayBay, KyHieuHang)
		values('VN4568', 'Vietnam airlines - Pacific 4568', 'Vietnam airlines - Pacific', 'VN')
	insert into MayBay(LoaiMayBay, TenMayBay, HangMayBay, KyHieuHang)
		values('VN4569', 'Vietnam airlines - Pacific 4569', 'Vietnam airlines - Pacific', 'VN')
	ALTER TABLE maybay
	CHECK CONSTRAINT ALL
END
go


BEGIN /** ChangBay **/
	ALTER TABLE ChangBay
	NOCHECK CONSTRAINT ALL
	insert into ChangBay(MaChangBay, SanBay_HaCanh, SanBay_CatCanh)
		values('ChaB01', 'HAN',  'DAD')
	insert into ChangBay(MaChangBay, SanBay_HaCanh, SanBay_CatCanh)
		values('ChaB02', 'AKL',  'BMV')
	insert into ChangBay(MaChangBay, SanBay_HaCanh, SanBay_CatCanh)
		values('ChaB03', 'AKL',  'HAN')
	insert into ChangBay(MaChangBay, SanBay_HaCanh, SanBay_CatCanh)
		values('ChaB04', 'BMV',  'HPH')
	insert into ChangBay(MaChangBay, SanBay_HaCanh, SanBay_CatCanh)
		values('ChaB05', 'DLI',  'HAN')
	ALTER TABLE ChangBay
	CHECK CONSTRAINT ALL
END
go
BEGIN /** SanBay **/
	ALTER TABLE SanBay
	NOCHECK CONSTRAINT ALL
	insert into SanBay(MaSanBay, TenSanBay, ViTri, KhuVuc)
		values('HAN', N'Nội Bài',  N'Hà Nội - Việt Nam', N'Đông Nam Á')
	insert into SanBay(MaSanBay, TenSanBay, ViTri, KhuVuc)
		values('DAD', N'Đà Nẵng',  N'Đà Nẵng - Việt Nam', N'Việt Nam')
	insert into SanBay(MaSanBay, TenSanBay, ViTri, KhuVuc)
		values('BMV', N'Buôn Ma Thuột',  N'Đắk Lắk - Việt Nam', N'Việt Nam')
	insert into SanBay(MaSanBay, TenSanBay, ViTri, KhuVuc)
		values('DLI', N'Đà Lạt',  N'Lâm Đồng - Việt Nam', N'Việt Nam')
	insert into SanBay(MaSanBay, TenSanBay, ViTri, KhuVuc)
		values('HPH', N'Cát Bi',  N'Hải Phòng - Việt Nam', N'Việt Nam')
	insert into SanBay(MaSanBay, TenSanBay, ViTri, KhuVuc)
		values('AKL', N'Auckland',  N'Auckland - New Zealand', N'Châu Úc')
	ALTER TABLE SanBay
	CHECK CONSTRAINT ALL
END
go


BEGIN /** ve **/
	ALTER TABLE Ve
	NOCHECK CONSTRAINT ALL
	insert into Ve(MaVe, TenLoaiVe, SoGhe, KhoangGhe, MaPhieuDatVe, MaLoaiVe, MaChuyenBay)
		values('V01', N'Phổ Thông',  1, 'A', 'PDV01', 'LV01', 'ChuB01')
	insert into Ve(MaVe, TenLoaiVe, SoGhe, KhoangGhe, MaPhieuDatVe, MaLoaiVe, MaChuyenBay)
		values('V02', N'Phổ Thông',  5, 'B', 'PDV02', 'LV01', 'ChuB02')
	insert into Ve(MaVe, TenLoaiVe, SoGhe, KhoangGhe, MaPhieuDatVe, MaLoaiVe, MaChuyenBay)
		values('V03', N'Thương Gia',  1, 'A', 'PDV03', 'LV03', 'ChuB03')
	insert into Ve(MaVe, TenLoaiVe, SoGhe, KhoangGhe, MaPhieuDatVe, MaLoaiVe, MaChuyenBay)
		values('V04', N'Phổ Thông Đặc Biệt',  11, 'C', 'PDV04', 'LV02', 'ChuB04')
	insert into Ve(MaVe, TenLoaiVe, SoGhe, KhoangGhe, MaPhieuDatVe, MaLoaiVe, MaChuyenBay)
		values('V05', N'Thương Gia',  1, 'B', 'PDV05', 'LV03', 'ChuB05')
	ALTER TABLE Ve
	CHECK CONSTRAINT ALL
END
go



BEGIN /** HinhThucThanhToan **/
	ALTER TABLE HinhThucThanhToan
	NOCHECK CONSTRAINT ALL
	insert into HinhThucThanhToan(MaHinhThucTT, TenHinhThucTT)
		values('TD', N'Thẻ tín dụng')
	insert into HinhThucThanhToan(MaHinhThucTT, TenHinhThucTT)
		values('CKQT', N'Chuyển khoản quốc tế')
	insert into HinhThucThanhToan(MaHinhThucTT, TenHinhThucTT)
		values('ATM', N'Thẻ ATM nội địa')
	insert into HinhThucThanhToan(MaHinhThucTT, TenHinhThucTT)
		values('TT', N'Thanh toán trực tiếp')
	ALTER TABLE HinhThucThanhToan
	CHECK CONSTRAINT ALL
END
go


BEGIN /** Ngan Hang **/
	ALTER TABLE NganHang
	NOCHECK CONSTRAINT ALL
	insert into NganHang(MaNganHang,TenNganHang,MaHinhThucTT)
		values('VCB', N'Ngân hàng Vietcombank', 'ATM')
	insert into NganHang(MaNganHang,TenNganHang,MaHinhThucTT)
		values('TCB', N'Ngân hàng Techcombank', 'ATM')
	insert into NganHang(MaNganHang,TenNganHang,MaHinhThucTT)
		values('MB', N'Ngân hàng MBbank', 'ATM')
	insert into NganHang(MaNganHang,TenNganHang,MaHinhThucTT)
		values('TPB', N'Ngân hàng TPBank', 'ATM')
	insert into NganHang(MaNganHang,TenNganHang,MaHinhThucTT)
		values('STB', N'Ngân hàng Sacombank', 'ATM')
	ALTER TABLE NganHang
	CHECK CONSTRAINT ALL
END
go



BEGIN /** Hoa Don **/
	ALTER TABLE HoaDon
	NOCHECK CONSTRAINT ALL
	insert into HoaDon(MaHoaDon,ThanhTien,MaPhieuDatVe,NgayXuatDon,MaHinhThucTT,MaKhuyenMai)
		values('HD1', 5870000, 'PDV1', NULL,'ATM','KM1')
	insert into HoaDon(MaHoaDon,ThanhTien,MaPhieuDatVe,NgayXuatDon,MaHinhThucTT,MaKhuyenMai)
		values('HD2', 7490000, 'PDV2', NULL ,'ATM','KM2')
	insert into HoaDon(MaHoaDon,ThanhTien,MaPhieuDatVe,NgayXuatDon,MaHinhThucTT,MaKhuyenMai)
		values('HD3', 2400000, 'PDV3', NULL  ,'TT','KM3')
	insert into HoaDon(MaHoaDon,ThanhTien,MaPhieuDatVe,NgayXuatDon,MaHinhThucTT,MaKhuyenMai)
		values('HD4', 4800000, 'PDV4', NULL  ,'CKQT','KM4')
	insert into HoaDon(MaHoaDon,ThanhTien,MaPhieuDatVe,NgayXuatDon,MaHinhThucTT,MaKhuyenMai)
		values('HD5', 3600000, 'PDV5', NULL,'CKQT','KM5')
	ALTER TABLE HoaDon
	CHECK CONSTRAINT ALL
END
go


BEGIN /** Hoa Don **/
	ALTER TABLE XuatHoaDon
	NOCHECK CONSTRAINT ALL
	insert into XuatHoaDon(MaXuat,NgayXuat,NoiXuat,MaHoaDon)
		values('X1', NULL, N'Banana Airlines - Hoang Quoc Viet -Ha Noi','HD1')
	insert into XuatHoaDon(MaXuat,NgayXuat,NoiXuat,MaHoaDon)
		values('X2', NULL, N'Banana Airlines - Hoang Quoc Viet -Ha Noi','HD2')
	insert into XuatHoaDon(MaXuat,NgayXuat,NoiXuat,MaHoaDon)
		values('X3', NULL, N'Banana Airlines - Hoang Quoc Viet -Ha Noi','HD3')
	insert into XuatHoaDon(MaXuat,NgayXuat,NoiXuat,MaHoaDon)
		values('X4', NULL,N'Banana Airlines - Hoang Quoc Viet -Ha Noi','HD4')
	insert into XuatHoaDon(MaXuat,NgayXuat,NoiXuat,MaHoaDon)
		values('X5', NULL,N'Banana Airlines - Hoang Quoc Viet -Ha Noi','HD5')
	ALTER TABLE XuatHoaDon
	CHECK CONSTRAINT ALL
END
go



BEGIN /** Phieu dat ve **/
	ALTER TABLE PhieuDatVe
	NOCHECK CONSTRAINT ALL
	insert into PhieuDatVe(MaPhieuDatVe,MaNguoiDung,NgayDat)
		values('PDV1','ND1','2022-09-01')
	insert into PhieuDatVe(MaPhieuDatVe,MaNguoiDung,NgayDat)
		values('PDV2','ND2','2022-09-01')
	insert into PhieuDatVe(MaPhieuDatVe,MaNguoiDung,NgayDat)
		values('PDV3','ND3','2022-09-01')
	insert into PhieuDatVe(MaPhieuDatVe,MaNguoiDung,NgayDat)
		values('PDV4','ND4','2022-09-01')
	insert into PhieuDatVe(MaPhieuDatVe,MaNguoiDung,NgayDat)
		values('PDV5','ND5','2022-09-01')
	ALTER TABLE PhieuDatVe
	CHECK CONSTRAINT ALL
END
go

BEGIN /** KhuyenMai **/
	ALTER TABLE KhuyenMai
	NOCHECK CONSTRAINT ALL
	insert into KhuyenMai(MaKhuyenMai, TenKhuyenMai, PhanTramSale,ThoiGianBD,ThoiGianKT) values('KM1', N'Tặng ngàn dặm bay', 0.6, '2022-09-01','2022-10-01')
	insert into KhuyenMai(MaKhuyenMai, TenKhuyenMai, PhanTramSale,ThoiGianBD,ThoiGianKT) values('KM2', N'FridaySmiles', 0.2, '2022-10-01','2022-11-01')
	insert into KhuyenMai(MaKhuyenMai, TenKhuyenMai, PhanTramSale,ThoiGianBD,ThoiGianKT) values('KM3', N'Ra mắt Thẻ liên kết Sacombank', 0.25, '2021-09-01','2022-09-01')
	insert into KhuyenMai(MaKhuyenMai, TenKhuyenMai, PhanTramSale,ThoiGianBD,ThoiGianKT) values('KM4', N'Sở hữu ngay thẻ Titan', 0.15, '2022-06-01','2022-12-01')
	insert into KhuyenMai(MaKhuyenMai, TenKhuyenMai, PhanTramSale,ThoiGianBD,ThoiGianKT) values('KM5', N'Nghỉ dưỡng tại Fusion', 0.10, '2022-07-12','2022-10-23')
	insert into KhuyenMai(MaKhuyenMai, TenKhuyenMai, PhanTramSale,ThoiGianBD,ThoiGianKT) values('KM6', N'Nâng hạng thẻ Bông Sen Vàng', 0.3, '2022-01-10','2022-02-12')
	ALTER TABLE KhuyenMai
	CHECK CONSTRAINT ALL
END

BEGIN /** TaiKhoan **/
	ALTER TABLE TaiKhoan
	NOCHECK CONSTRAINT ALL
	insert into TaiKhoan(TenDangNhap,MatKhau,Quyen) values('anhyeuemko','bomaydeothich',1)
	insert into TaiKhoan(TenDangNhap,MatKhau,Quyen) values('anhquatema','noitothea',0)
	insert into TaiKhoan(TenDangNhap,MatKhau,Quyen) values('noitothea','embietngayma',0)
	insert into TaiKhoan(TenDangNhap,MatKhau,Quyen) values('khanhdeptrai','dungvay',0)
	insert into TaiKhoan(TenDangNhap,MatKhau,Quyen) values('khanhouttrinh','kosaiduoc',0)
	ALTER TABLE TaiKhoan
	CHECK CONSTRAINT ALL
END

BEGIN /** NguoiDung **/
	ALTER TABLE NguoiDung
	NOCHECK CONSTRAINT ALL
	insert into NguoiDung(MaNguoiDung,HoTen,SDT,Email,TenDangNhap) values('ND1',N'Tạ Khánh Đức','0987612412','ducancut@gmail.com','aquatema')
	insert into NguoiDung(MaNguoiDung,HoTen,SDT,Email,TenDangNhap) values('ND2',N'Phan Văn Duy','0979336552','duyancut@gmail.com','noitothea')
	insert into NguoiDung(MaNguoiDung,HoTen,SDT,Email,TenDangNhap) values('ND3',N'Lê Thị Ngọc Khang','0983632541','khangancut@gmail.com','khanhdeptrai')
	insert into NguoiDung(MaNguoiDung,HoTen,SDT,Email,TenDangNhap) values('ND4',N'Lê Quang Phương Phương','0946532174','phuongancut@gmail.com','khanhouttrinh') 
	ALTER TABLE NguoiDung
	CHECK CONSTRAINT ALL
END


BEGIN /** HanhKhach **/
	ALTER TABLE HanhKhach
	NOCHECK CONSTRAINT ALL
	insert into HanhKhach(MaHanhKhach,LoaiHanhKhach,Ho,Ten,SDT,Email,NgaySinh,DanhXung,HanhLy,CMND,MaNguoiDung)values('HK1',N'Người lớn',N'Hoàng Tuấn',N'Anh','0987654321','lk1@gmail.com','2002-09-01',N'Ông','20','184403440','ND1')
	insert into HanhKhach(MaHanhKhach,LoaiHanhKhach,Ho,Ten,SDT,Email,NgaySinh,DanhXung,HanhLy,CMND,MaNguoiDung)values('HK2',N'Người lớn',N'Trịnh Thi',N'Thanh','0987654322','lk2@gmail.com','2002-09-01',N'Bà','10','184403441','ND1')
	insert into HanhKhach(MaHanhKhach,LoaiHanhKhach,Ho,Ten,SDT,Email,NgaySinh,DanhXung,HanhLy,CMND,MaNguoiDung)values('HK3',N'Trẻ em',N'Lê Phúc',N'Hưng',null,null,'2022-09-01',N'Cháu','02',null,'ND1')
	insert into HanhKhach(MaHanhKhach,LoaiHanhKhach,Ho,Ten,SDT,Email,NgaySinh,DanhXung,HanhLy,CMND,MaNguoiDung)values('HK4',N'Em bé',N'Nguyễn Việt','Đức',null,null,'2022-09-01',N'Cháu','00',null,'ND1')
	insert into HanhKhach(MaHanhKhach,LoaiHanhKhach,Ho,Ten,SDT,Email,NgaySinh,DanhXung,HanhLy,CMND,MaNguoiDung)values('HK5',N'Người lớn',N'Nguyễn Xuân',N'Đức','0987654321','lk5@gmail.com','2002-09-01',N'Anh','00','184403445','ND2')
	insert into HanhKhach(MaHanhKhach,LoaiHanhKhach,Ho,Ten,SDT,Email,NgaySinh,DanhXung,HanhLy,CMND,MaNguoiDung)values('HK6',N'Trẻ em',N'Trần Văn',N'Tới',null,null,'2022-09-01',N'Cháu','03',null,'ND2')
	insert into HanhKhach(MaHanhKhach,LoaiHanhKhach,Ho,Ten,SDT,Email,NgaySinh,DanhXung,HanhLy,CMND,MaNguoiDung)values('HK7',N'Trẻ em',N'Vũ Thị',N'Anh Đức',null,null,'2022-09-01',N'Cháu','02',null,'ND2')
	insert into HanhKhach(MaHanhKhach,LoaiHanhKhach,Ho,Ten,SDT,Email,NgaySinh,DanhXung,HanhLy,CMND,MaNguoiDung)values('HK8',N'Người lớn',N'Hồ Ngọc',N'Hà','0987654321','lk8@gmail.com','2022-09-01',N'Cô','10','184403448','ND3')
	insert into HanhKhach(MaHanhKhach,LoaiHanhKhach,Ho,Ten,SDT,Email,NgaySinh,DanhXung,HanhLy,CMND,MaNguoiDung)values('HK9',N'Em bé',N'Phạm Thị',N'Triều',null,null,'2022-09-01',N'Cháu','00',null,'ND3')
	insert into HanhKhach(MaHanhKhach,LoaiHanhKhach,Ho,Ten,SDT,Email,NgaySinh,DanhXung,HanhLy,CMND,MaNguoiDung)values('HK10',N'Người lớn',N'Lê Quang',N'Phương Phương','0946532174','phuongancut@gmail.com','2022-09-01',N'Ông','30','184403450','ND4')
	ALTER TABLE HanhKhach
	CHECK CONSTRAINT ALL
END