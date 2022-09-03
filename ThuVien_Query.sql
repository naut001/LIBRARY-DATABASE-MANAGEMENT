	
	
			---------------THU VIEN---------------
	
	----- Q1: Liệt kê thông tin sinh viên có họ là Nguyễn -----
		SELECT * 
		FROM SinhVien
		WHERE TenSV like 'Nguyen%'

	----- Q2: Liệt kê sinh viên có ngày sinh nhật vào tháng 1 -----
		SELECT * 
		FROM SinhVien
		WHERE month(NamSinh) = 1

	----- Q3: Liệt kê sinh viên có tuổi lớn nhất ------
		SELECT * 
		FROM SinhVien
		WHERE Tuoi >= all 
						(
							SELECT Tuoi 
							FROM SinhVien
						)

	----- Q4: Liệt kê sinh viên thuộc lớp TTTV2 và sinh năm 2000------
		SELECT *
		FROM SinhVien
		WHERE MaLop = 'tttv2' AND year(NamSinh) = '2000'

	----- Q5: Sinh viên có 3 số cuối của MaSV > 100 ------
		SELECT *
		FROM SinhVien
		WHERE MaSV > 1956210100

	----- Q6: Tìm sách có số lượng ít nhất -----
		SELECT *
		FROM Sach 
		WHERE SoLuong <= all
							(
								select SoLuong
								from Sach
							)

	----- Q7: Tìm sách có năm xuất bản từ 2016 đến nay -----
		select *
		from Sach
		where NamXB >= '2016'
		--order by NamXB desc

	----- Q8: Tìm sách có tác giả là Đại học văn hóa và thể loại báo ------
		select *
		from Sach
		where TacGia = 'dai hoc van hoa' and TheLoai = 'bao' 

	----- Q9: Tìm sách có số lượng 15 và thuộc Nhà xuất bản khoa học------
		select *
		from Sach 
		where SoLuong = '15' and NhaXB = 'khoa hoc'

	----- Q10: Tìm sách được xuất bản sớm nhất ------
		select *
		from Sach
		where NamXB <= all
						(
							select NamXB
							from Sach
						)

	----- Q11: Tìm sách có thể loại luận văn và xuất bản năm 2017 -----
		select *
		from Sach 
		where TheLoai = 'luan van' and year(NamXB) = '2017'

	----- Q12: Tìm Masach có ngày trả trong tháng 12 ------
		select MaSach
		from Phieu
		where month(NgayTra) = 12

	----- Q13: Liệt kê các phiếu có Mã Phiếu từ 50 đến 100 ------
		select *
		from Phieu
		where MaPhieu >= 50 and MaPhieu <= 100

	----- Q14: Tìm Mã SV có số lượng mượn nhiều nhất ------
		select MaSV
		from Phieu
		where SoLuongMuon >= all	
								(
									select SoLuongMuon
									from Phieu
								)

	----- Q15: Tìm phiếu có 3 số cuối của MaSV > 100 và có số lượng mượn là 3 ------
		select *
		from Phieu 
		where MaSV > 1956210100 and SoLuongMuon = 3
		
	----- Q16: Tìm Tên sv có mã sách là mmt -----
		select TenSV
		from SinhVien, Phieu
		where SinhVien.MaSV=Phieu.MaSV and MaSach='mmt'

	----- Q17: Tìm mã phiếu của sinh viên có độ tuổi là 20 -----
		select MaPhieu
		from SinhVien, Phieu
		where SinhVien.MaSV=Phieu.MaSV and Tuoi=20

	----- Q18: Tìm mã lớp có sinh viên mượn sách thuộc thể loại luận văn -----
		select MaLop
		from SinhVien,Sach,Phieu
		where Phieu.MaSach=Sach.MaSach and SinhVien.MaSV=Phieu.MaSV and TheLoai = 'luan van'

	----- Q19: Tìm mã phiếu có sách được xuất bản bởi nhà xb Tổng hợp -----
		select MaPhieu
		from Phieu, Sach
		where Phieu.MaSach=Sach.MaSach and NhaXB='tong hop'

	----- Q20: Tìm sách mà bạn Dũng mượn -----
		select TenSach
		from Sach, Phieu, SinhVien
		where Phieu.MaSach=Sach.MaSach and SinhVien.MaSV=Phieu.MaSV and TenSV like '%Dung'

	----- Q21: Tìm sách thuộc thể loại báo và mã phiếu là 112 -----
		select TenSach
		from Sach, Phieu
		where Phieu.MaSach=Sach.MaSach and TheLoai = 'bao' and MaPhieu = 112

	----- Q22: Tìm nhà xb của sách mà sv 1956210100 mượn -----
		select NhaXB
		from Sach, Phieu
		where Phieu.MaSach=Sach.MaSach  and MaSV = '1956210100'

	----- Q23: Tìm tên lớp của sv có ngày sinh là 17/2/2001 -----
		select TenLop
		from Lop, SinhVien
		where Lop.MaLop=SinhVien.MaLop and NamSinh = '2001-02-17'

	----- Q24: Tìm sinh viên mượn mác 3 -----
		select TenSV
		from SinhVien, Phieu, Sach
		where Phieu.MaSach=Sach.MaSach and SinhVien.MaSV=Phieu.MaSV and TenSach = 'Triet hoc 3'

	----- Q25: Tìm lớp có sinh viên mượn nhiều sách nhất -----
		select TenLop
		from Lop, SinhVien, Phieu
		where Lop.MaLop=SinhVien.MaLop and SinhVien.MaSV=Phieu.MaSV and SoLuongMuon >= all 
																						(
																							select SoLuongMuon
																							from Phieu
																						)