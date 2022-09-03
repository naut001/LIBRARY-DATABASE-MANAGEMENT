CREATE DATABASE ThuVien
GO
USE ThuVien
GO
-- DROP DATABASE ThuVien
CREATE TABLE Sach 
(   
	MaSach NVARCHAR(50) NOT NULL,
    TenSach NVARCHAR(50) NOT NULL,
    TacGia NVARCHAR(50) NOT NULL,
	NamXB DATE ,
	NhaXB NVARCHAR (50) ,
	TheLoai NVARCHAR (50) NOT NULL,
	SoLuong INT NOT NULL,
	CONSTRAINT pk_MaSach PRIMARY KEY (MaSach)
);
--DROP TABLE Sach
CREATE TABLE Lop 
(
	MaLop NVARCHAR(50) NOT NULL,
	TenKhoa NVARCHAR(50) NOT NULL,
	TenLop NVARCHAR(50) NOT NULL,
	CONSTRAINT pk_MaLop PRIMARY KEY (MaLop),
);
--DROP TABLE Lop
CREATE TABLE SinhVien 
(
	MaSV NVARCHAR(50) NOT NULL,
	TenSV NVARCHAR(50) NOT NULL,
	NamSinh DATE NOT NULL,
	SDT int,
	MaLop NVARCHAR(50)NOT NULL,
	Tuoi int,
	CONSTRAINT pk_MaSV PRIMARY KEY (MaSV),
	CONSTRAINT fk_SinhVien_MaLop FOREIGN KEY (MaLop) REFERENCES Lop(MaLop) ON DELETE CASCADE ON UPDATE CASCADE
);
--DROP TABLE SinhVien
CREATE TABLE Phieu 
(
	MaPhieu NVARCHAR(50)NOT NULL,
	MaSV NVARCHAR (50) NOT NULL,
	MaSach NVARCHAR(50) NOT NULL,
	SoLuongMuon INT NOT NULL,
	NgayMuon DATE NOT NULL,
	NgayTra DATE NOT NULL,
	CONSTRAINT pk_MaPhieu PRIMARY KEY (MaPhieu),
	CONSTRAINT fk_Phieu_MaSV FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV) ON DELETE CASCADE ON UPDATE CASCADE ,
	CONSTRAINT fk_Phieu_MaSach FOREIGN KEY (MaSach) REFERENCES Sach(MaSach) ON DELETE CASCADE ON UPDATE CASCADE
);
--DROP TABLE Phieu

INSERT INTO Sach(MaSach, TenSach, TacGia, NamXB, NhaXB, TheLoai, SoLuong)
VALUES ('Mac1','Triet hoc 1','Dai hoc van hoa','2016','giao duc','Sach','50')
INSERT INTO Sach(MaSach, TenSach, TacGia, NamXB, NhaXB, TheLoai, SoLuong)
VALUES ('Mac2','Triet hoc 2','Dai hoc van hoa','2016','giao duc','Bao','40')
INSERT INTO Sach(MaSach, TenSach, TacGia, NamXB, NhaXB, TheLoai, SoLuong)
VALUES ('Mac3','Triet hoc 3','Dai hoc xa hoi','2017','van hoc','Tap chi','30')
INSERT INTO Sach(MaSach, TenSach, TacGia, NamXB, NhaXB, TheLoai, SoLuong)
VALUES ('c#','ngon ngu lap trinh c#','Dai hoc cong nghe','2017','ky thuat','Luan van','20')
INSERT INTO Sach(MaSach, TenSach, TacGia, NamXB, NhaXB, TheLoai, SoLuong)
VALUES ('logic','Logic hoc dai cuong','Dai hoc luat','2018','Tong hop','Sach','25')
INSERT INTO Sach(MaSach, TenSach, TacGia, NamXB, NhaXB, TheLoai, SoLuong)
VALUES ('pldc','phap luat dai cuong','Dai hoc luat TPHCM','2014','chinh tri','Bao','15')
INSERT INTO Sach(MaSach, TenSach, TacGia, NamXB, NhaXB, TheLoai, SoLuong)
VALUES ('ktmt','Kien truc May tinh','Dai hoc ky thuat','2000','ky thuat','Tap chi','10')
INSERT INTO Sach(MaSach, TenSach, TacGia, NamXB, NhaXB, TheLoai, SoLuong)
VALUES ('csdl','Co so du lieu','Dai hoc thong tin','2009','thong tin','Luan van','35')
INSERT INTO Sach(MaSach, TenSach, TacGia, NamXB, NhaXB, TheLoai, SoLuong)
VALUES ('mmt','Mang May tinh','Dai hoc Khoa hoc','2007','tu nhien','Sach','25')
INSERT INTO Sach(MaSach, TenSach, TacGia, NamXB, NhaXB, TheLoai, SoLuong)
VALUES ('tkw','thiet ke web','Dai hoc tu nhien','2016','Khoa hoc','Tap chi','15')
------Lop-----
INSERT INTO Lop(MaLop, TenKhoa, TenLop) VALUES ('qltt1','tvtth','quan ly thong tin A')
INSERT INTO Lop(MaLop, TenKhoa, TenLop) VALUES ('qltt2','tvtth','quan ly thong tin B')
INSERT INTO Lop(MaLop, TenKhoa, TenLop) VALUES ('tttv1','tvtth','thong tin thu vien A')
INSERT INTO Lop(MaLop, TenKhoa, TenLop) VALUES ('tttv2','tvtth','thong tin thu vien B')
INSERT INTO Lop(MaLop, TenKhoa, TenLop) VALUES ('nvp','nnp','ngu van phap')
INSERT INTO Lop(MaLop, TenKhoa, TenLop) VALUES ('nva','nna','ngu van Anh')
INSERT INTO Lop(MaLop, TenKhoa, TenLop) VALUES ('bc1','bctt','Bao chi truyen thong 1')
INSERT INTO Lop(MaLop, TenKhoa, TenLop) VALUES ('bc2','bctt','Bao chi truyen thong 2')
------SinhVien-----
INSERT INTO SinhVien(MaSV,TenSV,NamSinh,SDT,MaLop,Tuoi)
VALUES ('1956210100','Nguyen Minh Tuan','2001/02/17','0372591035','qltt1','19')
INSERT INTO SinhVien(MaSV,TenSV,NamSinh,SDT,MaLop,Tuoi)
VALUES ('1956210104','Tran Cao Hoang Than','2001/10/30','0965062716','qltt2','19')
INSERT INTO SinhVien(MaSV,TenSV,NamSinh,SDT,MaLop,Tuoi)
VALUES ('1956210120','Giang Quoc Dung','2001/01/11','0965062717','tttv1','19')
INSERT INTO SinhVien(MaSV,TenSV,NamSinh,SDT,MaLop,Tuoi)
VALUES ('1956210084','Phan Ba Nghi','2000/01/30','0965062718','tttv2','20')
INSERT INTO SinhVien(MaSV,TenSV,NamSinh,SDT,MaLop,Tuoi)
VALUES ('1956210102','Ta Thi Dieu Tham','2001/06/01','0914099822','bc1','19')
INSERT INTO SinhVien(MaSV,TenSV,NamSinh,SDT,MaLop,Tuoi)
VALUES ('1956210109','Pham Thu Trang','2001/12/06','0965062710','bc2','19')
INSERT INTO SinhVien(MaSV,TenSV,NamSinh,SDT,MaLop,Tuoi)
VALUES ('1956210052','Nguyen Ngoc Diu Diu','2001/05/02','0965062711','tttv2','19')
INSERT INTO SinhVien(MaSV,TenSV,NamSinh,SDT,MaLop,Tuoi)
VALUES ('1956210101','Nguoi La Vo Danh','2000/01/01','0965062712','nva','20')
INSERT INTO SinhVien(MaSV,TenSV,NamSinh,SDT,MaLop,Tuoi)
VALUES ('1956210001','Nguyen Tuan','1999/07/12','0965062713','qltt1','21')
INSERT INTO SinhVien(MaSV,TenSV,NamSinh,SDT,MaLop,Tuoi)
VALUES ('1956210999','Truong Hoang','2001/02/18','0965062714','qltt2','19')
------Phieu-----
INSERT INTO Phieu(MaPhieu, MaSV, MaSach,SoLuongMuon, NgayMuon, NgayTra)
VALUES ('112','1956210100','pldc','1','2018/12/27','2018/12/27')
INSERT INTO Phieu(MaPhieu, MaSV, MaSach,SoLuongMuon, NgayMuon, NgayTra)
VALUES ('212','1956210104','logic','2','2018/12/28','2018/12/30')
INSERT INTO Phieu(MaPhieu, MaSV, MaSach,SoLuongMuon, NgayMuon, NgayTra)
VALUES ('346','1956210120','ktmt','3','2018/12/26','2019/01/05')
INSERT INTO Phieu(MaPhieu, MaSV, MaSach,SoLuongMuon, NgayMuon, NgayTra)
VALUES ('412','1956210084','c#','1','2018/12/25','2019/01/06')
INSERT INTO Phieu(MaPhieu, MaSV, MaSach,SoLuongMuon, NgayMuon, NgayTra)
VALUES ('125','1956210052','csdl','4','2018/12/24','2019/01/07')
INSERT INTO Phieu(MaPhieu, MaSV, MaSach,SoLuongMuon, NgayMuon, NgayTra)
VALUES ('61','1956210102','Mac1','2','2018/12/22','2019/01/08')
INSERT INTO Phieu(MaPhieu, MaSV, MaSach,SoLuongMuon, NgayMuon, NgayTra)
VALUES ('71','1956210109','Mac2','1','2018/12/23','2019/01/09')
INSERT INTO Phieu(MaPhieu, MaSV, MaSach,SoLuongMuon, NgayMuon, NgayTra)
VALUES ('851','1956210101','Mac3','3','2018/12/21','2019/01/10')
INSERT INTO Phieu(MaPhieu, MaSV, MaSach,SoLuongMuon, NgayMuon, NgayTra)
VALUES ('912','1956210001','mmt','2','2018/12/20','2019/01/11')
INSERT INTO Phieu(MaPhieu, MaSV, MaSach,SoLuongMuon, NgayMuon, NgayTra)
VALUES ('180','1956210999','tkw','3','2018/12/27','2019/01/01')