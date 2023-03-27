use master
Go

Create database QuanLyXe
Go
use QuanLyXe
Go

create table ADMIN
(
	MaAdmin INT IDENTITY(1,1),
	HoTen NVARCHAR(50),
	DiaChi NVARCHAR(50),
	DienThoai VARCHAR(10),
	TenDN VARCHAR(15),
	MatKhau VARCHAR(15),	
	Email VARCHAR(50),
	Quyen Int Default 1,
	CONSTRAINT PK_AM PRIMARY KEY(MaAdmin)
)
Go

create table Xe
(
	MaXe int IDENTITY(1,1) primary key,
	LoaiXe varchar(30),
	TenXe varchar(100),
	GiaXe money CHECK (GiaXe>=0),
	AnhBia varchar(50),
	MoTa ntext,
	NgayCapNhat smalldatetime,
	MaClass int	
)
Go

create table Class
(
	MaClass int IDENTITY(1,1) primary key,
	TenClass nvarchar(50)
)
Go

create table KhachHang
(
	MaKH int IDENTITY(1,1)  primary key,
	HoTen nvarchar(50) not null,
	TaiKhoan VARCHAR(15) UNIQUE,
	MatKhau VARCHAR(15) NOT NULL,
	email varchar(50) UNIQUE ,
	DienThoai varChar(20) ,
	DiaChi ntext,	
)
Go

CREATE TABLE DonDatHang
(
	MaDonHang INT IDENTITY(1,1) primary key,
	MaKH int,
	TenTK nvarchar(50),
	HoTen nvarchar(50) null,
	DienThoai varchar(20),
	DiaChi ntext,
	email varchar(50) unique,
	NgayDat SMALLDATETIME,	
	LoaiXe varchar(30),
	TenXe varchar(100)
)
GO
create table PhuKien
(
	MaPhuKien int IDENTITY(1,1) primary key,
	Phukien nvarchar(50),
)
Go

create table ChiTietPhuKien
(
	Ma int IDENTITY(1,1) primary key,
	TenPhukien nvarchar(50) ,
	AnhPhuKien varchar(50),
	MoTa1 ntext,
	Mota2 ntext,
	MaPhuKien int
)
Go

create table DoChoiXe
(
	MaDC int IDENTITY(1,1) primary key,
	LoaiDC nvarchar(50),
	TenDC nvarchar(100),
	GiaDC money CHECK (GiaDC>=0),
	AnhDC nvarchar(100),
	MoTa ntext,
	NgayCapNhat smalldatetime,
	MaLoaiDC int	
)
Go

create table LoaiDoChoiXe
(
	MaLoaiDC int  IDENTITY(1,1) primary key,
	TenLoaiDC nvarchar(50),
)
Go

create table DonDatHangDoChoi
(
	MaDonHangDC int IDENTITY(1,1),
	MaKH int,
	TenTK nvarchar(50),
	HoTen nvarchar(50),
	DiaChi ntext,
	DienThoai varchar(20),
	CONSTRAINT PK_DDHDC PRIMARY KEY(MaDonHangDC)			
)
Go

create table ChiTietDonDatHangDC
(
	STT int IDENTITY(1,1),
	MaDonHangDC int ,
	MaKH int,
	TenDC nvarchar(100),	
	GiaDC DECIMAL(9,2) CHECK (GiaDC>=0),
	NgayDat SMALLDATETIME,	
	SoLuong INT CHECK(SoLuong>0),
	CONSTRAINT PK_CTDHDC PRIMARY KEY(MaDonHangDC,STT)	
)
Go

SET IDENTITY_INSERT Xe ON;
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values 
(1,'E-CLASS', 'MERCEDES-BENZ E 200', 2310000000, 'MERCEDES-BENZ E 200.png', N'
1.GIỚI THIỆU CHUNG:
Phiên bản nâng cấp MERCEDES-BENZ E 200 Facelift 2021 đã được khéo léo tinh chỉnh thiết kế mang đến diện mạo mới trẻ trung, hiện đại và toát lên được chất thể thao hơn. Đèn pha và đèn hậu thiết kế mới, kết hợp nắp ca pô dài tô điểm bằng những đường gân dập nổi cứng cáp, cùng phần vòm mui xe uốn lượn về phía sau tạo hình như những chiếc xe Coupé. Ấn tượng hơn hết với gói ngoại thất AMG-Line đậm chất thể thao trứ danh, cùng với đó khối động cơ cực kỳ mạnh mẽ lên đến 258 mã lực sẵn sàng bứt phá làm thoả mãn tốc độ cho bất kỳ tay lái nào. Hơn 1,2 triệu xe E-Class thế hệ thứ 10 (W213) đã đến tay khách hàng trên toàn cầu va E 200 đã đóng góp doanh số rất lớn vào thành công chung này.
2.NGOẠI THẤT: Nếu như phiên bản E 200 AMG thế hệ trước có chút hiền hoà trong thiết kế khi ứng dụng nhiều chi tiết bo tròn, thì với phiên bản MERCEDES-BENZ E 200 nâng cấp 2021 vừa ra mắt thị trường Việt Nam đã lột xác đáng kể, mang đến diện mạo cá tính và thể thao hơn, toát lên được tinh thần AMG của Mercedes-Benz.
E 200 phiên bản nâng cấp 2021 sử dụng triết lý thiết kế ngôn ngữ “Sensual Purity” 2.0 thế hệ mới góc cạnh hơn. Thể hiện qua gói ngoại thất E 200 và bộ mâm 10 chấu kép thể thao kích thước 19-inch. Đèn pha thiết kế mới với các chi tiết bên trong được sắp xếp lại trông gọn và sắc sảo hơn, sử dụng công nghệ chiếu sáng Multi-Beam LED cao cấp.Hơn nữa, lưới tản nhiệt kim cương sang trọng, phần nắp ca pô kéo dài nổi bật với các đường gân dập nổi mạnh mẽ và cứng cáp, khoang cabin đẩy về phía sau cùng thiết kế vòm mui xe dạng coupé. Ở phía sau, cụm đèn hậu thiết kế mới kéo dài cá tính hơn, ứng dụng công nghệ chiếu sáng LED được sắp xếp như những viên pha lê tựa vào nhau phát sáng, thanh mạ chrome sáng bóng kết nối giữa hai cụm đèn hậu làm điểm nhấn cho sự sang trọng.
3.NỘI THẤT: Là mẫu xe cao cấp nhất của dòng E-Class, vì vậy Mercedes-Benz luôn ưu ái về mặt trang bị cho E 200 AMG. Ở thế hệ nâng cấp 2021 vừa ra mắt thị trường xe sang Việt Nam, MERCEDES-BENZ E 200 2021 với khoang nội thất sử dụng Nappa thượng hạng cùng ốp gỗ open pore màu đen huyên bí. Ghế lái thiết kế thể thao ôm sát người sử dụng chất liệu da Nappa cao cấp. Hàng ghế sau thoáng đãng, trần xe và khoảng không duỗi chân cực kỳ thoải mái cho hành khách nhờ chiều dài cơ sở lên đến 2.939 mm.Vô lăng thể thao D-Cut bọc da Nappa đã được thiết kế mới với phần chấu vô lăng 6 chấu kép nhỏ hơn, tích hợp nút bấm cảm ứng tiện dụng (Touch Control Buttons) có thể điều chỉnh chức năng ga tự động (Cruise Control) và giới hạn tốc độ (Speed Limit). Ngoài ra, cửa sổ trời toàn cảnh Panorama siêu rộng tương tự thế hệ trước, đèn viền nội thất với 64 màu có thể điều chỉnh màu sắc và độ sáng theo sở thích cá nhân.
4.ĐỘNG CƠ: Phiên bản E 200 nâng cấp 2021 vẫn được sử dụng cỗ máy với mã M264. Đây là động cơ I4 dung tích 2.0 lit cho công suất cực đại đạt 258 mã lực tại vòng tua máy 6.100 vòng/phút, mô men xoắn cực đại đạt 370 Nm tại 1.650 – 4.000 vòng/phút, qua đó giúp xe tăng tốc 0 -100 km/h chỉ trong 6,2 giây và tốc độ tối đa lên đến 250 km/h. Đi kèm là hộp số 9G-TRONIC kết hợp lẫy chuyển số thể thao giúp tăng thêm phấn khích trong khi lái xe.
Được biết, các kỹ sư Mercedes-Benz đã tinh chỉnh khối động cơ M264 trên E-Class nâng cấp 2021 để chiếc xe vận hành mạnh mẽ và mượt mà hơn. Đặc biệt, phiên bản E 300 AMG sử dụng hệ thống treo AGILITY CONTROL với trọng tâm xe được hạ thấp 15mm, đây là điều kiện cần để thoả mãn tốc độ cho những tay lái yêu cảm giác thể thao và chinh phục. Chưa hết, MERCEDES-BENZ E 200 đem đến cho người lái 5 chế độ vận hành, bao gồm “Comfort”, “ECO”, “Sport”, “Sport+” và “Individual”, tất cả thông qua nút điều khiển DYNAMIC SELECT. Đồng thời, chế độ “ESP Sport” có thể dễ dàng can thiệp và điều chỉnh khi cần thiết để giảm can thiệp trượt từ công nghệ ESP của xe.
5:AN TOÀN VÀ TIỆN NGHI:

5.1 AN TOÀN:
Thương hiệu xe hơi đến từ Đức – Mercedes-Benz luôn là sự lựa chọn hàng đầu dành cho khách hàng hạng sang khắp toàn cầu, nhờ vào trang bị các tính năng an toàn chủ động/ thụ động để bảo vệ người lái trong mọi tình huống.

Trên phiên bản E 200 nâng cấp 2021 lần đầu tiên trang bị Hệ thống hỗ trợ phanh chủ động Active Brake Assist, hệ thống sẽ tự động phanh một phần nhằm giảm thiểu khả năng va chạm hoặc hạn chế thiệt hại khi va chạm nếu phát hiện vật thể di chuyển bất thường trên đường, kể cả đứng im khi xe di chuyển ở tốc độ thấp.Ngoài ra, phiên bản MERCEDES-BENZ E 200 nâng cấp còn có các trang bị an toàn khác như:

    ·    Camera 360o
Gương chiếu hậu chống chói tự động
Gương chiếu hậu bên ngoài chỉnh & gập điện
Hệ thống hỗ trợ đỗ xe chủ động Active Parking Assist tích hợp PARKTRONIC

    ·    Chức năng cảnh báo mất tập trung ATTENTION ASSIST
Hệ thống tự động bảo vệ PRE-SAFE®

    ·    Hệ thống chống bó cứng phanh ABS; Hỗ trợ lực phanh khẩn cấp BAS; Chống trượt khi tăng tốc ASR; Ổn định thân xe điện tử ESP và hỗ trợ ổn định xe khi gió thổi ngang

    ·    Hệ thống phanh ADAPTIVE với chức năng hỗ trợ dừng xe (HOLD) và hỗ trợ khởi hành ngang dốc (Hill-Start Assist)

    ·    Đèn phanh Adaptive nhấp nháy khi phanh gấp

    ·    Túi khí phía trước; túi khí bên hông phía trước; túi khí cửa sổ, túi khí cho đầu gối người lái

    ·    Tựa đầu điều chỉnh được cho tất cả các ghế
Dây đai an toàn 3 điểm cho tất cả các ghế với bộ căng đai khẩn cấp & giới hạn lực siết
Cần gạt nước mưa với cảm biến mưa
Hệ thống khóa cửa trung tâm với chức năng tự động khóa khi xe chạy và mở khóa trong trường hợp khẩn cấp

    .    Lốp xe runflat
	
5.2 TIỆN NGHI:
Ghế người lái & hành khách phía trước điều chỉnh điện
Bộ nhớ 3 vị trí cho ghế trước, tay lái & gương chiếu hậu bên ngoài

Lưng ghế sau gập được

Cổng sạc Type C cho hàng ghế sau

Chức năng sạc không dây
Hệ thống âm thanh Burmester® công suất 590 watt.
Hệ thống dẫn đường & định vị vệ tinh toàn cầu GPS tích hợp bản đồ Việt Nam
Cổng kết nối (USB type C) truyền thông đa phương tiện phía dưới tựa tay trung tâm

Chức năng kết nối Apple Carplay và Android Auto
Điều hòa khí hậu tự động 3 vùng THERMOTRONIC
Hệ thống khóa xe thông minh & khởi động bằng nút bấm KEYLESS-GO
Màn che nắng kính sau chỉnh điện
Màn che nắng cho cửa sổ hai bên phía sau
Chức năng cửa hít

Tín hiệu âm thanh khi mở/khóa cửa
Chức năng kiểm soát tốc độ Cruise Control với SPEEDTRONIC
Đồng hồ hiển thị nhiệt độ ngoài trời','04/12/2021',1)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(2, 'E-CLASS', 'Mercedes-Benz E 200 Exclusive', 2310000000,'Mercedes-benz E0 Exulusive.png',N'
1.GIỚI THIỆU CHUNG:
E-Class là một trong những dòng xe chủ lực của Mercedes-Benz trên bình diện toàn cầu, trải qua 10 thế hệ đến nay đã có nhiều cải tiến, nâng cấp và thay đổi để mẫu xe này luôn là sự lựa chọn hàng đầu trong giới doanh nhân thành đạt, những người nổi tiếng và giới nghệ sĩ.
Nhờ sở hữu thiết kế ngoại thất lịch lãm, sang trọng cùng nội thất hiện đại và trang bị hàng loạt công nghệ mang tính tiên phong, do đó E-Class gần như không có đối thủ trong phân khúc xe hơi hạng sang cỡ trung bởi đẳng cấp dành cho chủ nhân, khi mà đã có hơn 1,2 triệu xe E-Class thế hệ thứ 10 (W213) đã đến tay khách hàng trên toàn cầu.
Chính thức có mặt tại hệ thống đại lý Vietnam Star Automobile trên toàn quốc kể từ ngày 24/03/2021, Mercedes-Benz E 200 Exclusive nâng cấp 2021 có giá bán 2,310 tỷ đồng chắc chắn sẽ là sự lựa chọn không thể đẳng cấp hơn dành cho khách hàng hạng sang của thương hiệu “Ngôi sao ba cánh” thời điểm này. Song song đó, với thế hệ nâng cấp 2021, Mercedes-Benz hướng đến nhóm đối tượng khách hàng rộng hơn, là những người trẻ thành đạt sớm trong xu hướng càng xã hội phát triển ngày càng mạnh mẽ.
2.NGOẠI THẤT:
Dòng xe E 200 Exclusive phiên bản nâng cấp 2021 là mẫu xe đầu tiên ứng dụng ngôn ngữ thiết kế “Sensual Purity” 2.0 thế hệ mới. Lưới tản nhiệt vẫn kiểu truyền thống vốn làm nên thương hiệu, kết hợp cùng logo “Ngôi sao ba cánh” đặt trên nắp capo đầy kiêu hãnh. Đèn pha ở thế hệ nâng cấp 2021 đã được làm mới trông thon gọn và cá tính hơn, các chi tiết bên trong đèn pha đã được sắp xếp lại.
E 200 Exclusive 2021 sử dụng công nghệ chiếu sáng LED toàn phần. Trong khi đó, cụm đèn hậu nhận được nhiều phản hồi tích cực từ các chuyên gia bởi tính hiện đại và đẹp mắt tương tự S-Class, với lối thiết kế như những viên pha lê xếp lớp dựa vào nhau với thiết kế phản quang đầy cuốn hút.
E 200 Exclusive phiên bản nâng cấp 2021 với nắp ca pô kéo dài sang trọng. Nhìn từ bên hông, thân xe của E-Class nâng cấp mang nhiều hơi hướng của dòng Coupe với phần mui xe vuốt gọn về phía sau, mang đến hình ảnh năng động, thể thao và tính khí động học. Kết hợp cùng bộ mâm 18-inch đa chấu với thiết kế lịch lãm.
3.NỘI THẤT:
Không phải ngẫu nhiên mà Mercedes-Benz E-Class luôn được nhiều khách hàng hạng sang tin chọn, bên cạnh ngoại thất lịch lãm sang trọng, nội thất cũng không kém phần sang trọng bởi hãng xe sang nổi tiếng của Đức chăm chút tỉ mỉ đến từng chi tiết dù là nhỏ nhất.
Bước vào khoang nội thất của chiếc E 200 Exclusive nâng cấp 2021 khách hàng không khỏi trầm trồ bởi sự thoáng đãng, tràn ngập công nghệ và tiện nghi bậc nhất phân khúc. Các cụm điều khiển bố trí logic và sử dụng các vật liệu cao cấp như da, gỗ, hợp kim nhôm. Bảng tap lô bọc da Artico đan xen các chi tiết ốp gỗ Burr Walnut sang trọng.
Đèn viền nội thất có thể điều chỉnh 64 màu sắc và độ sáng mang đến không gian riêng tư cho chủ nhân và hành khách. Ốp bệ bước cửa trước với chữ “Mercedes-Benz” phát sáng tăng thêm vẻ sang trọng cho chủ nhân. Ở hàng ghế phía sau hoàn toàn đem đến cảm giác thoáng đãng và thoải mái nhờ trần xe tương đối cao, khoảng không gian duỗi chân rộng rãi, giúp chủ nhân và gia đình tận hưởng trọn vẹn niềm vui trên mọi hành trình.
4.ĐỘNG CƠ:
Thế hệ nâng cấp 2021 của Mercedes-Benz E 200 Exclusive không có sự thay đổi về động cơ so với phiên bản trước đó. Xe vẫn sử dụng động cơ I4 dung tích 2.0 lit tăng áp đường nạp kép (twin-scroll), cho công suất cực đại đạt 197 mã lực tại 6.100 vòng/phút, mô men xoắn cực đại đạt 320 Nm tại 1.650 – 4.000 vòng/phút. Đi kèm hộp số tự động 9 cấp 9G-TRONIC cũng như hỗ trợ người lái sang số/trả số bằng lẫy chuyển số cực kỳ nhanh chóng, tăng thêm phấn khích trong lái xe.
Hơn nữa, E 200 Exclusive với 5 chế độ lái khác nhau, bao gồm: bao gồm “Comfort”, “ECO”, “Sport”, “Sport+” và “Individual” thông qua núm điều khiển DYNAMIC SELECT. Mỗi chế độ lái là một cảm xúc hoàn toàn khác biệt, đặc biệt kết hợp với hệ thống treo thích ứng AGILITY CONTROL.
5.AN TOÀN VÀ TIỆN NGHI:
5.1 AN TOÀN:
Hãng xe hơi hạng sang Mercedes-Benz luôn đặt tính an toàn lên hàng đầu với hầu hết các mẫu xe. Dĩ nhiên, E-Class không ngại lệ, và là mẫu xe vượt cả trên chuẩn an toàn 5 sao (EURO NCAP) ở tất cả các hạng mục nhờ hàng loạt trang bị công nghệ an toàn bậc nhất hiện nay trong ngành công nghiệp ô tô Thế giới. Có thể kể đến như: Hỗ trợ đỗ xe tự động Active Parking Assist; ATTENTION ASSIST; ESP Curve Dynamic Assist; Crosswind Assist; Phanh tay điều khiển điện với chức năng nhả phanh thông minh; Hỗ trợ khởi hành ngang dốc (Hill-Start Assist) cùng 7 túi khí an toàn. Đặc biệt, lần đầu tiên E 200 Exclusive nâng cấp 2021 được trang bị Hệ thống hỗ trợ phanh chủ động Active Brake Assist. Đây là công nghệ an toàn, hữu ích nhờ tính năng phát hiện và phanh với các vật thể di chuyển, kể cả đứng im khi xe vận hành ở tốc độ thấp.
Không thể không nhắc đến tính năng an toàn đáng giá trên Mercedes-Benz C 200 Exclusive nâng cấp 2021 là Hệ thống hỗ trợ phanh tự động “Pre-Safe”. Công nghệ này có chức năng bảo vệ người lái và hành khách trong các tình huống bất ngờ xảy ra va chạm trên đường. Pre-Safe hoạt động dựa trên nguyên lý dự đoán, phân tích các tình huống thông qua hàng loạt cảm biến thông minh để phát hiện sớm các va chạm xảy ra trong khoảng thời gian rất ngắn từ các hệ thống như Cân bằng điện tử ESP, Hệ thống trợ lực phanh BAS Pro…
Đồng thời, công nghệ an toàn tự động bảo vệ Pre Safe sẽ tác động lên dây đai giúp giữ chặt người lái và hành khách phía trước nếu trong tình huống phanh khẩn cấp. Trợ lực vô lăng nhạy hơn để xử lý nhanh hơn. Ghế lái sẽ tự động lùi về phía sau, tránh xa khu vực bảng tap lô và vô lăng nhằm hạn chế các tổn thương nếu có va chạm trực diện hoặc bung túi khí. Trường hợp xe đang mở cửa kính bất kỳ thì công nghệ Pre Safe sẽ tự động đóng lại tất cả, điều này rất quan trọng khi xe mất lái làm giảm rủi ro cho người lái và hành khách.
Công nghệ An toàn tự động bảo vệ Pre-Safe là một trợ thủ đắc lực nhằm bảo vệ người lái và hành khách trong các tình huống xảy ra trước, trong và sau va chạm cực kỳ đáng giá và thông minh. Đặc biệt, kết hợp với Hệ thống hỗ trợ phanh chủ động Active Brake Assist lần đầu tiên được trang bị, qua đó giúp E 200 Exclusive trở thành mẫu sedan hạng sang cỡ trung an toàn bậc nhất phân khúc. Xứng tầm giá trị của một mẫu xe hạng sang mang lại cho chủ nhân.
5.2 TIỆN NGHI:
Điểm nhấn đầu tiên về mặt tiện nghi là vô lăng 3 chấu bộc da Nappa thiết kế mới, điệu đà tương tự đàn anh S-Class tích hợp nút điều khiển cảm ứng trên tay lái (Touch Control Buttons). E 200 Exclusive nâng cấp 2021 được trang bị giao diện thông tin giải trí MBUX với 4 hình thức điều khiển khác nhau, bao gồm màn hình cảm ứng 12.3-inch, điều khiển bằng giọng nói, nút điều khiển cảm ứng trên tay lái hoặc bàn điều khiển touchpad.
Bàn điều khiển touchpad đã được tinh chỉnh mới rộng hơn, nhạy hơn và có thể ghi nhận các ký tự chữ viết, số đếm và dấu cơ bản thên thuận tiện cho người dùng. Ngoài ra, người dùng có thể chọn 4 chủ đề hiển thị khác nhau cho bảng đồng hồ kỹ thuật số 12.3-inch, bao gồm ‘Cấp tiến, ‘Thể thao’, ‘Hiện đại cổ điển’ và “Tối giản”. Đồng thời, Kết nối tương thích Apple CarPlay và Android Auto cũng được trang bị. Cửa hít cũng là trang bị sẵn có trên E 200 Exclusive nâng cấp 2021. Đăc biệt, tính năng tự động điều chỉnh ghế lái thích hợp, người lái chỉ cần nhập liệu chiều cao cơ thể, xe sẽ tự động điều chỉnh ghế ngồi và vô lăng sao cho phù hợp nhất.
Không dừng lại đó, điều hoà tự động 3 vùng cũng như khả năng truy cập Internet ngay trên xe. Cổng USB (type C) cho hai hàng ghế, rèm che nắng kính sau và rất nhiều trang bị mang tính tiện nghi khác mà E 200 Exclusive 2021 được trang bị để chiều lòng chủ nhân.
', '07/23/2019',1)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(3,'E-CLASS', 'MERCEDES-BENZ E 200 SPORT', 2317000000, 'MERCEDES-BENZ E 200 SPORT.png', N'
1.GIỚI THIỆU CHUNG:
Sở hữu nhiều ưu điểm nổi bật từ nội ngoại thất, sức mạnh động cơ đến các trang bị tiện nghi hiện đại, E-Class luôn là mẫu xe được nhiều doanh nhân ưa chuộng và ví như là những “Tuyệt tác trí tuệ”. Trong năm 2019, dòng Sedan này tiếp tục khuấy động thị trường xe hơi Việt Nam bởi sự ra đời của 3 phiên bản nâng cấp mới: E 200 Elegance (bản tiêu chuẩn), E 200 Sport và E 350 AMG tại sự kiện Fascination 2019.
Mercedes-Benz E 200 Sport là phiên bản thay thế cho “người tiền nhiệm” E 250 – mẫu xe hướng tới phương thức lái xe an toàn và chủ động trên mọi hành trình. Nối tiếp “đàn anh”, E 200 Sport ghi điểm nhấn bởi nhiều đặc tính thể thao và ấn tượng hơn, phù hợp với khách hàng trẻ tuổi, năng động.
2.NGOẠI THẤT:
Ngay từ cái nhìn đầu tiên, Mercedes-Benz E 200 Sport đã toát lên vẻ đẹp sang trọng, đủ tầm thể hiện đẳng cấp chủ nhân. So với bản tiêu chuẩn E 200 2019, E200 Sport có khá nhiều nét tương đồng. Tuy nhiên, phiên bản “đàn anh” lại sở hữu diện mạo hầm hố và khỏe khoắn hơn nhờ trang bị gói thiết kế ngoại thất thể thao SPORTSTYLE. 
Phần đầu xe cuốn hút bởi lưới tản nhiệt sao nguyên từ mẫu E 250 với 2 nan lớn mạ chrome sáng bóng, ngôi sao 3 cánh ở giữa. Thiết kế nắp ca-pô được kéo dài tạo vẻ đẹp thanh mảnh và lịch lãm. Bên dưới là 2 hốc gió dạng lưới cỡ lớn, giúp khắc họa rõ nét phong cách thể thao mà mẫu xe này đang theo đuổi.
Phong thái đầy uy nghi của E 200 Sport còn đến từ cụm đèn trước MULTI-BEAM LED thông minh cấu tạo từ 84 cá thể LED, có khả năng hiệu chỉnh ánh sáng theo điều kiện mặt đường. Tích hợp với đó là đèn LED chiếu sáng ban ngày nổi bật. Thân xe cũng được trau chuốt, ấn tượng với những đường nét dứt khoát, cân đối. Tiến về phía sau xe là cụm đèn sau và đèn phanh thứ ba công nghệ LED hiện đại.
Điểm đáng chú ý nhất trong ngoại thất của phiên bản  E 200 Sport 2019 là logo “SPORTSTLYLE” được in sắc nét bên hông xe. Đặc biệt, nếu E 200 nâng cấp sử dụng mâm xe 17-inch 10 chấu thì ở phiên bản E 200 Sport  lại được ưu ái hơn khi tích hợp bộ mâm xe 18-inch 5 chấu vạm vỡ hình cánh quạt mới. Trang bị này không chỉ tạo nên sự khác biệt mà còn giúp mẫu sedan E-Class trở nên năng động và thu hút hơn.
Hiện nay, Mercedes-Benz E 200 Sport 2019 có 4 màu sơn như:

   ● Trắng Polar (149).

   ● Đen Obsidian (197).

   ● Xanh Cavansite (890).

   ● Đỏ Hyacinth (996).
3.NỘI THẤT:
Bước vào bên trong xe, bạn sẽ choáng ngợp trước khoang nội thất vô cùng rộng rãi. Mercedes-Benz E 200 Sport  có kích thước  Dài x Rộng x Cao lần lượt là 4923 x 1852 x 1474 (mm), chiều dài cơ sở 2939 (mm) cùng cửa sổ trời siêu rộng Panorama, chắc chắn sẽ mang tới cho một không gian thoải mái và nghỉ ngơi lý tưởng trên những chặng đường dài hay sau mỗi ngày làm việc mệt mỏi.
Thiết kế nội thất Mercedes-Benz E 200 Sport theo phong cách sang trọng cổ điển với nhiều chất liệu thượng hạng như da cao cấp hay ốp nhôm vân Cacbon trên tap-lô và gỗ đen Open-pore trên cụm điều khiển trung tâm. Hệ thống đèn viền nội thất cho phép điều chỉnh 64 màu sắc và độ sáng tạo nên không gian độc đáo và huyền ảo, nhất là vào ban đêm.
Ở phiên bản này, Mercedes-Benz còn chú trọng mang đến sự tiện nghi và thân thiện với người dùng. Cụ thể, xe được trang bị tay lái đa chức năng 3 chấu bọc da Nappa với nút điều khiển bằng cảm ứng. Bảng đồng hồ dạng 2 ống, hệ thống âm thanh và giải trí với màn hình màu 12.3 inch và hệ thống âm thanh vòm Burmester 13 loa cực sống động. Ngoài ra, Mercedes-Benz E 200 Sport còn tích hợp hệ thống lọc khí thông minh AIR-BALANCE với 4 mùi hương nội thất riêng biệt, quyến rũ và rất dễ chịu. 
4. TRẢI NGHIỆM MỚI VỀ HIỆU SUẤT NHỜ SỨC MẠNH ĐỘNG CƠ VƯỢT TRỘI:
Nâng cấp đáng giá nhất của phiên bản E-Class 2019 nằm dưới nắp ca-pô. Theo đó, Mercedes E 200 Sport sở hữu khối động cơ I4 mới mã hiệu M264, dung tích 2.0L, công suất cực đại 197 mã lực, mô-men xoắn cực đại 300 Nm tại 1600 - 4000 vòng/phút. Kết hợp là hộp số tự động 9 cấp 9G-TRONIC, dẫn động cầu sau. Theo số liệu của nhà sản xuất, E 200 Sport có thể tăng tốc dễ dàng từ 0 – 100 km/h chỉ trong 7.5s và đạt vận tốc tối đa 240 km/h. So với nhiều đối thủ cạnh tranh trong cùng phân khúc, E 200 Sport có công suất mạnh hơn 15% và mô-men xoắn 20%.
Trải nghiệm thực tế, Mercedes E 200 Sport mang lại cảm giác lái khá đầm chắc, vừa đủ bức tốc mạnh mẽ nhưng vẫn đảm bảo sự mượt mà và êm ái trên mọi cung đường. Cụm điều khiển DYNAMIC SELECT với 5 chế độ vận hành, cho phép người dùng cá nhân hóa trải nghiệm để mỗi chuyến đồng hành cùng Mercedes E 200 Sport luôn thú vị nhất.
5.TRANG BỊ CÔNG NGHỆ AN TOÀN VÀ TIỆN NGHI HIỆN ĐẠI BẬC NHẤT:
Bên cạnh những tính năng an toàn và tiện nghi cơ bản của một dòng sedan hạng sang, Mercedes-Benz E 200 Sport còn chinh phục khách hàng Việt bởi hàng loạt trang bị hiện đại như:
5.1 AN TOÀN:
   ● Hệ thống treo AGILITY CONTROL với chiều cao được hạ thấp.

   ● Hệ thống lái Direct-Steer trợ lực điện với trợ lực và tỉ số truyền lái biến thiên theo tốc độ.

   ● Camera 360 độ.

   ● Hệ thống hỗ trợ đỗ xe chủ động Active Parking Assist tích hợp PARKTRONIC.

   ● Chức năng cảnh báo mất tập trung ATTENTION ASSIST.

   ● Hệ thống tự động bảo vệ PRE-SAFE® kết hợp tối đa các tính năng an toàn trong trường hợp khẩn cấp. 

   ● Hệ thống phanh ADAPTIVE với chức năng hỗ trợ dừng xe (HOLD) và hỗ trợ khởi hành ngang dốc (Hill-Start Assist).

   ● Hệ thống chống bó cứng phanh ABS, hỗ trợ lực phanh khẩn cấp BAS, chống trượt khi tăng tốc ASR, ổn định thân xe điện tử ESP. 
5.2 TIỆN NGHI:
   ● Ghế người lái và hành khách phía trước điều chỉnh điện, tích hợp bộ nhớ 3 vị trí.

   ● Lưng ghế sau gập được.

   ● Điều hòa khí hậu tự động 3 vùng THERMOTRONIC.

   ● Touchpad điều khiển cảm ứng trên bệ trung tâm.

   ● Hệ thống dẫn đường và định vị vệ tinh toàn cầu GPS tích hợp bản đồ Việt Nam.

   ● Hệ thống khởi động bằng nút bấm Keyless Start.

   ● Chức năng kiểm soát tốc độ Cruise Control với SPEEDTRONIC.

   ● Cổng lắp đặt giá để Ipad và các thiết bị.
Tại thị trường Việt Nam, Mercedes E 200 Sport có giá bán ra 2.317.000.000 VND. Đây là mức giá khá phải chăng cho một mẫu sedan hạng sang có diện mạo phá cách, thanh lịch với nhiều tính năng thông minh.
', '04/12/2020',1)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(4,'C-CLASS','MERCEDES-BENZ C 180 AMG', 1499000000, 'MERCEDES-BENZ C180 AMG.png', N'
1.GIỚI THIỆU CHUNG:
Sau 1 năm kể từ ngày ra mắt, tháng 3/2021 Mercedes-Benz chính thức trình làng phiên bản thể thao của mẫu xe C 180 AMG. Được kỳ vọng sẽ trở thành chiếc xe đầu tiên trong đời của nhiều khách hàng và thu hút các chủ sở hữu nâng cấp từ xe phổ thông.
Mercedes-Benz C 180 AMG nhận được rất nhiều đánh giá tích cực từ giới chuyên gia và cộng đồng ô tô Việt từ thiết kế ngoại thất, nội thất đến sức mạnh động cơ và các trang bị đi kèm. Đây là mẫu xe dành cho các đối tượng khách hàng trẻ trung, năng động với mức giá bán khá hấp dẫn, chỉ 1,499 tỷ đồng.
2.NGOẠI THẤT:
C 180 AMG với ngoại thất AMG Line khắc họa một chiếc xe thể thao giàu sức mạnh. Mũi xe trẻ trung với hai hốc thoát gió cỡ lớn thông ra vòm bánh xe cùng lướt tản nhiệt kim cương. Cụm đèn LED toàn phần được thiết kế xếp lớp 2 tầng, 4 khoang với các tinh thể liền kề, tạo ra hiệu ứng 3D đẹp mắt. Đèn hậu LED cũng được thiết kế lại đồ họa sợi quang dạng chữ C, rất dễ nhận diện vào ban đêm. Mang trong mình dáng dấp và phong cách thể thao hiện đại của C 300 AMG, nhưng C 180 AMG lại có những điều chỉnh để tạo nên nét riêng biệt. Mâm xe 18 inch với 5 chấu kép có đồ họa ngôi sao bạc trên nền xám thay vì nền đen như C 300 AMG. Và C 180 AMG sử dụng viền mạ chrome cùng kính trong suốt thay vì gói Night package.
Đặc biệt, khách hàng có thể lựa chọn 5 màu ngoại thất bao gồm Trắng Polar, Đen Obsidian, Đỏ Hyacinth, Xanh Cavansite và Xám Graphite, cùng với 2 gam màu nội thất là Đen và Vàng Silk.
3.NỘI THẤT:
Bước vào bên trong, Mercedes-Benz C 180 ghi điểm bởi sự sang trọng nhờ ốp gỗ bóng Piano màu đen kết hợp với ốp nhôm thể thao. Khoang nội thất Mercedes-Benz C 180 AMG sở hữu hàng loạt trang bị tiện nghi hiện đại.
Khoang lái vẫn nổi bật với hàng loạt trang bị hiện đại như Bảng đồng hồ dạng 2 ống với màn hình màu 5,5-inch hiển thị thông tin, hệ thống giải trí đa phương tiện với màn hình màu 7-inch, bộ thu sóng phát thanh và kết nối Bluetooth…Tay lái 3 chấu thế hệ mới bọc da với nút điều khiển cảm ứng. Phía sau là lẫy chuyển số giúp “chủ nhân” thao tác bằng tay dễ dàng và linh hoạt hơn. Ngoài ra, chất liệu ở khu vực táp lô cũng có một số thay đổi nhỏ khi ốp gỗ đen bóng ấn tượng. Bề mặt táp lô được làm mới với nhôm mài phay xước, không để lại dấu vân tay khi chạm vào.
Cảm nhận về sự thoải mái khi ngồi ở hàng ghế trước và sau, Mercedes-Benz C 180 AMG vẫn đáp ứng đủ tiêu chí này. Với kích thước Dài x rộng x cao lần lượt là 4700 x 1820 x 1440 (mm), chiều dài cơ sở 2840 (mm), Mercedes-Benz C 180 AMG có khoang hành khách khá rộng rãi cho mọi hành khách ở cả hai hàng ghế. Đi kèm là các tựa đầu và bệ tỳ tay tích hợp ngăn chứa đồ khá tiện lợi.
4.VẬN HÀNH ÊM ÁI, LINH HOẠT:
Mercedes-Benz C 180 AMG được trang bị khối động cơ I4 1.5L tăng áp cuộn kép thế hệ mới (M264), sản sinh công suất 156 mã lực và mô-men xoắn cực đại 250 Nm tại vòng tua 1.500 -4.000 vòng/phút. Sức mạnh này được truyền qua hộp số tự động 9 cấp 9G-TRONIC và hệ dẫn động cầu sau, giúp Mercedes-Benz C 180 AMG có thể tăng tốc từ 0 – 100 km/h chỉ trong 8,6 giây, nhanh hơn nhiều mẫu xe phổ thông sử dụng động cơ nạp khí tự nhiên dung tích 2.5 lít.
Bên cạnh đó, nhờ vào trọng lượng nhẹ, tăng áp cuộn kép và hệ dẫn động hiệu quả, C 180 mang đến khả năng vận hành linh hoạt và nhạy bén cho người cầm lái. 
Trải nghiệm cảm giác cầm lái thực tế, Mercedes-Benz C 180 mang lại trải nghiệm khá bốc và dư thừa sức mạnh khi đi trong đô thị. Nhờ có hệ thống lái Direct-Steer với trợ lực điện và tỉ số truyền lái biến thiên theo tốc độ, khả năng xử lý và bẻ lái của Mercedes-Benz C 180 AMG rất mượt mà. Hệ thống treo tự thích ứng AGILITY CONTROL mang lại cảm giác êm ái và cực đầm chắc. Không chỉ vậy, chủ nhân xe sang còn có thể trải nghiệm lái thú vị với cụm điều khiển DYNAMIC SELECT với 5 chế độ lái: Comfort, ECO, Sport, Sport+ và Individual, cho phép người cầm lái có thể tùy chỉnh theo điều kiện mặt đường.
5.NHIỀU TRANG BỊ AN TOÀN VÀ TIỆN NGHI HIỆN ĐẠI:
Mercedes-Benz C 180 AMG là thừa hưởng toàn bộ các trang bị an toàn và tiện nghi của Mercedes-Benz C 200. Đây đều là những trang bị hiện đại mà các mẫu xe khác trong cùng phân khúc giá khó cạnh tranh được. 
5.1 AN TOÀN:
Các trang bị an toàn trên mẫu xe Mercedes-Benz C 180 AMG: 

   • Chức năng cảnh báo mất tập trung ATTENTION ASSIST.

   • Hệ thống chống bó cứng phanh ABS; hỗ trợ lực phanh khẩn cấp BAS; chống trượt khi tăng tốc ASR; ổn định thân xe điện tử ESP.

   • Hệ thống ESP® Curve Dynamic Assist giúp hỗ trợ ổn định khi vào cua.

   • Hệ thống phanh ADAPTIVE với chức năng hỗ trợ dừng xe (HOLD) và hỗ trợ khởi hành ngang dốc (Hill-Start Assist). 

   • Phanh tay điều khiển điện với chức năng nhả phanh thông minh.

   • Chức năng ECO start/stop.

   • Camera lùi.

   • Túi khí phía trước, túi khí bên hông phía trước, túi khí cửa sổ, túi khí đầu gối cho người lái.

   • Tựa đầu điều chỉnh được cho tất cả các ghế.

   • Dây đai an toàn 3 điểm cho tất cả các ghế với bộ căng đai khẩn cấp và giới hạn lực siết. 

   • Hệ thống khóa cửa trung tâm với chức năng tự động khóa khi xe chạy và mở khóa trong trường hợp khẩn cấp. 
5.2 TIỆN NGHI:
Về tiện nghi, toàn bộ ghế trên xe đều được bọc da êm ái mang lại cảm giác ngồi thoải mái trong suốt hành trình. Xe trang bị điều hòa khí hậu tự động 2 vùng THERMATIC, cho phép tùy chỉnh nhiệt độ và luồng gió tại mỗi vị trí ngồi. Đặc biệt, cửa gió điều hòa nổi bật với các đường viền kim loại xung quanh, khác biệt rất lớn so với thiết kế nhựa như trên các mẫu sedan cùng phân khúc khác. Khoang hành lý rộng khách hàng có thể mang theo các hành lý, đồ dùng trong các chuyến du lịch.
Ngoài ra, Mercedes-Benz C 180 AMG còn có nhiều tiện ích đáng chú ý như:
   • Ghế người lái và hành khách phía trước điều chỉnh điện

   • Lưng ghế sau gập được.

   • Chức năng kết nối Apple Carplay và Android Auto.

   • Touchpad điều khiển cảm ứng trên bệ trung tâm.

   • 2 cổng sạc USB cho ghế sau.

   • Chức năng khởi động bằng nút bấm KEYLESS-START.

   • Chức năng kiểm soát tốc độ Cruise Control với SPEEDTRONIC.

   • Đồng hồ hiển thị nhiệt độ ngoài trời. 
	Với diện mạo đẹp từ mọi góc nhìn, trang bị hiện đại cùng mức giá khá cạnh tranh, Mercedes-Benz C 180 AMG hứa hẹn sẽ là mẫu Sedan lý tưởng trong phân khúc sedan hạng D
', '04/20/2021',2)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(5,'C-CLASS','MERCEDES-BENZ C 200 EXCLUSIVE',1699000000,'MERCEDES-BENZ C200 EXCLUSIVE.png',N'
1.GIỚI THIỆU CHUNG:
Ra mắt lần đầu tiên vào năm 1982, đến nay C-Class luôn là dòng xe được giới doanh nhân trẻ thành đạt ưa chuộng. Tại thị trường Việt Nam, các phiên bản C-Class liên tục là mẫu xe Sedan hạng sang bán chạy nhất.
Mercedes-Benz C 200 Exclusive 2021 là một trong 3 phiên bản Facelift của C-Class vừa được hãng xe Đức “trình làng” vào tháng 2/2019. Theo nhận xét của nhiều chuyên gia và tín đồ Mercedes-Benz, phiên bản 2021 này sở hữu nhiều điểm nhấn công nghệ, “lột xác” trong thiết kế và chú trọng cốt lõi vào trải nghiệm của mọi hành khách. 
Ngoài ra, với những nâng cấp hoàn toàn mới cùng những đặc trưng riêng vốn có: sang trọng, đẳng cấp – tiện nghi hàng đầu – an toàn bậc nhất, Mercedes-Benz C 200 Exclusive 2021 chắc chắn sẽ là “người bạn” đồng hành lý tưởng, đủ sang trọng để khắc họa rõ nét đẳng cấp của chủ nhân.
2.NGOẠI THẤT:
Nhìn tổng thể, ngoại thất Mercedes-Benz C 200 Exclusive 2021 vẫn in đậm phong cách sang trọng đặc trưng vốn có. Tuy nhiên, dưới bàn tay tài ba của những kỹ sư nhà Mercedes-Benz, phiên bản Facelift 2021 trở nên cuốn hút và ấn tượng hơn với cản trước thanh mảnh, tôn lên sự thanh lịch với các chi tiết mạ chrome sáng bóng. Theo đó, cản sau cũng được trang bị nhiều nâng cấp đáng chú ý. 
Nhìn trực diện, Mercedes-Benz C 200 Exclusive 2021 có nhiều điểm tương đồng với “đàn anh” S-Class khi được trang bị lưới tản nhiệt 4 nan đơn với logo ngôi sao ba cánh thương hiệu nằm chễm chệ ở bên trên. Bên dưới là hai hốc hút gió nằm sâu hơn và ôm trọn phần đầu xe. Đây là một trong những chi tiết giúp khắc họa sự mạnh mẽ và cá tính trong phiên bản Facelift 2021.
Cải tiến nổi bật của Mercedes-Benz C 200 Exclusive 2021 được nhiều khách hàng đánh giá cao là cụm đèn trước Multi-Beam LED tích hợp dải đèn LED ban ngày hiện đại và thời thượng. Mỗi cụm đèn được cấu tạo từ 84 bóng đèn LED hiệu suất cao, được kiểm soát độc lập nhằm tạo ra luồng sáng chính xác, có cường độ siêu mạnh và công nghệ Ultra Range thừa hưởng từ mẫu xe đàn anh S-Class cho tầm chiếu sáng lên tới 650m nhưng không gây chóa mắt cho phương tiện đi ngược chiều.
Phần hông xe được trau chuốt bởi những đường gân dập nổi uyển chuyển như ở phiên bản cũ. Tiến về phía sau, đuôi xe ghi điểm nhờ cụm đèn hậu LED có thiết kế đồ họa sợi quang dạng chữ C ngược xếp chồng lên nhau vô cùng bắt mắt. Bên dưới là cụm ống xả dạng elip, mạ chrome được bố trí đối xứng nhau.
Một trong những ưu điểm giúp Mercedes-Benz C 200 Exclusive 2021  “ăn đứt” các đối thủ trong cùng phân khúc là bộ mâm xe 18-inch đa chấu 2 tông màu trắng đen xen kẽ. Với trang bị này, Mercedes-Benz C 200 Exclusive 2021 trở nên năng động, cá tính và in một phần dấu ấn thể thao khỏe khoắn của “đàn anh” Mercedes-Benz C 300 AMG. 
3.NỘI THẤT:
Sở hữu kích thước Dài x Rộng x Cao lần lượt là 4686 x 1810 x 1442 (mm), chiều dài cơ sở 2840 (mm), Mercedes-Benz C 200 Exclusive mang tới một không gian khá thoải mái cho tất cả hành khách khi ngồi bên trong. 
Định vị là mẫu xe mang đến những trải nghiệm cá nhân hóa đến từng giác quan, C-Class nói chung và Mercedes-Benz C 200 Exclusive 2019 nói riêng đều sở hữu khoang nội thất tinh xảo với nhiều vật liệu cao cấp như da, gỗ open-pore walnut màu nâu và kim loại. Đặc biệt với hệ thống đèn viền nội thất 64 màu sắc, chủ nhân C-Class còn có thể tạo nên khoảng không gian với tone màu theo sở thích và cá tính của chính mình. Đây là một trong những điểm nổi bật của Mercedes-Benz C 200 Exclusive 2019 so với các đối thủ trong cùng phân khúc khi chỉ sử dụng đèn viền nội thất phổ thông. 
Không chỉ vậy, ở phiên bản này còn được trang bị tay lái với thiết kế mới gồm 3 chấu bọc da, tích hợp 2 nút điều khiển cảm ứng (Touch Control Buttons). Thiết kế này giúp người lái có thể dễ dàng điều khiển các tính năng của xe mà không bị sao nhãng.
Tại thị trường Việt, Mercedes-Benz C 200 Exclusive 2021 hiện có 2 màu nội thất gồm:
   ● Đen (221).

   ● Vàng Silk (225).
4.ĐỘNG CƠ BỀN BỈ, CHÚ TRỌNG TRẢI NGHIỆM CHO MỌI KHÁCH HÀNG:
“Trái tim” của phiên bản Mercedes-Benz C 200 Exclusive 2021 là khối động cơ xăng I4 1.5L tích hợp công nghệ Mild-Hybrid EQ Boost, có công suất cực đại 184 hp tại 5800-6100 vòng/phút, mô-men xoắn cực đại 280 Nm tại 3000 - 4000 vòng/phút. Đi kèm với đó là hộp số tự động 9 cấp 9G-TRONIC. Theo thông số của hãng xe Đức cung cấp, Mercedes-Benz C 200 Exclusive 2019 chỉ mất 7,7s để tăng tốc từ 0-100 km/h trong điều kiện tiêu chuẩn và đạt vận tốc tối đa là 239 km/h. 
Trải nghiệm thực tế trên những con phố đông đúc hay đường trường, Mercedes-Benz C 200 Exclusive 2021 đều tỏ ra rất bền bỉ và đầm chắc. Cụm điều khiển DYNAMIC SELECT với 5 chế độ vận hành, cho phép người lái tùy chỉnh sao cho phù hợp với điều kiện mặt đường. Đặc biệt, xe chuyển số linh hoạt, di chuyển rất mượt mà và êm ái nhờ được cung cấp lực đẩy mạnh mẽ từ hệ dẫn động cầu sau. Ngoài ra, ở phiên bản này còn tích hợp nhiều công nghệ hỗ trợ lái an toàn, dễ sử dụng, giúp người ngồi sau vô lăng luôn cảm thấy thoải mái và tự tin hơn.
5.AN TOÀN VÀ TIỆN NGHI HIỆN ĐẠI BẬC NHẤT:
Công nghệ an toàn và tiện nghi luôn là yếu tố cốt lõi được Mercedes-Benz chú trọng trong tất cả các mẫu xe. Bởi vậy, các dòng xe Mercedes-Benz luôn làm hài lòng các doanh nhân nhờ sở hữu hệ thống an toàn hiện đại cùng nhiều trang bị tiện nghi hàng đầu. Và Mercedes-Benz C 200 Exclusive 2021 cũng không ngoại lệ. 
Một số công nghệ an toàn và tiện nghi nổi bật hiện diện trong phiên bản Mercedes-Benz C 200 Exclusive 2021 có thể kể đến như:  
4.1 AN TOÀN:
   ● Hệ thống treo thích ứng AGILITY CONTROL.

   ● Hệ thống lái Direct-Steer trợ lực điện với trợ lực và tỉ số truyền lái biến thiên theo tốc độ.

   ● Hệ thống hỗ trợ đỗ xe chủ động Active Parking Assist tích hợp PARKTRONIC và camera lùi là “trợ thủ đắc lực” khi đỗ xe tại các không gian nhỏ, hẹp.

   ● Hệ thống chống bó cứng phanh ABS.

   ● Hệ thống hỗ trợ lực phanh khẩn cấp BAS.

   ● Hệ thống chống trượt khi tăng tốc ASR.

   ● Hệ thống ổn định thân xe điện tử ESP.

   ● Hệ thống ESP® Curve Dynamic Assist giúp hỗ trợ ổn định khi vào cua.

   ● Hệ thống phanh ADAPTIVE với chức năng hỗ trợ dừng xe và hỗ trợ khởi hành ngang dốc.

   ● Tất cả các ghế được trang bị dây đai an toàn 3 điểm với bộ căng đai khẩn cấp và giới hạn lực siết khi xảy ra va chạm.

   ● Túi khí phía trước; túi khí bên hông phía trước; túi khí cửa sổ, túi khí đầu gối cho người lái.
4.2 TIỆN NGHI:
Với nhiều trang bị tiện nghi hiện đại, Mercedes-Benz C 200 Exclusive mang tới những trải nghiệm thoải mái nhất cho mọi hành khách trên mọi hành trình. Cụ thể, ghế người lái và hành khách phía trước điều chỉnh điện, tích hợp bộ nhớ 3 vị trí. Điều hòa khí hậu tự động 2 vùng THERMATIC cho phép hành khách tùy chỉnh nhiệt độ và luồng gió. Ngoài ra, ở phiên bản này còn có sự góp mặt của hệ thống Air Balance với 4 hương nước hoa hảo hạng, hệ thống âm thanh vòm Burmester® 13 loa, công suất 590W cho âm thanh cực sống động, chắc chắn sẽ làm hài lòng mọi hành khách, ngay cả những tín đồ audiophile.
Đặc biệt, Mercedes-Benz C 200 Exclusive 2021 còn sở hữu hàng loạt nâng cấp hiện đại. Minh chứng rõ nhất là phiên bản này tích hợp hệ thống giải trí đa phương tiện với màn hình giải trí 10.25-inch, bộ thu sóng phát thanh và kết nối Bluetooth. Xe còn cho phép kết nối Apple Carplay và Android Auto, chức năng sạc không dây cho điện thoại thông minh và có cổng lắp đặt giá để Ipad và các thiết bị giải trí khác. Đây là những tính năng mới, cao cấp khó tìm thấy trong những mẫu Sedan tầm trung khác.
Ra mắt với diện mạo được trau chuốt tỉ mỉ trong từng chi tiết cùng nhiều nâng cấp mới, Mercedes-Benz C 200 Exclusive là lựa chọn lý tưởng cho khách hàng Việt khi tìm mua một mẫu Sedan sang trọng, tiện nghi, an toàn và có mức giá vừa phải. ', '5/12/2019',2)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(6,'C-CLASS','MERCEDES-BENZ C 300 AMG', 1969000000,'MERCEDES-BENZ C300 AMG.png',N'
1.GIỚI THIỆU CHUNG:
Trong năm 2018, doanh số bán hàng trên toàn cầu của Mercedes-Benz đã tăng thêm 0,9%, lên mức kỷ lục 2.310.185 xe. Đây cũng là năm thứ 8 liên tiếp doanh số của hãng xe này dẫn đầu phân khúc. Để có mức doanh số kỷ lục này, các phiên bản C-Class thế hệ W205 đóng vai trò vô cùng quan trọng.
Vào năm 2019, Mercedes-Benz tiếp tục trình làng bản nâng cấp của dòng sedan này. Trong đó, Mercedes-Benz C 300 AMG là phiên bản được rất nhiều người quan tâm. Bên cạnh những sự nâng cấp về thiết kế, tiện nghi, phần động cơ cải tiến được đánh giá là đã góp phần giúp Mercedes-Benz C 300 AMG trở thành một mẫu xe đua thật thụ.
2.NGOẠI THẤT:
So với 2 phiên bản Mercedes-Benz C 200 và Mercedes-Benz C 200 Exclusive, Mercedes-Benz C 300 AMG có vẻ ngoài mạnh mẽ hơn đến từ gói ngoại thất thể thao AMG với thiết kế mới. Kết hợp với đó là mâm xe thể thao AMG 18-inch đa chấu hiện đại. Đồng thời, các đường dập nổi trên thân xe càng giúp cho tổng thể Mercedes-Benz C 300 AMG thêm phần cuốn hút. 
Điểm nâng cấp ngoại thất nổi bật nhất trên Mercedes-Benz C 300 AMG chính là nằm ở cụm đèn trước. Theo đó, hãng đã trang bị công nghệ Multi-Beam LED với tầm chiếu xa lên đến 650m và đèn LED ban ngày. Công nghệ chiếu sáng thế hệ mới này không chỉ giúp nâng tầm quan sát của người lái khi di chuyển trong trời tối, mà còn tránh được tình trạng gây chói mắt phương tiện di chuyển ở chiều ngược lại. 
Trong khi đó, cụm đèn sau LED với thiết kế mới với đồ họa sợi quang dạng chữ C lạ mắt. Các chi tiết còn lại, bao gồm: Gương chiếu hậu chống chói tự động; Gương chiếu hậu bên ngoài chỉnh và gập điện; .. không có sự thay đổi trên bản nâng cấp 2019 này.
Danh sách 4 màu ngoại thất sành điệu của Mercedes-Benz C 300 AMG 2019:

   ● Trắng Polar (149)

   ● Đen Obsidian (197)

   ● Xanh Cavansite (890)

   ● Đỏ Hyacinth (996)
3.NỘI THẤT: 
Nội thất của các sản phẩm Mercedes-Benz chưa bao giờ khiến khách hàng phải thất vọng. Với Mercedes-Benz C 300 AMG, chất liệu da cao cấp cùng 2 tùy chọn màu nội thất: Đen (251) hoặc Nâu Saddle (264) sẽ mang đến cảm giác sang trọng, đẳng cấp ngay khi bước vào khoang xe. Đặc biệt, hệ thống đèn viền nội thất được nâng lên thành 64 màu giúp cho người dùng dễ dàng có được không gian nội thất thoải mái nhất.
Ngoài nội thất ốp gỗ Anthracite open-pore oak màu xám và bảng đồng hồ dạng kỹ thuật số với màn hình 12.3-inch, tay lái thể thao 3 chấu bọc da nappa mới cũng là điểm thay đổi đáng chú ý bên trong xe. Nhằm giúp người dùng không bị sao nhãng trong quá trình lái xe, hãng đã tích hợp 2 nút điều khiển cảm ứng trên tay lái (Touch Control Buttons), tính năng ga tự động (Cruise Control) và giới hạn tốc độ (Speedtronic) lên tay lái. 
Chất liệu da ARTICO được bọc ở mặt táp-lô và thành cửa tạo sự đẳng cấp. Cùng với đó là các chi tiết nội thất khác vô cùng tinh tế như đồng hồ xem giờ ở bảng điều khiển trung tâm ốp bệ cửa phát sáng với dòng chữ “Mercedes-Benz” cũng được hãng chăm chút trên phiên bản nâng cấp này. 
4.ĐỘNG CƠ:
Khối động cơ nằm dưới nắp ca-pô thu hút rất nhiều sự quan tâm của người dùng đối với Mercedes-Benz C 300 AMG 2019. Trong khi Mercedes-Benz C 200/ Mercedes-Benz C 200 Exclusive sử dụng động cơ lai (Mild-Hybrid) I4 1.5L thì Mercedes-Benz C 300 AMG được trang bị động cơ I4 2.0L. Tuy nhiên, cả 2 loại động cơ đều dùng tăng áp với đường nạp kép (twin-scroll).
Nhờ sở hữu khối động cơ khủng, xe có công suất cực đại đạt 190 kW [258 hp] tại 5800-6100 vòng/phút và mô-men xoắn cực đại đạt 370 Nm tại 1800 - 4000 vòng/phút. Ngoài ra, sự thay đổi này cũng giúp xe tăng tốc 0 -100 km/h trong vòng 5,9 giây và độ nhạy tốt hơn.
Chưa dừng lại ở đó, xe còn được trang bị hệ thống treo DYNAMIC BODY CONTROL với 3 chế độ: “Sport” và “Sport+” và “Comfort”. Đồng thời, hệ thống ống xả của Mercedes-Benz C 300 AMG 2019 còn có khả năng tạo ra những âm thanh giòn giã liên hồi, thậm chí có thể tạo ra hiệu ứng “Back-Fire” khi sang số ở tua máy cao. Vì thế, nhiều chuyên gia đánh giá Mercedes-Benz C 300 AMG sau khi nâng cấp dường như đã trở thành một mẫu xe thể thao thực thụ.
5.AN TOÀN VÀ TIỆN NGHI:
Không chỉ nâng cấp về thiết kế và động cơ, Mercedes-Benz C 300 AMG 2019 còn ghi điểm với khách hàng về cả an toàn lẫn tiện nghi.
4.1 AN TOÀN:
Mercedes-Benz luôn được đánh giá cao về các công nghệ an toàn. Các công nghệ nổi bật trên Mercedes-Benz C 300 AMG bao gồm: Hệ thống hỗ trợ đỗ xe chủ động Active Parking Assist tích hợp PARKTRONIC; Chức năng cảnh báo mất tập trung ATTENTION ASSIST; Hệ thống chống bó cứng phanh ABS; Hỗ trợ lực phanh khẩn cấp BAS; Chống trượt khi tăng tốc ASR; Ổn định thân xe điện tử ESP; Hệ thống ESP® Curve Dynamic Assist giúp hỗ trợ ổn định khi vào cua; Hệ thống phanh ADAPTIVE với chức năng hỗ trợ dừng xe (HOLD) và hỗ trợ khởi hành ngang dốc (Hill-Start Assist)...
4.2 TIỆN NGHI:
Bên cạnh những tiện nghi có sẵn trên phiên bản cũ như: Hệ thống dẫn đường & định vị vệ tinh toàn cầu GPS tích hợp bản đồ Việt Nam; Touchpad điều khiển cảm ứng trên bệ trung tâm; Cổng kết nối truyền thông đa phương tiện phía dưới tựa tay trung tâm; Hệ thống âm thanh vòm Burmester® 13 loa, công suất 590W; Điều hòa khí hậu tự động 3 vùng THERMOTRONIC... Mercedes-Benz C 300 AMG còn được bổ sung hàng loạt các tiện nghi mới: Hệ thống giải trí đa phương tiện với màn hình giải trí 10.25-inch, bộ thu sóng phát thanh và kết nối Bluetooth ; Chức năng kết nối Apple Carplay và Android Auto; Chức năng sạc không dây cho điện thoại thông minh.
Với những cải tiến mới, Mercedes-Benz C 300 AMG bản nâng cấp 2019 được đánh giá không chỉ trở thành một mẫu xe thể thao thực thụ mà còn đáp ứng tốt hơn nhu cầu của người dùng. Vì thế, phiên bản này được kỳ vọng sẽ giúp C-Class cũng như Mercedes-Benz tiếp tục dẫn đầu phân khúc trong thời gian sắp tới. 
','04/10/2021',2)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(7,'CLA','MERCEDES-BENZ CLA 250',1869000000,'MERCEDES-BENZ CLA 250.png',N'
1.GIỚI THIỆU CHUNG:
Mercedes-Benz CLA ra mắt thị trường lần đầu tiên vào năm 2014 và được định vị là một chiếc “tiểu CLS”. Nhìn tổng quan, mẫu Coupe Mercedes-Benz CLA thừa hưởng đường nét thiết kế uyển chuyển từ đàn anh Mercedes-Benz CLS nhưng nhỏ gọn và có giá bán “dễ chịu” hơn. Vì vậy, chỉ sau một năm được giới thiệu, đã có hơn 100.000 chiếc Mercedes-Benz CLA đến tay giới đam mê ô tô tại nhiều quốc gia trên thế giới. Người đứng đầu hãng xe Mercedes-Benz tại Mỹ từng chia sẻ rằng, Mercedes-Benz CLA là mẫu xe tuyệt vời nhất của hãng trong 20 năm trở lại đây và là biểu tượng thành công ngoài mong đợi.
Cùng với những “thành viên” trong đại gia đình Mercedes-Benz CLA, phiên bản Mercedes-Benz CLA 250 đã nhanh chóng gây ấn tượng mạnh mẽ ngay khi chính thức trình làng thị trường Việt. Bởi, tổng thể xe là sự hài hòa giữa phong cách trẻ trung, thanh lịch cùng khối động cơ bên trong mạnh mẽ. Đây được đánh giá là một trong những mẫu Coupe 4 cửa đáng sở hữu nhất hiện nay.
2.NGOẠI THẤT:
Mercedes-Benz CLA 250 có chiều dài cơ sở là 2699 mm, kích thước dài x rộng x cao tương ứng 4.640 x 1.777 x 1.436 mm. Với kích thước nhỏ gọn, CLA 250 luôn gây chú ý mỗi khi xuất hiện, đặc biệt rất phù hợp để di chuyển trong các khu nội thị đông dân, hay kẹt xe như TP. HCM, Hà Nội.
Giống như các phiên bản khác thuộc dòng Mercedes-Benz CLA, CLA 250 sở hữu thiết kế nổi bật, đậm chất khí động học với những đường gân dập nổi mạnh mẽ. Điểm nhấn thu hút là cụm đèn trước Full-LED tích hợp dải đèn LED chiếu sáng ban ngày. Lưới tản nhiệt họa tiết kim cương 1 nan lớn mạ chrome sáng bóng với logo ngôi sao 3 cánh ở vị trí trung tâm.
Thiết kế hốc gió dạng lưới, có kích thước lớn, mang lại sự phá cách và mạnh mẽ hơn ở phần đầu xe. Trên nắp ca pô là 4 đường gân dập nổi chạy dọc xuống lưới tản nhiệt, khắc họa rõ nét tố chất thể thao, năng động của giới trẻ.
Thân xe được trau chuốt bắt mắt hơn với 2 đường nét uyển chuyển song song kéo dài từ hốc bánh trước đến hốc bánh sau. Phía dưới là mâm xe hợp kim thể thao 18-inch 5 chấu kép cứng cáp. Ngoài ra, Mercedes-Benz CLA 250 còn được trang bị gương chiếu hậu với tính năng chống chói, điều chỉnh điện, gập điện và đèn báo rẽ.
Tiến về đuôi xe, phiên bản này gây ấn tượng mạnh với cản sau thiết kế theo kiểu dáng thể thao AMG. Cụm đèn hậu công nghệ LED thiết kế bo tròn sắc sảo và chụp ống xả kép mạ chrome tích hợp dưới cản sau.
Hiện nay, CLA 250 đang có các màu:

-         Đen cosmos (191).

-         Đỏ Jupiter (589).

-         Trắng Cirrus (650).

-         Đen Night (696).

-         Bạc Polar (761).

-         Xám Mountain (787).

-         Nâu Orient (990).

-         Xanh Cavansite (890).
3.NỘI THẤT:
Tiện nghi, sang trọng và hoàn hảo là 3 mỹ từ dành tặng cho nội thất của Mercedes-Benz CLA 250. Cũng giống như A-Class, phiên bản này có không gian bên trong khá thoải mái nhờ cách bố trí các trang bị khoa học, thiết kế mở với cửa sổ Panorama chỉnh điện. Đèn viền có thể điều chỉnh độ sáng cũng như màu sắc.
Toàn bộ trang thiết bị được ốp nhôm cao cấp tạo cảm giác sang trọng và bắt mắt hơn cho khoang nội thất. Bàn đạp thể thao ốp thép không gỉ, vô lăng 3 chấu bọc da Nappa, bảng táp-lô và thành cửa bọc da ARTICO với đường viền trang trí màu đỏ nổi bật đem đến cảm giác năng động, mạnh mẽ hơn cho Mercedes-Benz CLA 250.
Phong cách thể thao năng động, mạnh mẽ của CLA 250 còn được thể hiện rõ qua bảng đồng hồ dạng 2 ống với kim màu đỏ và viền mạ chrome màu bạc sáng bóng. Ở trung tâm là màn hình hiển thị đầy đủ các thông số hoạt động của xe giúp người điều khiển có thể nắm rõ những thông tin cần thiết.
4.ĐỘNG CƠ:
Nằm trong phân khúc xe ô tô cỡ nhỏ nhưng Mercedes-Benz CLA 250 sở hữu động cơ vượt trội. Xe được trang bị động cơ I4 với công suất cực đại 155kw tại 5500 vòng/phút. Mô-men xoắn cực đại 350 Nm tại 1200-4000 vòng/phút. Toàn bộ lực kéo được truyền đến 2 bánh trước qua hộp số 7 cấp ly hợp kép 7G-DCT. Với những trang bị này, xe có thể đạt vận tốc tối đa 240km/h và tăng tốc 0-100km/h chỉ trong 6,6 giây - một con số mà các tay lái đều hài lòng và cảm thấy phấn khích sau khi trải nghiệm.
Nhìn chung các trang bị về vận hành như hộp số, động cơ, vi sai… của Mercedes-Benz CLA 250 đều không thay đổi so với bản cũ nhưng đã được tối ưu để tăng hiệu quả vận hành. Minh chứng cụ thể nhất cho điều này là chân ga nhạy hơn, hộp số DCT sang số dứt khoát và mượt hơn, nhờ đó xe có thể tăng tốc nhanh mà vẫn cực đầm chắc và ổn định.
5.AN TOÀN VÀ TIỆN NGHI:
Mercedes-Benz CLA 250 trang bị đầy đủ tiện nghi, an toàn hiện đại và đáp ứng đầy đủ các tiêu chí cần có của một mẫu xế hộp hạng sang.
5.1 AN TOÀN:
Đồng hành với Mercedes-Benz CLA 250, người lái hoàn toàn yên tâm trên mọi nẻo đường bởi mẫu xe này có sự hiện diện của hàng loạt công nghệ đảm bảo an toàn bậc nhất của hãng xe Đức. Đó là hệ thống lái Direct-Steer giúp hỗ trợ đánh lái thoải mái, chính xác và an toàn. Hệ thống chống bó cứng phanh ABS, hỗ trợ động lực phanh khẩn cấp BAS, chống trượt khi tăng tốc ASR, ổn định thân xe điện tử ESP.
Bên cạnh đó, Mercedes-Benz CLA 250 còn được trang bị camera lùi giúp người lái có thể quan sát phía sau dễ dàng hơn khi lùi hay đỗ xe. Các túi khí cho người lái và hành khách phía trước có công dụng bảo vệ phần thân trên và đầu trong trường hợp xảy ra va chạm.
Đặc biệt, ở phiên bản này còn trang bị chức năng cảnh báo mất tập trung ATTENTION ASSIST giúp cảnh báo các trường hợp sắp va chạm. Tính năng ECO start/stop tự động ngắt động cơ khi xe tạm dừng giúp giảm thiểu mức tiêu hao nhiên liệu và khí xả. Đây là những ưu thế giúp Mercedes-Benz CLA 250 ghi điểm với người tiêu dùng.
5.2 TIỆN NGHI:
Mercedes-Benz CLA 250 không chỉ thể hiện đẳng cấp của chủ nhân mà còn làm hài lòng mọi hành khách bên trong nhờ sự tiện nghi hàng đầu cùng nhiều tính năng thông minh. Cụ thể, ghế người lái và ghế hành khách phía trước có thể điều chỉnh điện dễ dàng (xa/gần, độ cao của ghế, độ nghiêng mặt ghế, đệm đỡ lưng), tích hợp bộ nhớ 3 vị trí cho ghế lái, tay lái và gương chiếu hậu bên ngoài.
Mercedes-Benz CLA 250 sở hữu hệ thống giải trí với đầu đọc CD, màn hình màu TFT 8-inch, có thể kết nối Bluetooth, Internet... mang đến cho người lái và hành khách sự trải nghiệm tuyệt vời, đúng chuẩn xe hạng sang.
Ngoài ra, dòng xe này còn trang bị các tính năng nổi bật như hệ thống sưởi cho hàng ghế trước, điều hòa khí hậu tự động đa vùng THERMOTRONIC cho phép tùy chỉnh nhiệt độ tại từng vị trí ngồi, đồng hồ hiển thị nhiệt ngoài trời.
Sự ra đời của Mercedes-Benz CLA 250 hứa hẹn sẽ khiến không ít đối thủ trong cùng phân khúc phải dè chừng. Bởi phiên bản này hội tụ đầy đủ tinh hoa công nghệ, sự cá tính từ ngoại nội thất nhưng vẫn toát lên sự sang trọng, thanh lịch đặc trưng của thương hiệu ngôi sao 3 cánh. Không chỉ vậy, những trải nghiệm lái đầy cảm xúc từ Mercedes-Benz CLA 250 chắc chắn sẽ mang đến cho khách hàng hứng khởi tuyệt vời theo từng chuyển động.
', '10/12/2020',3)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(8,'CLA', 'MERCEDES-BENZ CLA 200', 1529000000, 'MERCEDES-BENZ CLA 200.png',N'
1.GIỚI THIỆU CHUNG:
Cuối năm 2014, hãng Mercedes-Benz cho ra mắt dòng xe thể thao Mercedes-Benz CLA Coupe 4 cửa nhập khẩu nguyên chiếc tại thị trường Việt Nam với 3 phiên bản: Mercedes-Benz CLA 200, Mercedes-Benz CLA 250 4MATIC và Mercedes-Benz CLA 45 AMG. Chỉ sau một thời gian ngắn ra mắt, dòng xe nhanh chóng nhận được sự chú ý của khách hàng. Trong đó phải kể đến là Mercedes-Benz CLA 200, đây là phiên bản tiêu chuẩn và có mức giá vô cùng hợp lý. Thế nhưng, những gì mà mẫu xe này thể hiện khiến khách hàng phải bất ngờ.
Mercedes-Benz CLA 200 là mẫu xe thể thao cỡ nhỏ có thiết kế trẻ trung, sang trọng và động cơ vượt trội. Đến tháng 10/2016, hãng Mercedes-Benz đã nâng cấp thêm các chi tiết mang đến sự tiện nghi, hiện đại và thể thao hơn cho mẫu xe này.
2.NGOẠI THẤT:
Mercedes-Benz CLA 200 thế hệ mới khoác trên mình phong cách vô cùng độc đáo và đầy thu hút. Mẫu xe sở hữu vóc dáng gọn gàng và linh hoạt với kích thước tổng thể dài x rộng x cao lần lượt là 4630 x 1777 x 1432 (mm).
Cụm lưới tản nhiệt với họa tiết kim cương ánh đen ôm lấy logo ngôi sao 3 cánh Mercedes-Benz được đặt ở chính giữa mang đến một vẻ đẹp tinh tế, sang trọng. Xe còn được trang bị cụm đèn trước Full-LED tích hợp đèn chiếu sáng ban ngày thu hút.
Thân xe ấn tượng với thiết kế sắc cạnh cùng những đường gân dập nổi đầy mạnh mẽ, tạo vẻ ngoài trẻ trung và cá tính cho Mercedes-Benz CLA 200. Bên cạnh đó, thiết kế mâm xe 18,5 inch chấu kép màu xám Himalayas khiến mẫu Coupe đẳng cấp này dù xuất hiện ở đâu cũng “tỏa sáng” rực rỡ bởi vẻ ngoài hoàn mỹ.
Đuôi xe nhô lên khá cao với điểm nhấn là cụm ống xả thiết kế mạnh mẽ. Cụm đèn hậu công nghệ LED được thiết kế sắc cạnh, giúp người lái quan sát mọi thứ xung quanh khi đang di chuyển. Ở phần cốp xe, sự kết hợp hài hòa của phần mui vuốt từ trên xuống và ống xả kép hình chữ nhật ở hai bên xe tạo nên diện mạo mới lạ cho Mercedes-Benz CLA 200.
Mercedes-Benz CLA 200 hiện có các màu sắc đa dạng như:

- Đen Cosmos (191).

- Đỏ Jupiter (589).

- Trắng Cirrus (650).

- Đen Night (696).

- Bạc Polar (761).

- Xám Mountain (787).

- Nâu Orient (990).

- Xanh Cavansite (890).
3.NỘI THẤT:
Với chiều dài cơ sở lên đến 2.699 mm, Mercedes-Benz CLA 200 cung cấp cho người dùng không gian ngồi khá rộng rãi. Bên cạnh đó, xe còn trang bị ghế ngồi bọc da cao cấp và sang trọng mang đến cảm giác thật thoải mái và thư giãn.
Cụm điều khiển ở vị trí trung tâm của Mercedes-Benz CLA 200 rất khoa học và vừa tầm tay người lái. Vô lăng đa chức năng 3 chấu bọc da với chỉ khâu tương phản tạo cảm giác năng động, mạnh mẽ. Các phím bấm điều khiển được tích hợp trên vô lăng, được nhiều người đánh giá khá thuận tiện khi sử dụng. Bảng đồng hồ được thiết kế dạng ống xả với 2 ống có kim màu đỏ nổi bật.
Mercedes-Benz CLA 200 hiện có các màu nội thất sau:

- Màu đen (151).

- Vàng beige Sahara (155).

- Xám Crystal (158).
4. ĐỘNG CƠ:
Phiên bản Mercedes-Benz CLA 200 được trang bị động cơ I4, công suất cực đại 156 mã lực tại vòng tua 5300 vòng/phút và mô–men xoắn cực đại 250Nm tại dải vòng tua 1250 - 4000 vòng/phút. Hộp số tự động 7 cấp ly hợp kép 7G-DCT và dẫn động cầu trước giúp xe tăng tốc 0-100 km/h chỉ trong vòng 8,2 giây khá mượt mà và vận tốc tối đa lên đến 230km/h.
Xe được trang bị 3 chế độ lái E (Economy) – S (Sport) – M (Manual). Trong đó, chế độ lái Economy tiết kiệm nhiên liệu phù hợp với việc di chuyển trong thành phố, chế độ S thể thao cho bạn trải nghiệm tốc độ và chế độ M cho những “tay lái cứng” yêu thích việc điều khiển ga-số. Ngoài ra, Mercedes-Benz CLA 200 có mức tiêu thụ nhiên liệu rất tiết kiệm, chỉ 6,0 lít/100km khi di chuyển trên cung đường kết hợp. Đặc biệt, với chức năng ECO start/stop tự ngắt động cơ khi xe tạm dừng càng giúp giảm thiểu tiêu hao nhiên liệu và khí xả.
5.AN TOÀN VÀ TIỆN NGHI:
5.1 AN TOÀN:
CLA 200 được trang bị an toàn với các tính năng nổi bật giúp người lái an tâm và thoải mái khi sử dụng. Cụ thể như hệ thống lái Direct-Steer trợ lực điện và tỉ số truyền lái biến thiên theo tốc độ giúp hỗ trợ đánh lái chính xác và an toàn; hệ thống hỗ trợ đỗ xe chủ động; hệ thống chống bó cứng phanh ABS; chống trượt khi tăng tốc ASR; hỗ trợ lực phanh khẩn cấp BAS; ổn định thân xe điện tử ESP; hệ thống phanh ADAPTIVE… Ngoài ra, Mercedes-Benz CLA 200 còn có chức năng cảnh cảnh báo mất tập trung ATTENTION ASSIST giúp cảnh báo khi người lái rơi vào tình trạng mất tập trung, ngủ gật hoặc xe di chuyển không đúng làn đường.
5.2 TIỆN NGHI:
Mercedes-Benz CLA 200 hỗ trợ các thiết bị giải trí đa dạng với đầu đĩa CD 6 đĩa, màn hình màu TFT 5,8 inch thiết kế kiểu máy tính bảng trẻ trung, bộ thu sóng phát thanh, kết nối Bluetooth, cổng kết nối truyền thông đa phương tiện, hỗ trợ các thiết bị giải trí di động,...
Xe được trang bị ghế lái và ghế hành khách phía trước có thể điều chỉnh độ cao, xa/gần, độ nghiêng mặt ghế hay đệm đỡ lưng, tích hợp bộ nhớ 3 vị trí. Hàng ghế sau có thể gập lại theo tỷ lệ 60:40 linh hoạt, giúp mở rộng khoang hành lý khi cần.
Ngoài ra, xe còn có một số tính năng tiện nghi nổi bật khác như, hệ thống điều hòa khí hậu đa vùng giúp không khí bên trong xe luôn được thông thoáng, đồng hồ hiển thị nhiệt độ ngoài trời,…
Trong thị trường xe hơi hiện nay, Mercedes-Benz CLA 200 là một trong những mẫu xe Coupe nổi tiếng của hãng Mercedes-Benz được nhiều khách hàng ưa chuộng. Với vẻ ngoài phong cách thể thao độc đáo, nội thất tiện nghi nổi bật cùng động cơ vô cùng mạnh mẽ, Mercedes CLA 200 là sự lựa chọn tuyệt vời cho những khách hàng trẻ tuổi, ưa chuộng trải nghiệm sang trọng.
', CAST(0x95450000 AS SmallDateTime),3)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(9,'CLA', 'MERCEDES-BENZ CLA 250 4MATIC', 1949000000, 'MERCEDESS-BENZ CLA 250 4MATIC.png',N'
1.GIỚI THIỆU CHUNG:
Ngay từ khi ra mắt vào năm 2014, Mercedes-Benz CLA 250 4MATIC đã lập tức trở thành tâm điểm khi trình làng với ngoại hình ấn tượng và động cơ vượt trội. Là một chiếc Coupe 4 cửa, phiên bản này vừa giữ nét sang trọng vừa đảm bảo hiệu năng vận hành và tiết kiệm nhiên liệu. Đây cũng là một trong những phiên bản Mercedes-Benz CLA đang được hãng phân phối chính thức tại thị trường Việt Nam.
2.NGOẠI THẤT:
Phần đầu xe đậm chất thể thao, khỏe khoắn với cụm đèn trước Full-LED tích hợp đèn LED chiếu sáng ban ngày. Lưới tản nhiệt với họa tiết kim cương mạ chrome kết hợp cùng logo 3 cánh nổi bật ở chính giữa. Không chỉ có cản trước thiết kế kiểu thể thao AMG, nắp capo của xe còn có 4 đường dập nổi vô cùng độc đáo và cá tính.
Mercedes-Benz CLA 250 4MATIC có ngoại hình thon gọn với kích thước dài x rộng x cao lần lượt là 4640 x 1777 x 1436mm, chiều dài cơ sở đạt 2699mm. Thân xe ấn tượng với những đường gân dập nổi. Song song đó là bộ mâm hợp kim 18 inch 5 chấu kép, kết hợp cùng lốp xe runflat cho phép bám đường tốt, bo cua mượt mà. Ngoài ra, hông xe còn có đường kim loại sáng bóng chạy dọc dưới cánh cửa xe, kéo từ vòm bánh trước đến vòm bánh sau giúp tạo điểm nhấn.
Mercedes-Benz CLA 250 4MATIC nổi bật với thiết kế mới mẻ ở phần đuôi xe. Cụm đèn hậu công nghệ LED được tách riêng với thiết kế dạng nan quạt rất đặc sắc. Cản sau của xe có kiểu dáng thể thao AMG tích hợp cụm ống xả dạng kép đối xứng. Tất cả đã tạo nên một vẻ ngoài đầy mạnh mẽ và lôi cuốn cho mẫu xe.
3.NỘI THẤT:
Không gian bên trong của Mercedes-Benz CLA 250 4MATIC khá rộng và thông thoáng. Tất cả các ghế đều được bọc da, thiết kế kiểu dáng ôm sát thân, giúp người ngồi luôn có tư thế thoải mái. Nội thất xe còn được thiết kế mở với cửa sổ trời Panorama chỉnh điện. Ngoài ra xe còn có đèn viền nội thất 12 màu có thể điều chỉnh màu và độ sáng, dễ dàng cá nhân hoá theo sở thích người dùng.
Mặt táp-lô và thành cửa của xe được bọc da ARTICO với đường viền chỉ trang trí sang trọng. Hầu hết các chi tiết ở khu vực cụm điều khiển đều được ốp nhôm Trapezium-grain cao cấp cùng cửa gió điều hòa được mạ chrome. Bên cạnh đó, xe còn sử dụng vô lăng 3 chấu bọc da Nappa êm ái và giúp người lái cầm chắc tay. Điểm nhấn là bảng đồng hồ được thiết kế dạng 2 ống với kim màu đỏ, mang đến cảm giác năng động, mạnh mẽ.
Mercedes-Benz CLA 250 4MATIC hiện có các màu nội thất sau:

-          Đen (801).

-          Nâu Nut (804).

-          Xám Crystal (808).
4.ĐỘNG CƠ:
Mercedes-Benz CLA 250 4MATIC là phiên bản mạnh thứ hai sau Mercedes-AMG CLA 45 4MATIC. Xe được trang bị động cơ I4 2.0 lít, công suất cực đại là 155 kW tại 5.500 vòng/phút và mô men xoắn cực đại 350 Nm 1200 - 4000 vòng/phút. Với hộp số tự động 7 cấp ly hợp kép dẫn động 4 bánh toàn thời gian 4MATIC, cho phép xe tăng tốc từ 0-100km/h chỉ trong vòng 6,5s với vận tốc tối đa lên đến 240km/h. Xe có mức tiêu thụ nhiên liệu khá tiết kiệm, chỉ 6,4 lít cho 100km trên cung đường hỗn hợp.
Nhờ hệ thống lái Direct-Steer thể thao trợ lực điện với trợ lực và tỉ số truyền lái biến thiên theo tốc độ, Mercedes-Benz CLA 250 4MATIC đem lại cảm giác lái tối ưu cũng như hỗ trợ đánh lái thoải mái, chính xác cho khách hàng. Chưa dừng lại ở đó, với chức năng ECO start/stop tự động ngắt động cơ khi xe tạm dừng, phiên bản này còn có khả năng tiết kiệm nhiên liệu tối ưu khi chạy đường trường.
5.AN TOÀN VÀ TIỆN NGHI:
5.1 AN TOÀN:
Mercedes-Benz CLA 250 4MATIC được trang bị hàng loạt các công nghệ đảm bảo an toàn tiêu chuẩn của hãng như: chống bó cứng phanh ABS, hỗ trợ lực phanh khẩn cấp BAS, camera lùi,... Trong đó nổi bật là chức năng cảnh báo mất tập trung ATTENTION ASSIST và hệ thống hỗ trợ đỗ xe chủ động Active Parking Assist tích hợp PARKTRONIC:
- ATTENTION ASSIST: Đây là hệ thống cảnh báo khi người lái rơi vào tình trạng mất tập trung, ngủ gật hoặc xe di chuyển không đúng làn đường. Hệ thống này sẽ liên tục theo dõi mức độ tập trung của tài xế và cố gắng giữ cho họ tỉnh táo cho đến khi quyết định dừng xe để tạm nghỉ ngơi.
- Hệ thống hỗ trợ đỗ xe tự động Active Parking Assist tích hợp PARKTRONIC: Hệ thống sẽ vận hành từ bước dò tìm chỗ trống phù hợp để đỗ xe đến tự động điều khiển vô lăng để di chuyển xe vào. Với tính năng này, việc đỗ xe giờ đây sẽ trở nên an toàn hơn, kể cả trong trường hợp cần đỗ xe song song hoặc đỗ xe vuông góc.
5.2 TIỆN NGHI:
Bên cạnh các công nghệ an toàn, Mercedes-Benz CLA 250 4MATIC còn sở hữu hệ thống giải trí hàng đầu như đầu đĩa CD 6, màn hình màu TFT 8 inch, bộ thu sóng phát thanh, radio, bluetooth,.. Đặc biệt, cổng kết nối đa phương tiện dưới tựa tay trung tâm có chức năng hỗ trợ các thiết bị giải trí và kết nối thiết bị bên ngoài dễ dàng.
Bên cạnh đó, Mercedes-Benz CLA 250 4MATIC còn tích hợp nhiều tiện nghi đẳng cấp khác nhằm mang đến trải nghiệm thư giãn tuyệt vời nhất cho khách hàng, bao gồm hệ thống sưởi, hệ thống điều hòa khí hậu một vùng, đồng hồ hiển thị nhiệt độ ngoài trời,... Ngoài ra, phiên bản này còn cung cấp các trang bị tùy chọn giúp khách hàng nâng cao tiện nghi cho bên trong xe.
So với các đối thủ cùng phân khúc,  Mercedes-Benz CLA 250 4Matic không chỉ vượt trội về ngoại hình mà còn sở hữu khả năng vận hành bền bỉ cùng nhiều trang bị hàng đầu. Với người trẻ thành đạt, đây sẽ là một mẫu xe hàng đầu để thể hiện cá tính bản thân.', '01/10/2021',3)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(10,'GLA','MERCEDES-BENZ GLA 200', 1619000000, 'MERCEDES-BENZ GLA 200.png',N'
1.GIỚI THIỆU CHUNG:
Tính đến thời điểm hiện tại, Mercedes-Benz GLA 200 đang là phiên bản có mức giá rẻ nhất trong “đại gia đình” SUV của Mercedes-Benz. Được phát triển dựa trên cảm hứng của dòng hatchback A-class, Mercedes-Benz GLA 200 cuốn hút ngay từ cái nhìn đầu tiên bởi dáng dấp khỏe khoắn, năng động nhưng không kém phần thanh lịch.
Trong những năm gần đây, hãng xe Đức không ngừng nâng cấp các phiên bản Mercedes-Benz GLA, mang tới một diện mạo linh hoạt và chuyển động mượt mà hơn. Và Mercedes-Benz GLA 200 cũng không ngoại lệ. Cụ thể, bản facelift mới nhất của mẫu xe này được trình làng tại Vietnam Motor Show (VMS) 2017 có nhiều cải tiến mới, bắt mắt, sang trọng và đậm chất khí động học. Phiên bản mới hứa hẹn sẽ tạo nên một cơn sốt mới trong phân khúc SUV hạng sang cũng như tăng sức ép lên các đối thủ cạnh tranh về cả tính năng tiện ích lẫn giá thành.
2.NGOẠI THẤT:
Hiện diện với dáng dấp vô cùng chắc chắn kết hợp phong cách hiện đại, Mercedes-Benz GLA 200 nổi bật ở mọi góc nhìn. Phần đầu xe gây sự chú ý bởi lưới tản nhiệt 2 nan đục lỗ phá cách tương tự như “đàn anh” GLS. Đây là điểm nhấn nhá tạo nên sự khác biệt và tăng cường hiệu quả khí động học mà các tay lái dễ dàng nhận ra.
Sự vạm vỡ ở đầu xe còn được tạo nên từ hốc gió cỡ lớn cùng cản trước mạ chrome sáng bóng. Nếu thế hệ cũ sử dụng cụm đèn trước Bi-xenon thì ở phiên bản Mercedes-Benz GLA 200 mới được trang bị cụm đèn LED toàn phần, tích hợp chiếu sáng ban ngày và tự động điều chỉnh tầm chiếu xa. Sự cải tiến này không chỉ tạo nên sự hài hòa trong tổng thể mà còn là một lợi thế cạnh tranh so với các đối thủ trong cùng phân khúc.
Phần hông xe cũng được trau chuốt với những đường nét uyển chuyển, nhẹ nhàng. Theo đó, đuôi xe cũng được thiết kế lại với cụm đèn hậu bo tròn, hai sợi quang song song, vuông vức tích hợp hiệu ứng pha lê cuốn hút. Cản sau vuốt cao khắc họa rõ nét DNA các mẫu xe địa hình nhà Mercedes-Benz. Vòm bánh xe Mercedes-Benz GLA 200 mở rộng, Mâm xe cỡ lớn 18-inch 5 chấu đơn, uốn cong như khẳng định thêm phong cách “cơ bắp” mà hãng xe Đức đang theo đuổi ở mẫu xe này.
Điểm nhấn ấn tượng trong Mercedes-Benz GLA 200 còn được hãng xe Đức khéo léo thể hiện qua các chi tiết mạ chrome như 2 ống xả, ống bệ cửa sau, nẹp dưới cửa sổ bên. Trên nóc xe là giá để đồ bằng hợp kim nhôm – một trang bị thường thấy trong các dòng SUV đa dụng.
3.NỘI THẤT:
Xe sở hữu kích thước dài x rộng x cao lần lượt là 4424 x 1804 x 1494 (mm), chiều dài cơ sở 2699 (mm). Cùng với đó, nhờ cách bố trí các trang bị nội thất một cách khoa học, mỗi chuyến đồng hành cùng Mercedes-Benz GLA 200 đều là một trải nghiệm thú vị và thoải mái nhất.
Nội thất Mercedes-Benz GLA 200 có nhiều điểm tương đồng với Mercedes-Benz GLC. Chất sang trọng đặc trưng được phô trương qua ghế bọc da thượng hạng và các chi tiết ốp nhôm Trapeze Cut cao cấp. Hệ thống đèn viền nội thất 12 màu Ambient Lighting mang lại một không gian lung linh và huyền ảo hơn, nhất là vào ban đêm.
Ở phiên bản này, Mercedes-Benz còn nhấn mạnh vào sự tiện dụng của khoang hành lý. Với thể tích chứa lớn, khoang hành lý luôn có chỗ cho mọi vật dụng của bạn trong những chuyến đi xa hay cho nhu cầu mua sắm hàng ngày. Đặc biệt, việc đóng mở khoang hành lý cũng trở nên vô cùng dễ dàng, chỉ cần một nút bấm nhờ tích hợp chức năng EASY-PACK.
Nằm chễm chệ trong khoang cabin là vô lăng 3 chấu đa chức năng được bọc da, tích hợp các nút bấm tiện nghi. Phía sau vô lăng là bảng đồng hồ dạng 2 ống sắc nét. Như vậy, với một không gian nội thất rộng rãi, nhiều tính năng hỗ trợ tiên tiến chắc chắn sẽ giúp bạn loại bỏ mọi căng thẳng khi lái xe.
4.ĐỘNG CƠ:
Khởi hành chuyến phiêu lưu cùng GLA, bạn sẽ cảm nhận được sức mạnh ẩn bên trong. Mercedes-Benz GLA 200 sử dụng động cơ I4, dung tích 1595 cc, có công suất cực đại 156 mã lực tại 5300 vòng/phút, mô-men xoắn cực đại 250 Mn tại 1250-4000 vòng/phút. Kết hợp với đó là hộp số tự động 7 cấp ly hợp kép 7G-DCT, hệ dẫn động cầu trước.
Qua trải nghiệm lái thực tế, Mercedes-Benz GLA 200 tỏ rõ tố chất của một mẫu SUV thể thao. Xe vận hành khá êm ái, ổn định trong nội thành cũng như cực đầm chắc trên những cung đường đèo dốc. Theo số liệu của nhà sản xuất, xe có thể tăng tốc từ 0-100 km/h chỉ trong 8,4 giây và đạt vận tốc tối đa 215 km/h.
Cảm giác lái Mercedes-Benz GLA còn được cá nhân hóa nhờ cụm điều khiển DYNAMIC SELECT cho phép bạn lựa chọn 4 chế độ lái khác nhau như: “Comfort”, “Sport”, “Eco” và “Individual. Chức năng này giúp hiệu chỉnh các thông số của động cơ, hộp số, hệ thống lái và hệ thống treo linh hoạt theo điều kiện mặt đường nhằm tối ưu hiệu quả vận hành và trải nghiệm của người ngồi sau vô lăng. Vì vậy, bạn sẽ cảm thấy khá thích thú ngay từ lần cầm lái đầu tiên.
5.AN TOÀN VÀ TIỆN NGHI:
An toàn và tiện nghi cũng là một trong những yếu tố được đánh giá cao ở mẫu xe này. Mercedes-Benz GLA 200 luôn sẵn sàng cho mọi hành trình với nhiều trang bị hỗ trợ lái, đảm bảo an toàn hiện đại và các tính năng tiện nghi hàng đầu hiện nay.
5.1 AN TOÀN:
Sở hữu Mercedes-Benz GLA 200 đồng nghĩa với việc bạn đang làm chủ một mẫu xế hộp an toàn nhất hiện nay. Xe trang bị hệ thống treo êm ái, giúp ổn định và cân bằng xe trên mọi địa hình. Hệ thống lái trợ lực điện biến thiên theo tốc độ, chức năng cảnh báo mất tập trung ATTENTION ASSIST, hệ thống ESP® Curve Dynamic Assist giúp tránh hiện tượng thiếu lái khi vào cua ở tốc độ cao, hỗ trợ ôm cua chính xác và an toàn.
Ngoài ra, Mercedes-Benz GLA 200 còn trang bị một số công nghệ an toàn như:
- Hệ thống hỗ trợ đỗ xe chủ động Active Parking Assist tích hợp PARKTRONIC.

- Camera lùi hỗ trợ người lái quan sát phía sau khi lùi, đỗ xe.

- Hệ thống chống bó cứng phanh ABS.

- Hệ thống hỗ trợ lực phanh khẩn cấp ASR.

- Hệ thống chống trượt khi tăng tốc ASR.

- Hệ thống ổn định thân xe điện tử ESP.

- Hệ thống phanh ADAPTIVE với chức năng hỗ trợ dừng xe (HOLD) và hỗ trợ khởi hành ngang dốc (Hill-Start Assist).

- Túi khí phía trước, bên hông phía trước, cửa sổ và túi khí đầu gối người lái.

- Chức năng kiểm soát tốc độ Cruise Control với SPEEDTRONIC cho phép điều chỉnh tốc độ tối đa mong muốn.
Với khối động cơ bền bỉ cùng nhiều trang bị đáng giá, Mercedes-Benz GLA 200 là một trợ thủ địa hình đắc lực dành cho những tay lái đam mê khám phá. Hãy để Mercedes-Benz GLA 200 cùng bạn mở lối đi riêng và trở thành “người bạn” đồng hành mỗi ngày!
', '04/12/2018',4)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(11,'GLA','MERCEDES-BENZ GLA 250 4MATIC', 1859000000, 'MERCEDES-BENZ GLA 250 4MATIC.png', N'
1.GIỚI THIỆU CHUNG:
Mercedes-Benz GLA là thành viên thứ 5 thuộc dòng xe SUV của Mercedes-Benz. Theo đó, hãng đã kết hợp hoàn hảo giữa dòng SUV cỡ lớn G-Class và dòng Hatchback A-Class để tạo ra một dòng SUV nhỏ nhưng không kém phần cứng cáp. Ngoài ra, với thiết kế đột phá, Mercedes-Benz GLA được đánh giá là vừa có thể sử dụng để di chuyển hàng ngày trong nội thành, vừa có khả năng vượt địa hình khá tốt. 
Trong khuôn khổ Triển lãm Ô tô Việt Nam lần thứ 13 (VMS 2017) được tổ chức tại Trung tâm Hội chợ và Triển lãm Sài Gòn (SECC), bản nâng cấp Facelift 2018 của Mercedes-Benz GLA chính thức ra mắt khách hàng Việt. Trong đó, phiên bản đại diện cho dòng SUV nhỏ gọn trong sự kiện này chính là Mercedes-Benz GLA 250 4MATIC với màu ngoại thất Vàng Canyon vô cùng cuốn hút.
2.NGOẠI THẤT:
Về tổng quan, Mercedes-Benz GLA 250 4MATIC nói riêng và Mercedes-Benz GLA nói chung đều có vẻ ngoài khá cơ bắp mặc dù thuộc dòng SUV nhỏ gọn với các thông số Dài x Rộng x Cao lần lượt là 4424 x 1804 x 1494 (mm). Theo đó, gờ bánh xe Mercedes-Benz GLA 250 4MATIC mạnh mẽ vắt ngang trên vòm bánh sau, cùng với đó là cột C uốn vào bên trong tạo vẻ năng động. So với các phiên bản Mercedes-Benz GLA khác, Mercedes-Benz GLA 250 4MATIC nổi bật bởi mâm xe thể thao AMG 19 inch 5 chấu 2 màu tương phản độc đáo.
Mặt trước Mercedes-Benz GLA 250 4MATIC cuốn hút với lưới tản nhiệt loại 2 nan đơn được cách điệu đục lỗ ôm trọn logo “ngôi sao 3 cánh” cỡ lớn ở giữa, tạo điểm nhấn và hiệu quả khí động học cho xe. Cụm đèn trước được nâng cấp thành loại LED toàn phần tích hợp đèn chiếu sáng ban ngày và tự động điều chỉnh tầm chiếu xa khiến phần đầu xe thêm tinh tế. Các chi tiết như giá để hành lý bằng hợp kim nhôm kết hợp cùng các tấm ốp cản, ốp gầm làm bật lên DNA địa hình của Mercedes-Benz GLA 250 4MATIC.
Không chỉ cụm đèn trước mà cụm đèn hậu LED cũng được thiết kế lại với hiệu ứng pha lê đẹp mắt được tạo bởi 2 sợi quang song song và vuông vức. Ngoài ra, Mercedes-Benz GLA 250 4MATIC còn sở hữu đèn phanh Adaptive có chức năng nhấp nháy báo hiệu cho phương tiện di chuyển đằng sau khi phanh gấp.
Ngoại thất của Mercedes-Benz GLA 250 4MATIC không chỉ mang đậm chất của hãng xe Đức mà còn khoác lên mình vẻ năng động và tinh thần việt dã. Xe hiện có 10 màu ngoại thất sành điệu, cụ thể:

   ●    Xanh lục Elbaite (175)

   ●    Đen Cosmos (191)

   ●    Đỏ Jupiter (589)

   ●    Trắng Cirrus (650)

   ●    Đen Night (696)

   ●    Bạc Polar (761)

   ●    Xám Mountain (787)

   ●    Xanh Cavansite (890)

   ●    Vàng Canyon (895)

   ●    Nâu Orient (990)
3.NỘI THẤT:
Mặc dù là dòng SUV cỡ nhỏ nhưng Mercedes-Benz GLA 250 4MATIC vẫn cung cấp khoang nội thất thoải mái bởi chiều dài cơ sở đạt 2699mm. Nội thất xe dùng chất liệu bằng da Artico/Dinamica cùng gam màu Đen (651) mạnh mẽ. Đồng thời, khách hàng cũng có thể khiến không gian nội thất trở nên sinh động hơn với 12 tùy chọn màu sắc đến từ hệ thống đèn viền nội thất Ambient Lighting. Ở phía trên là cửa sổ trời siêu rộng Panorama được điều chỉnh đóng hoặc mở bằng điện vô cùng dễ dàng.
Ở khu vực cụm điều khiển, Mercedes-Benz GLA 250 4MATIC sử dụng nội thất ốp nhôm cao cấp. Tay lái thể thao 3 chấu bọc da với chỉ khâu màu tương phản màu đỏ giúp khách hàng cầm lái chắc chắn nhưng không bị khó chịu trong suốt chuyến đi. Cửa gió điều hòa mạ chrome cùng bảng đồng hồ dạng 2 ống làm cho khoang nội thất thêm phần thể thao. 
Hãng Mercedes-Benz đã rất tinh tế khi sử dụng chỉ khâu cùng dây đai an toàn màu đỏ trên nền ghế màu đen để tạo điểm nhấn. Điều này đã khiến cho cabin Mercedes-Benz GLA 250 4MATIC không chỉ mang lại thoải mái mà còn rất thời trang.
Khoang hành lý của xe đạt 481L. Với kích thước này, bạn dễ dàng đựng hành lý khi đi dã ngoại cùng gia đình vào dịp cuối tuần hoặc nghỉ lễ.
4.ĐỘNG CƠ:
Là một chiếc SUV thiên về Off-road, Mercedes-Benz GLA 250 4MATIC sử dụng động cơ I4 với dung tích công tác là 1991cc, từ đó sinh ra công suất cực đại đạt 155 kW [211 hp] tại 5500 vòng/phút và mô-men xoắn cực đại đạt 350 Nm tại 1200 - 4000 vòng/phút. Ngoài ra, hộp số tự động 7 cấp ly hợp kép 7G-DCT cùng hệ dẫn động 4 bánh toàn thời gian 4MATIC giúp xe đạt tốc độ từ 0 – 100 km/h khá nhanh, chỉ trong vòng 6,6 giây cùng vận tốc tối đa là 230km/h.
Mercedes-Benz GLA 250 4MATIC sở hữu khả năng vận hành mượt mà trên nhiều địa hình nhờ có hệ thống treo êm ái kết hợp cùng hệ thống lái trợ lực điện biến thiên theo tốc độ. Ngoài ra, người lái cũng có thể lựa chọn phong cách lái xe theo tình huống bằng cách sử dụng 1 trong 5 chế độ của cụm điều khiển DYNAMIC SELECT là Comfort, Sport, Eco, Off-road hoặc Individual.
5.AN TOÀN VÀ TIỆN NGHI:
5.1 AN TOÀN:
An toàn là một trong những yếu tố được chú ý hàng đầu trên các sản phẩm Mercedes-Benz. Tương tự như các sản phẩm khác, Mercedes-Benz GLA 250 4MATIC cũng sở hữu hàng loạt các công nghệ an toàn tiêu chuẩn như: Chức năng cảnh báo mất tập trung ATTENTION ASSIST; Hệ thống ESP® Curve Dynamic Assist phòng tránh thiếu lái khi vào cua ở tốc độ cao; Hệ thống chống bó cứng phanh ABS; Hỗ trợ lực phanh khẩn cấp BAS; Chống trượt khi tăng tốc ASR; Ổn định thân xe điện tử ESP; Hệ thống ESP® Curve Dynamic Assist giúp tránh hiện tượng thiếu lái khi vào cua ở tốc độ cao;....
Đặc biệt, bản nâng cấp trong năm nay của Mercedes-Benz GLA 250 4MATIC còn được bổ sung thêm Active Parking Assist. Đây là hệ thống hỗ trợ đỗ xe chủ động sử dụng cảm biến siêu âm để tìm không gian đậu xe phù hợp dọc theo bên đường khi người lái chạy xe từ từ. Khi kết hợp cùng camera lùi, việc đỗ xe sẽ trở nên an toàn và dễ dàng hơn.
5.2 TIỆN NGHI:
Ngoài an toàn, bản nâng cấp này còn có những trang thiết bị tuyệt vời, giúp cho những chuyến đi xa không còn buồn chán nữa. Mercedes-Benz GLA 250 4MATIC cung cấp cho khách hàng khoang nội thất tiện nghi với những trang bị hiện đại hàng đầu gồm: Hệ thống âm thanh với đầu đọc CD; màn hình màu TFT 8-inch; Bộ thu sóng phát thanh; Kết nối Bluetooth; Cổng kết nối truyền thông đa phương tiện nằm phía dưới tựa tay trung tâm; Điều hòa khí hậu tự động đa vùng THERMOTRONIC; kiểm soát tốc độ Cruise Control; Hàng ghế phía trước có thể điều chỉnh điện (xa/gần, độ cao ghế, lưng ghế, độ nghiêng mặt ghế, đệm đỡ lưng);...
Kể từ lần đầu chính thức trình làng vào cuối năm 2014, Mercedes-Benz GLA cũng như Mercedes-Benz GLA 250 4MATIC đã khiến các đối thủ cạnh tranh phải e dè khi liên tục sở hữu doanh số tốt, góp phần giúp cho dòng SUV Mercedes-Benz tăng đến 300% trong năm 2016. Với những điểm nâng cấp trong năm 2018, Mercedes-Benz GLA 250 4MATIC được các chuyên gia dự đoán sẽ tiếp tục dẫn đầu phân khúc dòng SUV hạng sang cỡ nhỏ ở thị trường Việt Nam lẫn quốc tế.', CAST(0x93F90000 AS SmallDateTime),4)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(12,'GLC', 'MERCEDES-BENZ GLC 200 FL 2021', 1799000000,'MERCEDES-BENZ GLC 200 FL 2021.png',N'
1.GIỚI THIỆU CHUNG:
Mercedes-Benz GLC là dòng xe thể thao đa dụng, chính thức ra mắt thị trường Việt vào cuối tháng 4/2016. Đây là mẫu xe hạng sang được ưa chuộng và bán chạy nhất tại Việt Nam. Cụ thể, theo thống kê, đến nay có hơn 9.000 chiếc Mercedes-Benz GLC đã giao đến tay khách hàng – một doanh số bán ra khá ấn tượng.
Trong năm 2020, Mercedes-Benz Việt Nam đã cho ra mắt 3 phiên bản Mercedes-Benz GLC mới, gồm: GLC 200, GLC 200 4MATIC và GLC 300 4MATIC. Trong đó, Mercedes-Benz GLC 200 thế hệ mới không chỉ hội tụ những tinh túy ở phiên bản cũ mà còn được nâng cấp mạnh mẽ về thiết kế, sức mạnh động cơ cùng các trang bị hiện đại để trở thành mẫu xe sang trọng, tiện nghi và an toàn bậc nhất.
2.NGOẠI THẤT:
Nếu Mercedes-Benz GLC 200 phiên bản cũ nổi bật bởi các đường nét uyển chuyển và hài hòa thì Mercedes-Benz GLC 200 2020 đã tạo ra một diện mạo mới: nam tính, mạnh mẽ hơn.
Theo đó, cản trước Mercedes-Benz GLC 200 thiết kế mới. Cản trước đục lỗ mạ chrome to bản thể hiện rõ sự vạm vỡ khi nhìn chính diện. Bên trên là lưới tản nhiệt đặc trưng của dòng SUV gồm 2 nan lớn với ngôi sao 3 cánh nổi bật được đặt ở giữa.
Yếu tố tạo nên sự khác biệt cho Mercedes-Benz GLC 200 thế hệ mới chính là cụm đèn trước LED toàn phần với thiết kế 2 tầng, 3 khoang rất sắc sảo cùng dải đèn LED chạy ban ngày được tinh chỉnh trở nên thể thao hơn. Cụm đèn hậu LED có đồ họa sợi quang theo dạng hộp chữ nhật thay vì 2 sọc ngang như trước đây. Thiết kế mới giúp xe trở nên mới lạ và dễ nhận diện hơn khi nhìn từ phía sau.
Ngoài ra, Mercedes-Benz GLC 200 nâng cấp còn được ưu ái trang bị bộ mâm xe 18-inch 5 chấu kép khỏe khoắn. Đây là một trong những điểm nhấn giúp tô điểm ngoại hình xe thêm phần rắn chắc.
3.NỘI THẤT:
Bên trong Mercedes-Benz GLC 200 2020 là một khoang nội thất vô cùng rộng rãi và hiện đại. Xe có kích thước chiều dài x rộng x cao lần lượt là 4670 x 1900 x 1650 mm, chiều dài cơ sở 2873 mm, dài hơn 14mm và rộng hơn 10mm so với phiên bản cũ. Điểm nâng cấp đáng giá này nhằm mang đến sự thoải mái hơn cho mọi hành khách.
Bên cạnh nội thất tinh xảo với các chất liệu da ARTICO cao cấp, gỗ nâu bóng cổ điển và kim loại không gỉ, nội thất Mercedes-Benz GLC còn gây ấn tượng bởi hàng loạt trang bị hiện đại.
Mercedes-Benz GLC 200 nâng cấp được trang bị hệ thống giải trí thế hệ mới MBUX (Mercedes-Benz User Experience) với màn hình cảm ứng 10.25-inch đặt ở trung tâm, cho phép kết nối Bluetooth và có chức năng điều khiển bằng giọng nói LINGUATRONIC – kích hoạt thông qua câu lệnh “Hey, Mercedes”. Bảng đồng hồ dạng 2 ống với màn hình màu 5,5-inch sắc nét. Tay lái thiết kế mới, tích hợp 2 nút điều khiển cảm ứng trên tay lái (Touch Control Buttons), giúp người lái dễ dàng sử dụng các tính năng của xe mà không bị sao nhãng, đảm bảo an toàn tuyệt đối. Ngoài ra, mẫu xe này cũng hỗ trợ kết nối Apple Carplay và Android Auto, vô cùng tiện nghi bạn muốn sử dụng các ứng dụng của điện thoại ngay trên hệ thống đa phương tiện của xe.
Đặc biệt, Mercedes-Benz GLC 200 mới có khoang hành lý có thể tích rất lớn, phù hợp với nhu cầu mang theo nhiều hành lý đồ dùng của gia đình Việt trong những chuyến du lịch hay dã ngoại ngắn ngày.
4.ĐỘNG CƠ:
Mercedes-Benz GLC 200 2020 được trang bị thế hệ động cơ hoàn toàn mới mang mã hiệu M264. Đây là khối động cơ xăng tăng áp đường nạp kép (twin-scroll) 4 xy lanh thẳng hàng, có dung tích 2.0 L. Động cơ sản sinh công suất cực đại 197 mã lực tại 6.100 vòng/phút, mô-men xoắn cực đại 320 Nm tại 1650 – 4000 vòng/phút, mạnh hơn 13 mã lực và 20 Nm so với phiên bản GLC 200 trước đây. 
Kết hợp với đó là hộp số tự động 9G-TRONIC, hệ dẫn động cầu sau giúp xe vận hành mượt mà ngay dải vòng tua thấp nhất, nhờ đó giúp cắt giảm nhiên liệu tiêu thụ tối đa. Theo số liệu của nhà sản xuất, trong điều kiện tiêu chuẩn, Mercedes-Benz GLC 200 2020 có thể tăng tốc nhanh chóng từ 0 – 100 km/h chỉ trong 7,8 giây và đạt vận tốc cực đại là 217 km/h.
Ngoài ra, qua trải nghiệm thực tế khi cầm lái, Mercedes-Benz GLC 200 nâng cấp tỏ ra rất bền bỉ và đầm chắc. Hệ thống lái Direct-Steer trợ lực điện với trợ lực và tỉ số truyền lái biến thiên theo tốc độ cho cảm giác lái êm ái, chắc chắn. Hệ thống treo thích ứng AGILITY CONTROL kết hợp với thân xe cứng và trọng lượng xe nhẹ 1.750 kg cùng khối động cơ tăng áp mới, tạo ra cảm giác lái cực kỳ nhạy bén và đậm chất thể thao. Lẫy chuyển số sau vô lăng trên cả 2 phiên bản giúp người lái kiểm soát toàn bộ sức kéo, đặc biệt hữu dụng khi cần vượt xe hay đi đèo dốc.
Mercedes-Benz GLC 200 còn trang bị cụm chuyển đổi DYNAMIC SELECT với 5 chế độ vận hành khác nhau bao gồm: Comfort, ECO, Sport, Sport+ và Individual, cho phép người lái có thể cá nhân hóa trải nghiệm một cách tốt nhất bằng cách tùy chỉnh chế độ lái theo điều kiện mặt đường. Sức mạnh động cơ của Mercedes-Benz GLC 200 mới vượt trội hơn hẳn các mẫu crossover phổ thông trên thị trường cũng như “đủ sức” để cùng bạn “chinh phục” mọi cung đường tại Việt Nam.
5.AN TOÀN VÀ TIỆN NGHI:
5.1 AN TOÀN:
Một số công nghệ an toàn trên Mercedes-Benz GLC 200 2020:

   • Hệ thống hỗ trợ đỗ xe chủ động Active Parking Assist tích hợp PARKTRONIC.

   • Chức năng cảnh báo mất tập trung ATTENTION ASSIST.

   • Hệ thống chống bó cứng phanh ABS; hỗ trợ lực phanh khẩn cấp BAS; chống trượt khi tăng tốc ASR; ổn định thân xe điện tử ESP.

   • Hệ thống phanh ADAPTIVE với chức năng hỗ trợ dừng xe (HOLD) và hỗ trợ khởi hành ngang dốc (Hill-Start Assist).

   • Phanh tay điều khiển điện với chức năng nhả phanh thông minh.

   • Túi khí phía trước; túi khí bên hông phía trước; túi khí cửa sổ; túi khí bảo vệ đầu gối người lái.

   • Dây đai an toàn 3 điểm cho tất cả các ghế với bộ căng đai khẩn cấp và  giới hạn lực siết.

   • Camera lùi.

   • Chức năng ECO start/stop.

   • Hệ thống khóa cửa trung tâm với chức năng tự động khóa khi xe chạy và mở khóa trong trường hợp khẩn cấp. 

   • Chức năng kiểm soát tốc độ Cruise Control với SPEEDTRONIC cho phép điều chỉnh tốc độ tối đa mong muốn trong khu vực bị giới hạn tốc độ.

Đặc biệt, ở phiên bản Mercedes-Benz GLC 200 nâng cấp còn được trang bị lốp xe dự phòng, giúp người lái cảm thấy an tâm hơn khi di chuyển trong những chặng đường dài hay vận hành xe ở địa hình xấu. 
Với nhiều cải tiến đáng giá, Mercedes-Benz GLC 200 2020 là mẫu xe lý tưởng cho những ai đang tìm kiếm một chiếc SUV hạng sang với thiết kế nam tính, sang trọng, tiện nghi và giàu công nghệ. Hiện nay, Mercedes-Benz GLC 200 nâng cấp đang được phân phối tại đại lý chính hãng Mercedes-Benz Vietnam Star với mức giá 1,749 tỷ đồng và có các chính sách bảo hành, hỗ trợ tài chính với lãi suất cực hấp dẫn.
Khi thiếu collagen, làn da sẽ nhăn nheo, chảy xệ, kém đàn hồi và đặc biệt là sẽ thâm sạm hơn. Chính vì vậy mà collagen thường được ứng dụng để ngăn ngừa sự lão hóa, giúp da căng mịn, phục hồi những tổn thương da, tăng cường trao đổi chất, nuôi dưỡng để da được tươi trẻ và sáng màu hơn. Collagen uống tốt nhất chiếm 70-80% trong cấu trúc của làn da, chúng tập trung chủ yếu ở vùng hạ bì nơi quyết định sắc tố và tình trạng của làn da. Thiếu hụt collagen là một trong những nguyên nhân chính gây nên tình trạng da thâm nám, tàn nhang, chảy xệ và xuất hiện nhiều nếp nhăn xấu xí. Thiếu hụt collagen còn khiến cho cấu trúc làn da bị tổn thương vì vậy mà da luôn khô ráp, sần sùi, sạm màu và nhanh lão hóa. Chính vì vậy việc bổ sung đủ collagen là cơ sở để bạn sở hữu một làn da khỏe đẹp, tươi trẻ.

5.2 TIỆN NGHI:
Các mẫu SUV Mercedes-Benz luôn được đánh giá cao về sự tiện nghi mang lại cho mọi hành khách. Và phiên bản Mercedes-Benz GLC 200 2020 cũng vậy.
Cụ thể, ghế người lái và hành khách phía trước điều chỉnh điện, tích hợp bộ nhớ 3 vị trí. Lưng ghế sau gập lại được. Hệ thống điều hòa khí hậu tự động 2 vùng THERMATIC, cho phép mỗi hành khách có thể tùy chỉnh nhiệt độ và luồng gió tại vị trí ngồi. Touchpad điều khiển cảm ứng dạng thiết kế phẳng hơn giúp ghi nhận thông tin nhạy bén cũng như mang đến hiệu ứng chạm sinh động hơn được đặt trên bệ trung tâm. Chức năng khởi động bằng nút bấm KEYLESS-START. Khóa cửa điều khiển từ xa và mã hóa động cơ chống trộm.
', '02/12/2020',5)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(13,'GLC', 'Mercedes-Benz GLC 200 4MATIC',2099000000,'Mercedes-Benz GLC 200 4MATIC.png',N'
1.GIỚI THIỆU CHUNG:
Mercedes-Benz GLC được mệnh danh là “vua doanh số” dòng xe sang tại thị trường Việt Nam. Kể từ khi ra mắt cho đến nay, dòng xe này luôn có số lượng sản phẩm bán ra đầy ấn tượng. Theo đó, nếu dòng xe tiền nhiệm Mercedes-Benz GLK mất 6 năm để đạt doanh số khoảng 2.000 xe bán ra, thì với Mercedes-Benz GLC, dòng xe này chỉ mất hơn 2 năm (kể từ khi được giới thiệu đến thị trường Việt Nam vào năm 2016) đã có hơn 6.000 xe giao đến tay khách hàng. Số liệu thống kê mới nhất của hãng vào năm 2019 cho thấy, hiện nay đã có hơn 9.000 sản phẩm của dòng xe này lăn bánh tại Việt Nam.
Năm 2020 là một năm đáng mong chờ của những người yêu thích dòng xe này khi hàng loạt các bản nâng cấp chất lượng xuất hiện. Sau khi giới thiệu phiên bản Mercedes-Benz GLC 300 4MATIC (CBU) vào dịp đầu năm 2020, Mercedes-Benz Việt Nam giới thiệu 2 phiên bản: Mercedes-Benz GLC 200 và Mercedes-Benz GLC 200 4MATIC. Khác với Mercedes-Benz GLC 300 4MATIC là mẫu xe nhập khẩu nguyên chiếc, bộ đôi này được lắp ráp trực tiếp trong nước. Đặc biệt, nếu bạn là người yêu thích cảm giác vượt địa hình mạnh mẽ, Mercedes-Benz GLC 200 4MATIC bản nâng cấp 2020 chính là gợi ý không nên bỏ qua.
2.NGOẠI THẤT:
Một trong những điểm khác biệt lớn nhất của bản nâng cấp Mercedes-Benz GLC 200 4MATIC cũng như dòng Mercedes-Benz GLC chính là ngoại hình. Thay vì sử dụng đường nét hài hòa và uyển chuyển, bản nâng cấp đã được điều chỉnh để trở nên nam tính  và hầm hố hơn. Tuy nhiên, những người yêu thích Mercedes-Benz vẫn có thể nhận ra phong cách thiết kế thanh lịch, đẳng cấp đặc trưng của hãng trên phiên bản Mercedes-Benz GLC mới này.
Ở mặt trước, cụm đèn pha LED toàn phần của Mercedes-Benz GLC 200 4MATIC được thiết kế lại với 2 tầng, 3 khoang tạo vẻ sành điệu, thời thượng. Bên cạnh đó, phiên bản này còn có thiết kế cản trước đục lỗ mạ chrome to bản và rộng ngang. Đặc biệt, gói ngoại thất Off-Road với cản trước, cản sau, bộ bảo hộ gầm xe và mâm lốp mới sẽ giúp khả năng đi địa hình của Mercedes-Benz GLC 200 4MATIC trở nên tối ưu hơn.
Tạo hình đuôi xe cũng trở nên dễ nhận diện và đậm chất thể thao hơn nhờ cụm đèn hậu LED được thiết kế lại đồ họa sợi quang theo dạng hộp thay vì 2 sọc ngang. Đồng thời, hãng còn trang bị cho phiên bản này mâm xe 19-inch 6 chấu với thiết kế hoàn toàn mới.
3.NỘI THẤT:
Nội thất của các sản phẩm luôn là yếu tố khiến nhiều người phải trầm trồ. Với chiều dài cơ sở đạt 2873 (mm), Mercedes-Benz GLC 200 4MATIC 2020 cung cấp cho người dùng không gian rộng rãi, thoải mái. Chưa dừng lại ở đó, phiên bản Mercedes-Benz GLC nâng cấp này còn được ưu ái với nội thất ốp gỗ Open-pore ash màu nâu, gói nội thất Exclusive sang trọng với chất liệu da tiêu chuẩn cao cấp và 2 tùy chọn nội thất quen thuộc là Đen và Vàng Silk.
Nhằm đảm bảo tính riêng tư cho hành khách trên xe, bên cạnh tính năng cách nhiệt, kính khoang sau của xe còn có màu tối. Ngoài ra, xe còn có hệ thống đèn viền nội thất lên đến 64 màu.
4.ĐỘNG CƠ:
Nếu bạn muốn nâng cấp từ CUV/SUV phổ thông lên dòng SUV hạng sang và yêu thích cảm giác cầm lái mạnh mẽ thì Mercedes-Benz GLC 200 4MATIC bản cập nhật mới nhất chính là sự lựa chọn hàng đầu dành cho bạn.
Mercedes-Benz GLC 200 4MATIC 2020 được trang bị thế hệ động cơ hoàn toàn mới mang mã hiệu M264. Đây là động cơ 4 xy lanh thẳng hàng, dung tích 2.0 L sử dụng tăng áp đường nạp kép (twin-scroll), sản sinh công suất 197 mã lực. Xe có mô-men xoắn cực đại đạt 320 Nm tại 1650 – 4000 vòng/phút và vận tốc tối đa là 215 (km/h). Theo các chuyên gia nhận xét, sức mạnh này vượt trội hơn hẳn so với các mẫu crossover phổ thông trên thị trường cũng như vận hành mượt mà trong điều kiện giao thông Việt Nam, bao gồm cả ở những đô thị đông đúc như Hà Nội và TP. HCM.
Các chế độ vận hành vẫn được giữ nguyên trên bản nâng cấp này. Chỉ cần điều chỉnh nút gạt DYNAMIC SELECT, người lái có thể linh hoạt thay đổi giữa các chế độ “Comfort”, “ECO”, “Sport”, “Sport+” và “Individual” để phù hợp với điều kiện di chuyển hoặc phong cách lái.
5.AN TOÀN VÀ TIỆN NGHI:
5.1 AN TOÀN:
Tương tự phiên bản cũ, Mercedes-Benz GLC 200 4MATIC 2020 sở hữu hàng loạt các công nghệ an toàn hàng đầu như chức năng cảnh báo mất tập trung ATTENTION ASSIST, hệ thống chống bó cứng phanh ABS, hỗ trợ lực phanh khẩn cấp BAS, chống trượt khi tăng tốc ASR, ổn định thân xe điện tử ESP, phanh tay điều khiển điện với chức năng nhả phanh thông minh… Chưa dừng lại ở đó, phiên bản mới này còn bổ sung thêm camera 360 độ, kết hợp cùng hệ thống hỗ trợ đỗ xe chủ động Active Parking Assist tích hợp PARKTRONIC giúp cho việc dừng, đỗ và lùi xe trở nên an toàn, dễ dàng hơn bao giờ hết.
5.2 TIỆN NGHI:
Với mong muốn mang đến cho hành khách trên xe cảm giác dễ chịu và thú vị, bản cập nhật của Mercedes-Benz GLC được bổ sung rất nhiều tiện nghi đáng giá, gồm: bảng đồng hồ dạng kỹ thuật số với màn hình 12.3-inch, cổng sạc 5V (USB type C) cho hàng ghế sau, chức năng sạc không dây cho điện thoại thông minh ở hàng ghế trước… Đặc biệt, phiên bản này còn được trang bị hệ thống giải trí thế hệ mới MBUX với màn hình cảm ứng 10.25-inch, kết nối Bluetooth, chức năng điều khiển bằng giọng nói LINGUATRONIC – kích hoạt thông qua câu lệnh “Hey Mercedes” và khả năng kết nối Apple CarPlay, Android Auto.
Với những bổ sung mới, Mercedes-Benz GLC 200 4MATIC hứa hẹn sẽ khiến phân khúc SUV hạng sang tại Việt Nam nhộn nhịp hơn bao giờ hết. Hiện nay, phiên bản này đã có mặt tại các đại lý Vietnam Star với mức giá tầm 2 tỷ VNĐ. Để biết thêm thông tin, khuyến mãi và giá lăn bánh Mercedes-Benz GLC 200 4MATIC, khách hàng vui lòng liên hệ với Vietnam Star gần nhất.
', '04/02/2021',5)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(14,'GLC','Mercedes-Benz GLC 300 4MATIC',2499000000,'Mercedes-Benz GLC 300 4MATIC.png',N'
1.GIỚI THIỆU CHUNG:
Xuất hiện tại Việt Nam vào năm 2016 để thay thế cho Mercedes-Benz GLK, Mercedes-Benz GLC nhanh chóng trở thành dòng SUV hạng sang được nhiều người tìm mua bởi hàng loạt các tính năng tuyệt vời cũng như thiết kế mềm mại hơn so với dòng tiền nhiệm. Đặc biệt, sau 4 năm có mặt tại thị trường Việt Nam, MBV vừa xuất xưởng chiếc GLC thứ 10.000 và bàn giao đến khách hàng.
Năm 2020 dự kiến sẽ là một năm vô cùng thành công với dòng xe này khi hãng trình làng rất nhiều phiên bản nâng cấp mới. Cụ thể, sau khi giới thiệu Mercedes-Benz GLC 200 và Mercedes-Benz GLC 200 4MATIC nâng cấp vào đầu tháng 2/2020, MBV tiếp tục ra mắt 2 phiên bản còn lại của mẫu xe thể thao đa dụng này là Mercedes-Benz GLC 300 4MATIC và Mercedes-Benz GLC 300 4MATIC Coupé.
Mercedes-Benz GLC 300 4MATIC 2020 là phiên bản xe được lắp ráp trong nước. Nhờ đó, xe sẽ có mức giá tiết kiệm hơn so với những đối thủ cùng phân khúc cũng như giúp người dùng dễ dàng tìm được linh kiện, phụ tùng thay thế chính hãng. Chưa dừng lại ở đó, những đường nét sang trọng đặc trưng của Mercedes-Benz vẫn được giữ nguyên trên phiên bản này, kèm theo đó những bổ sung, nâng cấp tuyệt vời. Từ đó tạo lợi thế cạnh tranh cho phiên bản Mercedes-Benz GLC 2020 này ở thị trường trong nước.
2.NGOẠI THẤT:
Nhìn chung, Mercedes-Benz GLC 300 4MATIC không có quá nhiều điểm khác biệt so với phiên bản tiền nhiệm. Tổng thể xe vẫn là sự kết hợp giữa thiết kế khỏe khoắn và nét sang trọng đặc trưng của thương hiệu đẳng cấp toàn cầu Mercedes-Benz.
Mercedes-Benz GLC 300 4MATIC được tăng kích thước ở chiều dài và chiều cao. Cụ thể, phiên bản này có dài x rộng x cao lần lượt là 4670 x 1900 x 1650 (mm), tạo sự trẻ trung, hiện đại hơn. Chiều dài cơ sở tiếp tục là 2873 mm.
Điểm khác biệt năm này mà Mercedes-Benz GLC 300 4MATIC mang đến cho người dùng chính là gói ngoại thất thể thao AMG với thiết kế hoàn toàn mới. Kết hợp với đó là mâm xe thể thao AMG 19-inch 5 chấu kép cũng được thay đổi so với bản cũ.
Chưa dừng lại ở đó, phiên bản Mercedes-Benz GLC mới này còn sở hữu cụm đèn trước Multi-Beam LED tích hợp đèn LED chiếu sáng ban ngày. Không chỉ giúp phần đầu xe thêm cuốn hút, gây ấn tượng mạnh ngay từ ánh nhìn đầu tiên, đèn Multi-Beam LED còn có tầm chiếu sáng xa kỷ lục 650m nhờ cấu tạo mỗi cụm đèn gồm 84 tinh thể LED hiệu suất cao, được kiểm soát độc lập nên có thể tạo ra luồng sáng có cường độ siêu mạnh nhưng không gây chói mắt cho những phương tiện di chuyển ở chiều ngược lại.
3.NỘI THẤT:
Bên cạnh không gian nội thất rộng rãi, thoải mái, Mercedes-Benz GLC 300 4MATIC còn sở hữu cửa sổ trời siêu rộng Panorama. Đồng thời, để đảm bảo sự riêng tư cho hành khách, xe trang bị kính khoang sau màu tối. Cùng với đó, toàn bộ nội thất bên trong của xe được ốp gỗ Anthracite open-pore oak màu xám và chất liệu da cao cấp.
Ở phiên bản này, người dùng được sở hữu gói nội thất Exclusive sang trọng. Hệ thống đèn viền nội thất 64 màu giúp người dùng dễ dàng có được không gian thoải mái, dễ chịu cho riêng mình.
Ngoài ra, nội thất Mercedes-Benz GLC 300 4MATIC 2020 còn những thay đổi, bổ sung mới như: tay lái 3 chấu bọc da với nút điều khiển cảm ứng, bảng đồng hồ dạng kỹ thuật số với màn hình 12.3-inch và mặt trên bảng táp-lô bọc da ARTICO.
4.ĐỘNG CƠ:
Vẫn sử dụng động cơ I4 cùng dung tích công tác 1991 (cc), tuy nhiên Mercedes-Benz GLC 300 4MATIC mới được trang bị hệ thống treo DYNAMIC BODY CONTROL với 3 chế độ và khả năng thích ứng liên tục (“Comfort”, “Sport” và “Sport+”) với điều kiện vận hành. Trong đó:
 – “Sport” và “Sport+”: Hệ thống treo được tinh chỉnh cứng vững hơn. 

 – “Comfort”: Hệ thống treo mang đến sự êm ái cho mọi hành khách, giảm thiểu tiếng ồn từ lốp và mặt đường.
Chưa dừng lại ở đó, xe còn mang đến những phản hồi nhạy bén và chân thật cho người lái nhờ hệ thống treo DYNAMIC BODY CONTROL được kết nối cùng hệ thống lái Sports Direct-Steer với tỷ số truyền biến thiên dựa trên góc đánh lái và tốc độ. Xe có thể tăng tốc từ 0 – 100 km/h chỉ trong vòng 6,2 giây và vận tốc tối đa đạt 240 (km/h) trong điều kiện tiêu chuẩn.
5.AN TOÀN VÀ TIỆN NGHI:
5.1 AN TOÀN:
An toàn là yếu tố được hãng đặt lên hàng đầu dù với bất kỳ dòng xe nào. Với Mercedes-Benz GLC 300 4MATIC, xe được trang bị rất nhiều các hệ thống, chức năng giúp việc lái xe trở nên an toàn và dễ dàng hơn như: Hệ thống hỗ trợ đỗ xe chủ động Active Parking Assist tích hợp PARKTRONIC; Chức năng cảnh báo mất tập trung ATTENTION ASSIST; Hệ thống chống bó cứng phanh ABS; Hỗ trợ lực phanh khẩn cấp BAS; Chống trượt khi tăng tốc ASR; Ổn định thân xe điện tử ESP;Hệ thống phanh ADAPTIVE với chức năng hỗ trợ dừng xe (HOLD) và hỗ trợ khởi hành ngang dốc (Hill-Start Assist); Phanh tay điều khiển điện với chức năng nhả phanh thông minh…
Hơn thế nữa, xe còn được trang bị cần gạt nước mưa với cảm biến mưa giúp người dùng không bị che tầm nhìn khi gạt nước hoạt động. Hệ thống khóa cửa trung tâm với chức năng tự động khóa khi xe chạy và mở khóa trong trường hợp khẩn cấp và lốp xe dự phòng cũng được trang bị trên mẫu xe này.
5.2 TIỆN NGHI:
Một trong những điểm cộng của phiên bản Mercedes-Benz GLC này chính là hệ thống giải trí thế hệ mới MBUX với màn hình cảm ứng 10.25-inch với khả năng kết nối Bluetooth và chức năng điều khiển bằng giọng nói LINGUATRONIC được kích hoạt thông qua câu lệnh “Hey Mercedes”. Xe còn có chức năng kết nối Apple Carplay và Android Auto, cổng sạc 5V (USB type C) cho hàng ghế sau và chức năng sạc không dây cho điện thoại thông minh ở hàng ghế trước.
Mercedes-Benz GLC 300 4MATIC sở hữu hệ thống âm thanh vòm Burmester® với 13 loa, công suất 590 watt, nhờ đó mang đến âm thanh chân thật cho những bản nhạc yêu thích của bạn. Phiên bản mới này còn được bổ sung thêm tấm che khoang hành lý phía sau giúp tạo ra sự cách biệt về mặt không gian giữa khoang hành lý và khoang hành khách, đồng thời hạn chế mùi hoặc bụi bẩn ảnh hưởng đến sự thoải mái của người ngồi. 
Với những trang bị mới và được nâng cấp tốt hơn, Mercedes-Benz GLC 300 4Matic sẽ là mẫu SUV mà bạn không nên bỏ qua trong năm 2020. Để biết thêm về khuyến mãi, bảo hành, giá lăn bánh của Mercedes-Benz GLC 300 4Matic, ngay hôm nay, bạn hãy đến với chi nhánh Vietnam Star gần nhất ngay hôm nay.
', '02/10/2016',5)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(15,'GLS','Mercedes-Benz GLS 450 4Matic',4999000000,'Mercedes-Benz GLS 450 4Matic.png',N'
1.GIỚI THIỆU CHUNG:
Mercedes-Benz GLS là dòng SUV hạng sang cỡ lớn (full-size luxury SUV) đứng đầu bảng trong số các dòng SUV của thương hiệu ngôi sao ba cánh (xếp trên GLE, GLC…). Xe có 3 hàng ghế, 7 chỗ ngồi và luôn được ưa chuộng bởi sự tiện nghi và hàng loạt công nghệ hiện đại. Bên cạnh đó, các phiên bản GLS Class còn được đánh giá rất cao về thiết kế nội ngoại thất nhờ áp dụng ngôn ngữ thiết kế Sensual Purity và Mercedes-Benz GLS 450 4Matic 2020 cũng hội tụ tất cả những tinh túy này.
2.NGOẠI THẤT:
So với thế hệ tiền nhiệm, Mercedes-Benz GLS có ngoại hình hiện đại và sang trọng hơn. Dựa trên ngôn ngữ Sensual Purity, Mercedes-Benz GLS 450 4Matic 2020 được thiết kế bằng nhiều hình khối rắn chắc, liền mạch cùng 4 hốc bánh xe mở rộng sang hai bên. Kết hợp là gói trang trí ngoại thất AMG với các chi tiết đậm chất thể thao giúp khắc họa rõ nét dáng vẻ hầm hố của một mẫu SUV gầm cao.
Theo đó, Mercedes-Benz GLS 450 4Matic 2020 được trang bị lưới tản nhiệt hai nan đơn cỡ lớn với ngôi sao ba cánh nổi bật ở giữa. Bên dưới là cản trước được viền mạ crom sáng bóng cùng hai hốc gió dạng 2 nan ngang giúp tăng sự vạm vỡ cho phần đầu xe. Đặc biệt, với bộ mâm xe AMG to lớn 21-inch 5 chấu kép, tổng thể Mercedes-Benz GLS 450 4Matic mới thêm phần chắc chắn và cuốn hút cũng như thể hiện rõ đặc trưng của một mẫu xe thể thao đa dụng có khả năng vượt địa hình tốt. 
Bên cạnh đó, dù Mercedes-Benz GLS 450 4MATIC sở hữu ngoại hình thể thao, nam tính nhưng vẫn lịch thiệp đúng với DNA ‘Mercedes-Benz’. Chi tiết thể hiện rõ điều này chính là cụm đèn trước và đèn hậu thiết kế nhỏ gọn với đồ họa LED sắc nét. Cụ thể, Mercedes-Benz GLS 450 4MATIC 2020 được trang bị cụm đèn trước Multi-Beam LED tích hợp dải LED chiếu sáng ban ngày. Cụm đèn hậu được bo tròn với dải LED hình tế bào lạ mắt.
Cụm đèn Multi-Beam LED được ví như tinh hoa công nghệ ánh sáng bởi cấu tạo mỗi cụm đèn gồm 84 bóng đèn LED hiệu suất cao và được kiểm soát độc lập nhằm tạo ra luồng sáng chính xác mà không gây chóa mắt người đối diện. Đáng chú ý, cụm đèn Multi-Beam LED còn có khả năng tự động điều chỉnh thích ứng theo điều kiện giao thông và thời tiết. Tính năng ULTRA RANGE Highbeam giúp tạo ra cường độ ánh sáng siêu mạnh lên tới 650m, giúp người lái luôn tự tin kiểm soát cung đường phía trước.
Không chỉ vậy, hiện nay Mercedes-Benz GLS 450 4MATIC 2020 còn mang đến đa dạng các màu sơn ngoại thất, phù hợp với sở thích và nhu cầu của nhiều khách hàng.

   • Trắng Polar (149).

   • Đen Obsidian (197).

   • Bạc Iridium (775).

   • Bạc Mojave (859).

   • Xanh Cavansite (890).

   • Xanh Brilliant (896).

   • Xanh Emerald (989).

   • Xám Selenite (992).
3.NỘI THẤT:
Mercedes-Benz GLS 450 4MATIC 2020 có kích thước Dài x Rộng x Cao lần lượt là 5226 x 2030 x 1845 (mm), chiều dài cơ sở 3135 mm. So với phiên bản cũ, thế hệ Mercedes-Benz mới dài hơn 77mm, rộng hơn 22mm và có chiều dài cơ sở kéo dài thêm 66mm. Sự tinh chỉnh đáng giá này giúp khoang nội thất Mercedes-Benz GLS 450 4MATIC trở nên rộng rãi hơn cũng như tăng sự thoải mái tại tất cả vị trí ngồi trên xe.
Ngoài ra, khoảng cách để chân ở hàng ghế thứ 2 còn được tăng thêm 86mm so với trước. Hàng ghế thứ 3 có đủ không gian thoải mái cho 2 người lớn. Đặc biệt, việc ra vào hàng ghế thứ 3 ở phiên bản GLS mới này cũng cũng tiện lợi hơn với tính năng EASY ENTRY để dời hàng ghế thứ 2 lên phía trước.
Tương tự Mercedes-Benz GLE, thế hệ GLS thứ ba (X167) có thiết kế nội thất theo phong cách mới với các cửa gió vuông vức dày bản, cụm điều khiển trên bệ tỳ tay tinh gọn. Mercedes-Benz GLS 450 4MATIC 2020 được trang bị gói nội thất EXCLUSIVE lịch lãm. Mặt trên bảng tap-lô bọc da ARTICO và ốp gỗ Sồi Anthracite vân nổi màu xám nâu cực kỳ tinh xảo. Các phím điều khiển trung tâm, cụm chỉnh đèn mới và bề mặt của hệ thống âm thanh vòm Burmester® 13 loa, công suất 590 watt được ốp hợp kim sáng bóng. Hệ thống đèn viền nội thất 64 màu mang lại không gian lung linh hơn vào ban đêm.
Xe sử dụng tay lái 3 chấu bọc da Nappa và ốp gỗ, tích hợp 2 nút điều khiển cảm ứng (Touch Control Buttons), tính năng Ga tự động (Cruise Control) và Giới hạn tốc độ (SPEEDTRONIC ). Cùng với đó là hàng loạt trang bị, công nghệ thông minh như giao diện MBUX (Mercedes-Benz User Experience) thế hệ mới nhất. Người lái có thể điều khiển MBUX qua màn hình cảm ứng, điều khiển bằng giọng nói, nút điều khiển cảm ứng trên tay lái hoặc bàn điều khiển Touchpad. Điều đặc biệt của MBUX là khả năng tự hoàn thiện, học tập thông qua trí tuệ nhân tạo. Trợ lý ảo của MBUX có thể trò chuyện với hành khách trên xe, ghi nhớ giọng nói và các khẩu lệnh.
Hệ thống giải trí với màn hình cảm ứng 12.3-inch, cho phép kết nối Bluetooth và tích hợp chức năng điều khiển bằng giọng nói LINGUATRONIC. Hệ thống điều hòa khí hậu tự động THERMOTRONIC cho hàng ghế trước và sau sau. Cửa sổ trời siêu rộng Panorama mang lại trải nghiệm gần gũi với thiên nhiên hơn.
4.ĐỘNG CƠ:
Mercedes-Benz GLS 450 4MATIC 2020 được trang bị khối động cơ I6 hoàn toàn mới, dung tích 3.0L có công suất lên đến 367 mã lực tại 5.500-6.100 vòng/phút và mô-men xoắn cực đại đạt 500 Nm ở 1.600-4.500 vòng/phút. Kết hợp cùng với đó là hệ thống mild-hybrid EQ Boost với động cơ điện 48V có khả năng hỗ trợ tức thời 22 mã lực và 250 Nm cho động cơ đốt trong, giúp xe bứt tốc nhanh chóng ở mọi dải tốc độ và loại bỏ hoàn toàn độ trễ khi nhấn chân ga. Theo số liệu của nhà sản xuất, Mercedes-Benz GLS 450 4MATIC có thể tăng tốc từ 0 – 100km chỉ trong 6,2 giây và đạt vận tốc tối đa là 246km/h. Trang Wards Auto danh tiếng của Mỹ đã bình chọn khối động cơ của Mercedes-Benz GLS 450 4MATIC là 1 trong 10 động cơ tốt nhất thế giới năm 2020.
Sức mạnh của khối động cơ trên Mercedes-Benz GLS 450 4MATIC 2020 được truyền qua hộp số tự động 9 cấp 9G-TRONIC truyền đến hệ thống dẫn động 4 bánh toàn thời gian biến thiên thông minh (Torque on Demand – TonD). Lực kéo từ động cơ có thể được phân bổ hoàn toàn đến cầu trước hay cầu sau (0 – 100%) tùy vào chế độ lái và điều kiện vận hành. Điều này cho phép xe dễ dàng vượt qua các địa hình khó với độ bám không đồng đều ở 4 bánh xe. Ngoài ra, khi xe vào cua, TonD còn chủ động phân bổ lực kéo thông minh nhằm tác động đến góc lái để tránh hiện tượng thừa lái hoặc thiếu lái.
Với sức mạnh đáng nể, Mercedes-Benz GLS 450 4MATIC 2020 còn được ví là một “thảm bay mặt đất” khi được trang bị hệ thống treo khí nén AIRMATIC thế hệ mới nhất của Mercedes-Benz, có khả năng thay đổi độ cao và độ cứng ở các chế độ vận hành khác nhau. Cụm chuyển đổi DYNAMIC SELECT với nhiều chế độ vận hành mang lại trải nghiệm cá nhân hóa trên mọi hành trình.
5.AN TOÀN VÀ TIỆN NGHI:
Mercedes-Benz GLS là dòng SUV luôn được đánh giá cao về các trang bị an toàn và tiện nghi và phiên bản Mercedes-Benz GLS 450 4MATIC cũng vậy. 
5.1 AN TOÀN:
Các trang bị an toàn trên Mercedes-Benz GLS 450 4MATIC 2020:

   • Hệ thống lái Direct-Steer trợ lực điện với trợ lực và tỉ số truyền lái biến thiên theo tốc độ.

   • Hệ thống treo khí nén AIRMATIC giúp tạo độ êm ái cho xe khi vận hành. 

   • Hệ thống hỗ trợ đỗ xe chủ động Active Parking Assist tích hợp PARKTRONIC.

   • Camera 360.

   • Chức năng cảnh báo mất tập trung ATTENTION ASSIST.

   • Hệ thống tự động bảo vệ PRE-SAFE® và PRE-SAFE® Sound.

   • Hệ thống chống bó cứng phanh ABS; hỗ trợ lực phanh khẩn cấp BAS; chống trượt khi tăng tốc ASR; ổn định thân xe điện tử ESP và hỗ trợ ổn định xe khi gió thổi ngang.

   • Kiểm soát lực kéo điện tử cho hệ dẫn động 4 bánh 4ETS; hỗ trợ xuống dốc DSR.

   • Hệ thống phanh ADAPTIVE với chức năng hỗ trợ dừng xe (HOLD) và hỗ trợ khởi hành ngang dốc (Hill-Start Assist).

   • Phanh tay điều khiển điện với chức năng nhả phanh thông minh.

   • Đèn phanh Adaptive nhấp nháy khi phanh gấp.

   • Túi khí phía trước; túi khí bên hông phía trước và phía sau; túi khí cửa sổ; túi khí cho đầu gối người lái.

   • Tựa đầu điều chỉnh được cho tất cả các ghế.

   • Dây đai an toàn 3 điểm cho tất cả các ghế với bộ căng đai khẩn cấp và giới hạn lực siết.

   • Hệ thống khóa cửa trung tâm với chức năng tự động khóa khi xe chạy và mở khóa trong trường hợp khẩn cấp.

   • Lốp xe dự phòng.

   • Chức năng kiểm soát tốc độ Cruise Control với SPEEDTRONIC cho phép điều chỉnh tốc độ tối đa mong muốn trong khu vực bị giới hạn tốc độ.
5.2 TIỆN NGHI:
Mercedes-Benz GLS 450 4MATIC mang tới một không gian đầy tiện nghi với ghế người lái và hành khách phía trước điều chỉnh điện và tích hợp bộ nhớ 3 vị trí. Hàng ghế thứ 2 điều chỉnh điện và hàng ghế thứ 3 gập điện. 2 hàng ghế sau của xe có thể gập phẳng hoàn toàn, mở rộng dung tích khoang hành lý tối đa thành 2.400 lít.
Tựa đầu ở tất cả các ghế đều điều chỉnh được, mang đến sự thoải mái cho tất cả hành khách. Xe hỗ trợ kết nối Apple CarPlay/Android Auto, sạc không dây và cổng sạc 5V (USB type C) cho cả 3 hàng ghế.  Hệ thống dẫn đường và định vị vệ tinh toàn cầu GPS tích hợp bản đồ Việt Nam. Touchpad điều khiển cảm ứng dạng thiết kế mới trên bệ trung tâm. Màn che nắng cho cửa sổ hai bên phía sau chỉnh điện, tấm che nắng 2 bên cho hàng ghế trước. Hệ thống khóa xe thông minh & khởi động bằng nút bấm KEYLESS-GO và chức năng HANDS-FREE ACCESS giúp bạn mở cốp xe dễ dàng hơn. 
Mercedes-Benz GLS 450 4Matic mới ra mắt với mức giá dễ tiếp cận khách hàng Việt, chỉ 4,909 tỷ đồng cho một mẫu xe thể thao đa dụng sang trọng với nhiều trang bị đáng giá. Phiên bản này được nhập khẩu trực tiếp từ Mỹ, hiện đang phân phối chính thức tại các showroom Mercedes-Benz Vietnam Star Automobile trên toàn quốc.
', '04/29/2020',6)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(16,'S-CLASS','Mercedes-Benz S 450 L Luxury',4969000000,'Mercedes-Benz S 450 L Luxury.png',N'
1.GIỚI THIỆU CHUNG:
Với doanh số bán ra hơn 500 chiếc trong năm 2017, S-Class trở thành dòng xe chiếm thị phần lớn trong phân khúc Sedan hạng F – mẫu xe hạng sang dành cho các ông chủ. Các phiên bản S-Class đều là sự kết hợp hoàn hảo giữa hai phạm trù phong cách và vị thế, đủ sang trọng, đủ cá tính để tạo nên sự khác biệt.
Sau nhiều lần lỡ hẹn thị trường Việt Nam, cuối cùng dòng xế siêu sang Mercedes-Benz S 450 L Luxury cũng chính thức ra mắt giới đam mê xe hơi vào ngày 8/6 tại Hà Nội. Mercedes-Benz S 450 L Luxury mang mọi tinh túy đặc trưng của dòng S-Class cùng sự nhấn nhá ở một số chi tiết giúp tạo hình xe thêm ấn tượng. Cùng với “đàn em” Mercedes-Benz S 450 L, phiên bản này chắc chắn sẽ là mẫu xe thu hút nhất năm cũng như khiến không ít đối thủ phải dè chừng.
Nhìn tổng quan, Mercedes S 450 L và S 450 L Luxury đều có kích thước dài x rộng x cao, động cơ bên trong như nhau. Tuy nhiên, phiên bản Mercedes S450 L Luxury định vị ở mức giá cao hơn bởi mẫu xe này được trang bị thêm một số tính năng mà “đàn em” không có, như:
   ●    Mâm xe 19 inch thay vì 18 inch như trên Mercedes S 450 L.

   ●    Ghế thương gia phía sau có thể ngả tối đa 43,5°, tích hợp đệm đỡ bắp chân.

   ●    Hệ thống âm thanh vòm Bummester 26 loa công suất 1.590 W thay vì  13 loa 590 W như ở Mercedes S 450 L.

   ●    Chức năng hiển thị thông tin trên kính chắn gió.

   ●    Hệ thống MAGIC VISION CONTROL với cần gạt nước mưa thích ứng, có sưởi.

   ●   Hệ thống hỗ trợ lái xe ban đêm NIGHT VIEW ASSIST PLUS.
2.NGOẠI THẤT:
Định vị là phiên bản thay thế cho Mercedes-Benz S 500 L, Mercedes-Benz S 450 L Luxury tỏ rõ uy phong bởi nhiều chi tiết hào nhoáng, mới lạ trong thiết kế. Phần đầu xe nổi bật bởi cản trước và lưới tản nhiệt 3 nan kép mạ chrome sáng bóng, thay vì 4 nan đơn như thế hệ S-Class cũ. Sự tái thiết kế này tạo sự mạnh mẽ và khỏe khoắn hơn nhưng vẫn toát lên sự sang trọng đặc trưng. Cùng với đó là hốc gió thể thao cỡ lớn, mang lại cảm giác đầu xe vạm vỡ hơn.
Sự đột phá trong ngoại thất của Mercedes-Benz S 450 L Luxury còn được phô trương qua cụm đèn trước Multi-Beam LED với 3 dải đèn LED chiếu sáng ban ngày. Đây là hệ thống đèn thông minh nhất hiện nay, có cấu tạo từ 84 tinh thể LED điều khiển riêng biệt, có thể tự động điều chỉnh vùng chiếu sáng tối ưu trên từng điều kiện mặt đường, không làm chói mắt người đi ngược chiều.
Ở phiên bản này, nắp ca-pô được trau chuốt ấn tượng hơn bởi 2 đường gân uyển chuyển vuốt ngược lên cao cùng logo ngôi sao 3 cánh thương hiệu. Phần hông xe thon gọn, cuốn hút với hai đường mềm mại được dập nổi, kéo dài từ hốc bánh trước đến hốc bánh sau. Chễm chệ ở trên là gương chiếu hậu có thiết kế to hơn, tích hợp đèn báo rẽ, gập điện và có chống chói tự động.
Cản sau ôm sát, đường nét bo tròn tinh tế cùng đèn hậu tái thiết kế đã tạo nên phong cách khác biệt cho Mercedes-Benz S 450 L Luxury khi nhìn từ phía sau. Cụm đèn sau kiểu dáng hình tinh thể pha lê mang lại cảm giác sang trọng. Đi kèm đó là đèn phanh thứ ba công nghệ LED hiện đại, có độ bền cao. 
Nếu “đàn em” Mercedes-Benz S 450 L sử dụng mâm xe 18 inch 5 chấu kép thì phiên bản này đã được ưu ái hơn khi trang bị mâm xe 19 inch 5 chấu kép. Bởi vậy, ngay từ cái nhìn đầu tiên, Mercedes-Benz S 450 L Luxury đã chiếm trọn trái tim của các tay lái bởi thỏa mãn tiêu chí dòng xế siêu sang với tạo hình uy nghi và bề thế.
3.NỘI THẤT:
Mercedes-Benz S 450 L Luxury mang đến một không gian yên tĩnh, vô cùng rộng rãi nhờ sở hữu kích thước chiều dài x rộng x cao lần lượt là 5255 x 1899 x 1494 (mm), chiều dài cơ sở 3165 (mm). Không chỉ vậy, nhờ cách bố trí thông minh, không gian cho hàng ghế sau cũng rất thoải mái, đủ chỗ cho 3 người lớn. Cửa sổ trời Panoramic siêu rộng tạo sự gần gũi với thiên nhiên, rất tiện lợi khi hành khách muốn tận hưởng những cơn gió trong lành từ bên ngoài.
Hướng đến một mẫu xe hoàn mỹ từ mọi giác quan, nội thất Mercedes-Benz S 450 L Luxury tràn ngập những chất liệu cao cấp như gỗ bóng Piano Lacquer, da thượng hạng và kim loại cao cấp. Đèn viền nội thất với 64 màu và 10 kiểu phối màu độc đáo, cho phép tùy chỉnh màu sắc và độ sáng theo sở thích. Trang bị này góp phần tôn thêm sự tinh xảo trên bề mặt các chi tiết nội thất và giúp bên trong xe trở nên lung linh, huyền ảo hơn khi di chuyển vào ban đêm.
Đẳng cấp ở mẫu xe siêu sang Mercedes-Benz S 450 L Luxury còn thể hiện qua mùi hương dễ chịu mà mọi hành khách đều có thể cảm nhận được khi bước vào trong xe. Hệ thống AIR BALANCE cung cấp 6 lựa chọn mùi hương nội thất, phù hợp với sở thích của mỗi chủ nhân. Ngoài ra, không khí bên trong còn được cải thiện bằng i-on hóa và bộ lọc hiệu suất cao, giúp cân bằng và mang đến một không gian hoàn hảo nhất cho sức khỏe.
Đối diện hàng ghế trước là bảng táp lô trải dài với nhiều trang bị hiện đại. Tích hợp trên đó là vô lăng 3 chấu bọc da và ốp gỗ, tích hợp nút điều khiển bằng cảm ứng. Màn hình điều khiển trung tâm có kích thước 12,3 inch, hiển thị rõ nét các thông số trong mọi điều kiện ánh sáng.
Hệ thống giải trí trên phiên bản này được đánh giá cũng rất hiện đại, đúng tầm với phân khúc mà xe hướng tới. Các trang bị giải trí bao gồm: màn hình 12,3-inch chuẩn HD, bộ thu sóng phát thanh, đầu đọc thẻ SD, kết nối Bluetooth, trình duyệt Internet, chức năng điều khiển bằng giọng nói LINGUATRONIC và có thể kết nối Apple CarPlay và Android Auto.
Đặc biệt, ở phiên bản Mercedes-Benz S 450 L Luxury, hãng xe Đức đã tích hợp hệ thống âm thanh vòm cao cấp Burmester® với 26 loa, công suất 1590W, thay vì 13 loa, công suất 590W như ở “đàn em”. Ngoài ra, xe sử dụng giao diện hiển thị bằng tiếng Việt, khá thân thiện với khách hàng Việt Nam và là một điểm cộng lớn để giúp người dùng sử dụng các tính năng trên xe một cách tối ưu nhất.
4.ĐỘNG CƠ:
Đằng sau sự điềm tĩnh, uy nghi ấy là khối động cơ xăng V6, dung tích 3.0L có sức mạnh vượt trội, có công suất cực đại 367 mã lực tại 5500 – 6000 vòng/phút, mô-men xoắn cực đại 500 Nm tại 1800 – 4500 vòng/phút. Sức mạnh của động cơ này được truyền qua hộp số tự động 9 cấp 9G-TRONIC, hệ dẫn động cầu sau. Với trang bị này, Mercedes-Benz S 450 L Luxury đủ sức để mang lại sự êm ái cũng như phấn khích trên những chặng đường dài. 
Theo số liệu của nhà sản xuất, trong điều kiện tiêu chuẩn, xe có thể bứt tốc từ 0-100 km/h chỉ trong 5,4 giây và đạt vận tốc tối đa 250 km/h – một con số chắc chắn sẽ chinh phục các tay lái đòi hỏi cao về tốc độ.
Một yếu tố góp phần vào khả năng vận hành của phiên bản cao cấp dòng S-Class là hệ thống treo khí nén AIRMATIC, giảm xóc điều khiển biến thiên liên tục tùy theo điều kiện đường, hệ thống lái Direct-Steer trợ lực điện và tỉ số truyền lái biến thiên theo tốc độ. Nhờ đó mang đến sự đầm chắc, vững tay lái khi vào cua hay khi di chuyển trên đoạn đường gồ ghề, dốc đá.
Ngoài ra, với cụm chuyển đổi DYNAMIC SELECT, người ngồi sau vô lăng có thể dễ dàng cá nhân hóa cảm giác lái giữa sự êm ái, thể thao, tiết kiệm nhiên liệu hoặc các đặc tính vận hành được thiết lập riêng.
5.AN TOÀN VÀ TIỆN NGHI:
An toàn và tiện nghi là 2 yếu tố luôn được đặt lên hàng đầu trong các “siêu phẩm” Mercedes-Benz. Và phiên bản Mercedes-Benz S 450 L Luxury cũng không ngoại lệ khi được tích hợp hàng loạt công nghệ hỗ trợ lái thông minh, trang bị tiện nghi hàng đầu, nhằm đảm bảo an toàn tuyệt đối cũng như mang lại sự thoải mái như ở nhà cho mọi hành khách.
5.1 AN TOÀN:
   ●    Hệ thống hỗ trợ lái xe ban đêm NIGHT VIEW ASSIST PLUS.

   ●    Hệ thống hỗ trợ đỗ xe chủ động Active Parking Assist tích hợp PARKTRONIC.

   ●    Hệ thống tự động bảo vệ PRE-SAFE®, PRE-SAFE® Impulse và PRE-SAFE® Sound.

   ●    Hệ thống chống bó cứng phanh ABS.

   ●    Hệ thống hỗ trợ lực phanh khẩn cấp BAS.

   ●    Hệ thống chống trượt khi tăng tốc ASR.

   ●    Hệ thống ổn định thân xe điện tử và hỗ trợ ổn định xe khi gió thổi ngang ESP.

   ●    Hệ thống ESP® Curve Dynamic Assist giúp hỗ trợ ổn định khi vào cua.

   ●    Hệ thống phanh ADAPTIVE với chức năng hỗ trợ dừng xe (HOLD) và hỗ trợ khởi hành ngang dốc (Hill-Start Assist).

   ●    Dây đai an toàn 3 điểm cho tất cả các ghế với bộ căng đai khẩn cấp và giới hạn lực siết.

   ●    Camera 360° với độ phân giải cao.

   ●    Túi khí phía trước, túi khí bên hông phía trước và sau, túi khí cửa sổ.
5.2 TIỆN NGHI:
   ●    Ghế người lái và hành khách phía trước điều chỉnh điện, tích hợp bộ nhớ 3 vị trí cho ghế trước.

   ●    Hàng ghế sau điều chỉnh điện với bộ nhớ ghế, tựa đầu sang trọng cỡ lớn. Ghế hành khách phía trước có tựa đầu sang trọng cỡ lớn, có thể gập và tháo rời, đỡ chân điều chỉnh điện.

   ●    Hệ thống sưởi và thông gió cho hàng ghế trước và hàng ghế sau.

   ●    Ghế 2 bên của hàng ghế sau tích hợp chức năng 6 chế độ massage, trong đó 2 chế độ có thể kết hợp với hệ thống sưởi tạo ra hiệu ứng massage đá nóng.

   ●    Hệ thống dẫn đường và định vị vệ tinh toàn cầu GPS tích hợp bản đồ Việt Nam.

   ●    Điều hòa khí hậu tự động 4 vùng THERMOTRONIC cho hàng ghế trước và hàng ghế sau.

   ●    Hệ thống khóa xe thông minh và khởi động bằng nút bấm KEYLESS-GO.

   ●    Chức năng HANDS-FREE ACCESS hỗ trợ mở cốp sau khi cả hai tay đang mang, xách đồ.
   Với nhiều trang bị đáng giá, Mercedes-Benz S 450 L Luxury đã vượt xa mọi mong đợi về sự hoàn hảo và chinh phục không ít tay lái bởi sự uy nghi và sang trọng của mình. Bởi vậy, ngay từ khi ra mắt, mẫu xe này luôn nhận được sự ưu ái và đánh giá cao từ các chuyên gia cũng như người dùng trên toàn thế giới và cả tại thị trường Việt.   
', '07/29/2020',7)
insert into Xe(MaXe, LoaiXe,TenXe, GiaXe,AnhBia,MoTa,NgayCapNhat,MaClass) values
(17,'S-CLASS','Mercedes-Benz S 450 L', 4299000000,'Mercedes-Benz S 450 L.png',N'
1.GIỚI THIỆU CHUNG:
S-Class là dòng xe thuộc phân khúc Sedan hạng sang cỡ lớn của Mercedes-Benz. Được phát triển dựa trên phiên bản tiền nhiệm Ponton ra mắt vào năm 1954, đến năm 1972, dòng xe này chính thức được đổi tên thành S-Class. Trải qua 6 thế hệ bao gồm: W116 (1972 – 1980), W126 (1980 – 1991), W140 / C140 (1991 – 1998), W220 (1998 – 2005), W221 (2006 – 2013) và hiện tại là W222 / C217 / A217, S-Class vẫn là sự lựa chọn hàng đầu của nhiều doanh nhân thành đạt. Nếu chỉ tính riêng thế hệ W222, từ năm 2013 cho đến nay thì đã có hơn 300.000 sản phẩm S-Class được bán ra trên toàn cầu. Trong đó, doanh số năm 2017 vượt mốc con số 100.000 sản phẩm.
Vào tháng 6/2018, bộ đôi Mercedes-Benz S 450 L và Mercedes-Benz S 450 L Luxury chính thức trình làng sau hơn nửa năm lỡ hẹn. Không làm khách hàng thất vọng, những thay đổi của những phiên bản này đã giúp S-Class tăng thêm sự đẳng cấp, sang trọng. Theo đó, hãng đã nhận hơn 100 đơn đặt hàng cho các phiên bản S-Class mới này vào ngày ra mắt.
Trong số những phiên bản S-Class mới, Mercedes-Benz S 450 L gây được sự chú ý bởi thiết kế cuốn hút, nhiều tiện nghi cao cấp nhưng mức giá lại tiết kiệm hơn so với các bản S-Class còn lại. Ngoài ra, đây cũng là bản nâng cấp Facelift thay thế cho Mercedes-Benz S 400 vốn đã rất thành công trước đó.
2.NGOẠI THẤT:
Vẫn sử dụng ngôn ngữ thiết kế Sensual Purity (Sự thuần khiết gợi cảm) đặc trưng của nhiều dòng xe Mercedes-Benz, cùng các thông số Dài x Rộng x Cao lần lượt là 5255 x 1899 x 1494 (mm), tổng quan Mercedes-Benz S 450 L toát lên sự cuốn hút ngay từ ánh nhìn đầu tiên. Hãng đã tăng chiều dài thêm 9mm, mặc dù không quá khác biệt so với bản cũ nhưng chi tiết này cũng góp phần tạo cho vẻ ngoài xe thêm thanh thoát. Đồng thời, phiên bản này cũng sử dụng mâm xe mới, loại 5 chấu kép 18 inch.
So với Mercedes-Benz S 400, Mercedes-Benz S 450 L đã thay đổi khá nhiều ở mặt trước xe. Không còn sử dụng lưới tản nhiệt 4 nan đơn, phiên bản mới sử dụng dạng 4 nan kép vô cùng sành điệu. Cản trước của xe với thiết kế liền khối cùng thanh chrome cỡ lớn nằm ngang. Biểu tượng “ngôi sao 3 cánh” được đặt dựng đứng trên nắp ca-pô tạo vẻ uy nghi cho phần đầu xe.
Đặc biệt, xe còn sử dụng công nghệ đèn pha MULTIBEAM mới. Không chỉ khiến phần đầu xe thêm sắc sảo, công nghệ này còn giúp việc di chuyển trong điều kiện thiếu sáng trở nên an toàn hơn. Trong đó, tính năng ULTRA RANGE Highbeam của MULTIBEAM có khả năng nâng cao tầm nhìn lên đến 650m khi trời tối nhưng hoàn toàn không gây chói mắt những phương tiện di chuyển ở chiều ngược lại.
Thiết kế phía sau xe cũng vô cùng độc đáo với cản sau được hạ thấp hơn so với bản cũ, đồng thời liền khối theo phương ngang với thanh chrome ôm trọn hai ống xả. Không những thế, cụm đèn hậu của Mercedes-Benz S 450 L còn tạo ra hiệu ứng pha lê nhờ thiết kế 3 tầng tinh tế.
Danh sách những màu ngoại thất của Mercedes-Benz S 450 L:

   ●    Trắng Polar (149)

   ●    Đen Magnetite (183)

   ●    Đen Obsidian (197)

   ●    Bạc Iridium (775)

   ●    Xanh Cavansite (890)

   ●    Đỏ Ruby (897)

   ●    Bạc Diamond (988)

   ●    Xanh Emerald (989)
3.NỘI THẤT:
Phần nội thất vẫn đậm chất Mercedes-Benz với chất liệu da cao cấp cùng 3 màu nội thất sành điệu Đen (201), Vàng Silk (205) và Nâu Nut (214). Với chiều dài cơ sở lên đến 3165mm, mẫu Sedan hạng sang sở hữu không gian nội thất vô cùng rộng rãi. Ngoài ra, xe còn có đèn viền nội thất với 64 màu và 10 kiểu phối màu khác nhau giúp khách hàng dễ dàng tạo ra một không gian ánh sáng phù hợp với sở thích bản thân.
Phía bên trên trần Mercedes-Benz S 450 L là cửa sổ trời siêu rộng Panoramic. Bên cạnh tạo cảm giác cabin xe được mở rộng hơn, khách hàng còn có thể mở cửa sổ trời này khi di chuyển ở những khu vực ít nắng hoặc buổi tối để tận hưởng không khí trong lành bên ngoài.
Điểm thay đổi nhiều nhất ở thiết kế nội thất Mercedes-Benz S 450 L nằm ở cụm điều khiển. Hãng đã sử dụng ốp gỗ bóng Burr Walnut màu nâu cho khu vực này. Ngoài ra, tay lái đa chức năng cũng được thiết kế hoàn toàn mới với 3 chấu hình chữ V. Bố cục của cụm điều khiển cũng được điều chỉnh lại nhằm tạo sự tinh gọn và hỗ trợ người lái dễ thao tác hơn.
4.ĐỘNG CƠ:
Ở phiên bản mới này, hãng cũng đã nâng cấp động cơ trở nên mạnh mẽ hơn. Theo đó Mercedes-Benz S 450 L sử dụng động cơ V6 với dung tích công tác 2996cc, cho ra công suất cực đại đạt 270 kW [367 hp] tại 5500 – 6000 vòng/phút và mô-men xoắn cực đại đạt 480 Nm tại 1600 – 4000 vòng/phút. Song song đó, xe cũng sử dụng hộp số Tự động 9 cấp 9G-TRONIC PLUS cùng dẫn động cầu sau.
Nhờ được nâng cấp động cơ, Mercedes-Benz S 450 L đã rút ngắn thời gian tăng tốc từ 0 – 100 km/h chỉ trong vòng 5,4 giây. Đồng thời, vận tốc tối đa cũng tăng lên 250km/h. Không những thế, khi sử dụng cụm chuyển đổi DYNAMIC SELECT, khách hàng dễ dàng lựa chọn hoặc thiết lập chế độ lái phù hợp với bản thân như: Eco, Comfort, Sport, Individual.
5.AN TOÀN VÀ TIỆN NGHI:
5.1 AN TOÀN:
Một trong những nguyên nhân giúp cho S-Class cũng như Mercedes-Benz S 450 L được các chuyên gia đánh giá cao chính là nằm ở yếu tố an toàn. Những công nghệ an toàn hàng đầu không chỉ giúp khách hàng lái xe an toàn hơn mà còn giúp giảm thiểu tối đa thương vong trong và cả sau khi xảy ra tai nạn. Những công nghệ nổi bật có thể kể đến như chức năng cảnh báo mất tập trung ATTENTION ASSIST; hệ thống ESP® Curve Dynamic Assist giúp hỗ trợ ổn định khi vào cua; Hệ thống tự động bảo vệ PRE-SAFE®; PRE-SAFE® Impulse và PRE-SAFE® Sound, Hệ thống khóa cửa trung tâm với chức năng tự động khóa khi xe chạy và mở khóa trong trường hợp khẩn cấp;…
5.2 TIỆN NGHI:
Mercedes-Benz S 450 L mang đến hàng loạt các công nghệ giúp khách hàng giải trí hoặc xử lý công việc ngay trên xe. Không chỉ có 2 màn hình màu 12,3-inch chuẩn HD cho màn hình điều khiển trung tâm và màn hình giải trí đa phương tiện, mẫu xe này còn cung cấp các tiện nghi công nghệ khác như điều khiển bằng giọng nói, kết nối Apple CarPlay và Android Auto, màn hình giải trí cảm ứng Touchpad,… Đặc biệt, tất cả đều sẽ có giao diện tiếng Việt, từ đó giúp người dùng thao tác nhanh hơn.
Ngoài công nghệ, Mercedes-Benz S 450 L còn rất quan tâm đến sức khỏe của khách hàng. 2 ghế bên thuộc hàng ghế sau có sở hữu chức năng massage cao cấp với 6 chế độ, trong đó có 2 chế độ kết hợp với hệ thống sưởi tạo ra hiệu ứng massage đá nóng vô cùng thoải mái. Bên cạnh đó, công nghệ AIR-BALANCE với bộ lọc không khí, chức năng ion hóa oxy, và 4 hương nước hoa được điều chế độc quyền bởi Marc vom Ende sẽ giúp khách hàng cảm thấy thư giãn hơn sau một ngày làm việc mệt mỏi.
Kế thừa những tinh hoa của phiên bản cũ và bổ sung thêm nhiều tiện nghi hơn, Mercedes-Benz S 450 L sẽ giúp bạn giải trí, thư giãn hoặc kể cả xử lý công việc ngay trên khoang xe. Ngoài ra, mặc dù là dòng xe thương gia thế nhưng mẫu xe này vẫn mang lại trải nghiệm lái tuyệt vời, đặc biệt là ở tốc độ cao. Vì thế, phiên bản S-Class 2018 này sẽ là gợi ý mà bạn không nên bỏ qua khi lựa chọn sản phẩm Sedan hạng sang cỡ lớn.
', '03/29/2020',7)
SET IDENTITY_INSERT Xe OFF;

SET IDENTITY_INSERT KhachHang ON;
SET IDENTITY_INSERT [dbo].[KhachHang] OFF

SET IDENTITY_INSERT DonDatHang ON;
SET IDENTITY_INSERT DonDatHang OFF;

SET IDENTITY_INSERT PhuKien ON;
insert into PhuKien (MaPhuKien,Phukien) values 
(1,N'Phanh')
insert into PhuKien (MaPhuKien,Phukien) values
(2,N'Lọc Gió')
insert into PhuKien (MaPhuKien,Phukien) values
(3,N'Lọc Dầu')
insert into PhuKien (MaPhuKien,Phukien) values
(4,N'Thanh Gạt Nước')
insert into PhuKien (MaPhuKien,Phukien) values
(5,N'Đèn Pha / Đèn Hậu')
SET IDENTITY_INSERT PhuKien OFF;

SET IDENTITY_INSERT ChiTietPhuKien ON;
Insert into ChiTietPhuKien(Ma,TenPhukien,AnhPhuKien,MoTa1,Mota2,MaPhuKien) values 
(1,N'Đĩa Phanh', 'phutungvideoPhanh1.mp4', 
N'Tại sao nên sử dụng đĩa phanh chính hãng Mercedes-Benz?',
N'Lớp sơn phủ hoàn hảo chống ăn mòn.
Độ ma sát tối ưu giữa má phanh và đĩa phanh tạo khả năng phanh tối ưu và khoảng cách dừng an toàn.
Dành riêng cho xe Mercedes-Benz, đảm bảo cấu hình tối ưu cho hệ thống an toàn như ABS và ESP.
Vật liệu chất lượng cao, tay nghề vượt bật, lắp đặt chính xác  và tản nhiệt đồng nhất.
Đĩa phanh nhẹ độc quyền sáng chế với hệ thống bánh răng tiên tiến giữa vành phanh và moay ơ thép giúp nâng cao hiệu quả nhiên liệu và sự thoải mái khi lái xe. Bề rộng được công nhận* của rãnh phù hợp với đĩa phanh nhẹ.',1)
Insert into ChiTietPhuKien(Ma,TenPhukien,AnhPhuKien,MoTa1,Mota2,MaPhuKien) values 
(2,N'Má Phanh', 'phutungvideoPhanh2.mp4', N'Tại sao nên sử dụng má phanh chính hãng Mercedes-Benz?',
N'Bộ lắp đặt chính xác và nhanh chóng giúp giảm thời gian lắp đặt và chi phí dịch vụ.
Độ ma sát tối ưu giữa má phanh và đĩa phanh chính hãng tạo khả năng phanh tối ưu và khoảng cách dừng an toàn.
Dành riêng cho xe Mercedes-Benz và hệ thống an toàn trên xe để đảm bảo cấu hình tối ưu cho hệ thống an toàn như ABS và ESP.
Chỉ sử dụng vật liệu cao cấp giúp giảm hao mòn và hư hỏng.',1)
Insert into ChiTietPhuKien(Ma,TenPhukien,AnhPhuKien,MoTa1,Mota2,MaPhuKien) values 
(3,N'Lọc Gió Điều Hòa','videoLocGio1.mp4',N'Tại sao nên sử dụng lọc gió điều hòa chính hãng Mercedes-Benz?',
N'Lớp than hoạt tính hiệu quả cao làm giảm khí độc và mùi hôi trong khoang hành khách.
Lựa chọn và tổng hợp tối ưu các vật liệu lọc giúp thẩm thấu lượng lớn các tạp chất nhỏ hơn 0.5 µm.
Lọc gió đã đăng ký ECARF để bảo vệ khỏi các tạp chất gây hại, duy trì những đặc tính chống dị ứng của nội thất xe.
Cấu trúc khung và lọc cứng cáp, trục dẫn độc quyền sáng chế,  đảm bảo độ chính xác lắp đặt tối ưu và độ kín hoàn hảo.',2)
Insert into ChiTietPhuKien(Ma,TenPhukien,AnhPhuKien,MoTa1,Mota2,MaPhuKien) values 
(4,N'Lọc Gió Động Cơ', 'LocGio2.mp4',N'Tại sao nên sử dụng lọc gió động cơ chính hãng Mercedes-Benz?',
N'Vật liệu lọc và khung lọc cao cấp làm tăng tuổi thọ và hiệu quả lọc.
Kết cấu lọc ổn định lâu dài., độ chính xác cao trong lắp đặt giúp tránh biến dạng, tối ưu hóa không khí đến buồng đốt. 
Hiệu quả lọc và ngăn cách cao. 
Khả năng chịu nước cao.
Giấy lọc làm từ chất liệu giảm bắt lửa ngăn nguy cơ cháy nổ trong khoang động cơ.',2)
Insert into ChiTietPhuKien(Ma,TenPhukien,AnhPhuKien,MoTa1,Mota2,MaPhuKien) values 
(5,N'Lọc Dầu','LocDau2.mp4',N'Tại sao nên sử dụng lọc dầu chính hãng Mercedes-Benz?',
N'Vật liệu lọc cao cấp, hiệu quả lọc cao ngay cả trong điều kiện khắc nghiệt. 
Độ tương ứng tối ưu giữa hiệu quả lọc cao và khả năng giữ lại bụi bẩn.
Kích cỡ lọc dầu đúng chuẩn và độ chính xác cao trong lắp đặt đảm bảo tối ưu hóa tính chất lọc dầu kín và đơn giản trong lắp đặt.',3)
Insert into ChiTietPhuKien(Ma,TenPhukien,AnhPhuKien,MoTa1,Mota2,MaPhuKien) values 
(6,N'Thanh Gạt Nước','thanhgatnuoc.mp4',N'Tại sao nên sử dụng thanh gạt nước chính hãng Mercedes-Benz?',
N'Thiết kế hoàn toàn phù hợp với độ cong kính xe giúp duy trì áp lực ổn định trên khu vực quét, không gây tiếng ồn.
Đa cấu phần, sử dụng cao su công thức đặc biệt Mercedes-Benz.
Đánh dấu thương hiệu Mercedes-Benz và chức năng báo bảo trì tân tiến.
Đầu nối độc quyền sáng chế của Mercedes-Benz giúp kết nối nhanh với khóa an toàn được tích hợp.',4)
Insert into ChiTietPhuKien(Ma,TenPhukien,AnhPhuKien,MoTa1,Mota2,MaPhuKien) values 
(7,N'Đèn Pha & Đèn Hậu', 'denphadenhau.mp4',N'Tại sao nên sử dụng đèn pha/đèn hậu chính hãng Mercedes-Benz?',N'Thiết kế riêng biệt cho từng dòng xe. 
Phù hợp với hệ thống điện trên xe.
Bảo hành tiêu chuẩn Mercedes-Benz.
Ký hiệu thương hiệu phụ tùng chính hãng Mercedes-Benz.
Đèn hậu thông hơi dành cho dòng C-Class sedan và coupé (W/ C 204) với hệ thống thoát khí, được cấp bằng độc quyền sáng chế tại Đức, Pháp, Anh, Nhật Bản và Mỹ giúp tăng cường khí động lực học cho xe.',5)
SET IDENTITY_INSERT ChiTietPhuKien OFF;

SET IDENTITY_INSERT Class ON;
Insert Into Class(MaClass, TenClass) values
(1,'E-CLASS')
Insert Into Class(MaClass, TenClass) values
(2,'C-CLASS')
Insert Into Class(MaClass, TenClass) values
(3,'CLA')
Insert Into Class(MaClass, TenClass) values
(4,'GLA')
Insert Into Class(MaClass, TenClass) values
(5,'GLC')
Insert Into Class(MaClass, TenClass) values
(6,'GLS')
Insert Into Class(MaClass, TenClass) values
(7,'S-CLASS')
SET IDENTITY_INSERT Class Off;

SET IDENTITY_INSERT LoaiDoChoiXe ON;
Insert Into LoaiDoChoiXe(MaLoaiDC, TenLoaiDC) values
(1,N'Camera Hành Trình')
Insert Into LoaiDoChoiXe(MaLoaiDC, TenLoaiDC) values
(2,N'Ốp bảo vệ')
Insert Into LoaiDoChoiXe(MaLoaiDC, TenLoaiDC) values
(3,N'Thảm lót sàn')
Insert Into LoaiDoChoiXe(MaLoaiDC, TenLoaiDC) values
(4,'Logo')
Insert Into LoaiDoChoiXe(MaLoaiDC, TenLoaiDC) values
(5,N'Nước Hoa')
Insert Into LoaiDoChoiXe(MaLoaiDC, TenLoaiDC) values
(6,N'Cảm Biến Áp Suất')
Insert Into LoaiDoChoiXe(MaLoaiDC, TenLoaiDC) values
(7,N'Vô Lăng')
Insert Into LoaiDoChoiXe(MaLoaiDC, TenLoaiDC) values
(8,N'Phụ Kiện Khác')
SET IDENTITY_INSERT LoaiDoChoiXe Off;

SET IDENTITY_INSERT [dbo].[ADMIN] ON
INSERT [dbo].[ADMIN] ([MaAdmin], [HoTen], [DiaChi], [DienThoai], [TenDN], [MatKhau], [Email],[Quyen]) VALUES (2, N'Nguyễn Nhật Minh', N'Bình Dương', N'012344444', N'admin', N'12345', N'minhvnn@tdmu.edu.vn',1)
SET IDENTITY_INSERT [dbo].[ADMIN] OFF

SET IDENTITY_INSERT DonDatHangDoChoi ON;
SET IDENTITY_INSERT DonDatHangDoChoi Off;

SET IDENTITY_INSERT ChiTietDonDatHangDC ON;
SET IDENTITY_INSERT ChiTietDonDatHangDC Off;

SET IDENTITY_INSERT DoChoiXe ON;
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(1,N'Camera',N'Camera hành trình Xiaomi 70mai A800 Dash Cam 4K – 2 mắt trước sau', 3590000,N'Camera hành trình Xiaomi 70mai A800 Dash Cam 4K – 2 mắt trước sau.png',N'Camera hành trình Xiaomi 70mai Dash Cam A800 4K là dòng sản phẩm mới ra mắt thuộc thương hiệu Xiaomi vào đầu tháng 10 năm 2020. Tính đến thời điểm hiện tại, đây đang là dòng sản phẩm cho chất lượng hình ảnh cao, được nhiều người săn đón. Cam Xiaomi 70mai Dash Cam A800 4K hiện đang là đối thủ đáng gờm trong phân khúc camera hành trình 4K. Sản phẩm bao gồm Camera trước và sau.
Sản phẩm được bảo hành 12 tháng (lỗi đổi mới)','04/12/2021',1)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(2,N'Camera',N'Camera hành trình Xiaomi 70mai A800S Dash Cam 4K – 2 mắt trước sau',3690000,N'Camera hành trình Xiaomi 70mai A800S Dash Cam 4K – 2 mắt trước sau.png',N'Camera hành trình Xiaomi 70mai A800S Dash Cam 4K - 2 mắt trước sau là sản phẩm mới ra mắt tại thị trường Việt Nam vào tháng 2 năm 2021. 70mai là thương hiệu trong hệ sinh thái Xiaomi và 70mai A800S đủ sức hấp dẫn để cạnh tranh đáng kể với các dòng sản phẩm cùng phân khúc 4K Dual dash cam (2 camera trước sau). Model 70mai A800S mới, hiện đại không chỉ có đầy đủ những tính năng 
của camera hành trình mà còn là một sự đột phá trong chất lượng ghi hình. và tính năng đầy bất ngờ. Tổng quan về 70mai A800S 4K: - 70mai A800S 4K: Thiết kế tinh tế - Sở hữu cấu hình mạnh mẽ - Thấu kính thủy tinh 7 lớp Tính năng nổi bật của 70mai A800S 4K: - 70mai A800S 4K: Video độ nét cao - Cảm biến hình ảnh nhìn ban đêm mới của Sony - Chuyển đổi giữa ghi âm kép phía trước và phía sau - ADAS: Tăng độ an toàn khi lái xe của 70mai A800S 4K - Lưu lại lịch trình (đản đồ) di chuyển trong khoảng 30 ngày - Chế độ đỗ xe, Giám sát bãi đậu xe 24 giờ - 70mai A800S 4K tích hợp sẵn 
GPS - Kết nối với điện thoại di động thông qua Wifi và chia sẻ tức thì','04/12/2021',1)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(3,N'Camera',N'Camera hành trình Xiaomi 70mai A500s Dash Cam 2K7 – 2 mắt trước sau',2890000,N'Camera hành trình Xiaomi 70mai A500s Dash Cam 2K7 – 2 mắt trước sau.png',N'Camera hành trình Xiaomi 70mai A500S Dash Cam 2K7 - 2 mắt trước sau ghi hình trước sau siêu nét, tích hợp sẵn GPS hiển thị tốc độ. Đây là phiên bản nâng cấp hoàn hảo của người đàn anh 70mai A500 được các Fan Xiaomi 70mai chào đón và đang gây sốt trên thị trường camera hành trình cho xe ô tô hiện nay. Ngoài việc mang trên mình đầy đủ các tính năng có trên A500 ra thì 70mai A500S còn có thêm 
camera ghi hình phía sau đã biến đây trở thành một sản phẩm “Ngon – Bổ – Rẻ” đúng nghĩa. Sản phẩm là phiên bản quốc tế, được bảo hành 12 tháng (lỗi đổi mới)','04/12/2021',1)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(4,N'Camera',N'Camera hành trình Vietmap iDVR P2 – Thiết kế gương tràn viền, định vị xe trực tuyến',5390000,N'Camera hành trình Vietmap iDVR P2 – Thiết kế gương tràn viền, định vị xe trực tuyến.jpg',N'Camera hành trình Vietmap iDVR P2 là sản phẩm mới nhất của hãng Vietmap với tính năng nổi bật: - Phần mềm dẫn đường thông minh VIETMAP S1 - Ghi hình cùng lúc trước & sau - Camera sau vừa ghi hình vừa hỗ trợ lùi - Hỗ trợ SIM dữ liệu 4G tốc độ cao - Hỗ trợ phát WIFI HOTSPOT - Ứng dụng quản lý xe thông minh VietMap iDVR - Hỗ trợ định vị xe trực tuyến - Hỗ trợ 
truyền hình trực tiếp video từ xa - Chụp ảnh từ xaBảo hành chính hãng 12 tháng tại tất cả các đại lý của Vietmap trên toàn quốc','04/12/2021',1)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(5,N'Camera',N'Camera hành trình Vietmap C61 – Ghi hình 4K (Tặng kèm thẻ nhớ 32G)',3280000,N'Camera hành trình Vietmap C61 – Ghi hình 4K (Tặng kèm thẻ nhớ 32G).png',N'Camera hành trình Vietmap C61 là phiên bản cải tiến của dòng camera hành trình cảnh báo giao thông. Camera 1 mắt, ghi hình góc rộng, bao quát toàn cảnh, hình ảnh 4K chân thực sắc nét.Camera hành trình Vietmap C61 có kích thước nhỏ gọn, vô cùng tiện dụng khi lắp đặt trên xe. Không làm mất quá nhiều diện tích. Không che mất tầm nhìn quan sát của tài xế. Được trang bị công nghệ quay video sắc 
nét chân thực. Kết nối Wifi giúp bạn có thể lên mạng, xem video mọi lúc mọi nơi. Đồng thời bạn sẽ có 1 người bạn đồng hành hết sức có tâm khi liên tục cảnh báo tốc độ, chướng ngại vật, vị trí kiểm tra tốc độ bằng giọng nói nhẹ nhàng.','04/12/2021',1)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(6,N'Camera',N'Màn hinh HUD Vietmap – H1x hiển thị thông tin OBD-II',2490000,N'Màn hinh HUD Vietmap – H1x hiển thị thông tin OBD-II.jpg',N'Màn hình hiển thị thông tin lên kính lái xe HUD H1X thông minh, cung cấp thông tin dữ liệu giao thông không đòi hỏi người sử dụng thay đổi góc nhìn giúp việc lái xe dễ dàng và an toàn.HUD H1X có thể cập nhật và cho phép hiển thị nhiều thông số hoạt động khác nhau của xe giúp người điều khiển xe an toàn đồng thời nắm bắt được trạng thái xe thông qua cổng OBDII gồm có :  Tốc độ xe.  Nhiên liệu tiêu thụ.  Điện áp bình.  Nhiệt độ két nước.  Vòng tua máy.','04/12/2021',1)

insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(8,N'Ốp bảo vệ',N'Bộ ốp bọc chân ga, chân phanh AMG cho xe Mercedes-Benz',590000,N'Bộ ốp bọc chân ga, chân phanh AMG cho xe Mercedes-Benz.jpg',N'Bộ ốp bọc chân ga, chân phanh AMG cho xe Mercedes-Benz. Chất liệu Nhôm đúc và Cao su, chịu lực tốt, độ bền và tuổi thọ sử dụng cao. Thiết kế ôm sát, bảo vệ chân ga, chân phanh nguyên bản của xe, hạn chế sự mòn vẹt do ma sát ở bàn đạp.Tăng diện tích tiếp xúc giữa bàn chân và bàn đạp, hỗ trợ điều khiển ô tô dễ dàng hơn, tốt hơn. Mặt tiếp xúc bọc chân ga, chân phanh bằng cao su, được thiết kế gân nổi trên bề mặt, tăng ma sát giữa đế giày, dép…. và bàn đạp, khắc phục tình trạng đạp trượt, nhầm khi lái xe.Bộ sản phẩm gồm: 1 bọc chân phanh, 1 bọc chân ga.','04/12/2021',2)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(10,N'Ốp bảo vệ',N'Bộ ốp gương chiếu hậu Mercedes C Class C180, C200, C250, C300 đen bóng',690000,N'Bộ ốp gương chiếu hậu Mercedes C Class C180, C200, C250, C300 đen bóng.jpg',N'Bộ ốp gương chiếu hậu Mercedes C Class C180, C200, C250, C300 đen bóng. Được sản xuất trên dây chuyền công nghệ hiện đại, với chất liệu nhựa ABS đen bóng, cá tính, mạnh mẽ và sang trọng, vừa vặn với phom gương chiếu hậu, tạo điểm nhấn nổi bật cho diện mạo xế yêu của bạn. Đồng thời, bảo vệ cho gương chiếu hậu không bị trầy xước, phai màu sơn theo thời gian dài sử dụng.','04/12/2021',2)

insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(11,N'Ốp bảo vệ',N'Ốp hõm cửa xe Mercedes GLC-Class (GLC200, GLC250, GLC300) 2016-2020 nhựa ABS vân Carbon cao cấp',520000,N'Ốp hõm cửa xe Mercedes GLC-Class (GLC200, GLC250, GLC300) 2016-2020 nhựa ABS vân Carbon cao cấp.jpg',N'Ốp hõm cửa xe Mercedes GLC-Class (GLC200, GLC250, GLC300) nhựa ABS vân Carbon cao cấp được sản xuất trên dây chuyền tiên tiến hiện đại, vừa vặn với phom hõm cửa xe. Chất liệu nhựa ABS vân Carbon mạnh mẽ, sang trọng, tạo điểm nhấn nổi bật cho diện mạo xế yêu của bạn. Đồng thời, bảo vệ cho các tay nắm – hõm cửa không bị trầy xước, phai màu sơn theo thời gian dài sử dụng.','04/12/2021',2)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(12,N'Ốp bảo vệ',N'Ốp chống trầy cốp INOX Mercedes C180, C200, C250, C300 – Bên trong',890000,N'Ốp chống trầy cốp INOX Mercedes C180, C200, C250, C300 – Bên trong.jpg',N'Ốp chống trầy bậc cốp bên trong Mercedes C180, C200, C250, C300 chất liệu INOX sáng bóng, độ bền cao, không bị phai màu, rạn nứt hay han gỉ trong thời gian dài sử dụng. Được sản xuất trên dây chuyền công nghệ hiện đại, thiết kế vừa vặn với phom bậc cốp của xe.Sản phẩm được thiết kế các chi tiết nổi, vừa có tác dụng bảo vệ chống trầy xước bậc cốp của xe trong quá trình sử dụng. Vừa có tác dụng trang trí, làm nổi bật cốp xe khi nhìn từ phía sau, mang lại sự đẳng cấp và sang trọng cho xế yêu của bạn.','04/12/2021',2)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(13,N'Ốp bảo vệ',N'Ốp chống trầy cốp Titan Mercedes C180, C200, C250, C300 2016-2020 – Bên trong',1090000,N'Ốp chống trầy cốp Titan Mercedes C180, C200, C250, C300 2016-2020 – Bên trong.jpg',N'Ốp chống trầy cốp Titan Mercedes C180, C200, C250, C300 2016-2020 – Bên trong chất liệu thép không gỉ, sơn tĩnh điện Titan, độ bền cao, không bị phai màu, rạn nứt hay han gỉ trong thời gian dài sử dụng. Được sản xuất trên dây chuyền công nghệ hiện đại, thiết kế vừa vặn với phom bậc cốp ngoài của xe.Sản phẩm được thiết kế các chi tiết nổi, vừa có tác dụng bảo vệ chống trầy xước bậc cốp trong của xe trong quá trình sử dụng. Vừa có tác dụng trang trí, làm nổi bật cốp xe khi nhìn từ phía sau, mang lại sự đẳng cấp và sang trọng cho xế yêu của bạn.',
'04/12/2021',2)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(14,N'Ốp bảo vệ',N'Ốp tay nắm cửa xe Mercedes C180, C200, C250, C300 mạ Crom',450000,N'Ốp tay nắm cửa xe Mercedes C180, C200, C250, C300 mạ Crom.jpg',N'Ốp tay nắm cửa xe Mercedes C180, C200, C250, C300 mạ Crom.Được sản xuất trên dây chuyền tiên tiến hiện đại với chất liệu nhựa ABS được mạ Crom sáng bóng, vừa vặn với phom tay nắm cửa xe, tạo điểm nhấn nổi bật cho diện mạo xế yêu của bạn. Đồng thời, bảo vệ cho các tay nắm cửa không bị trầy xước, phai màu sơn theo thời gian dài sử dụng.Bộ sản phẩm gồm 5 chi tiết cho 4 cửa xe, có sẵn keo 3M ở mặt sau sản phẩm, rất chắc chắn, sử dụng được trong nhiều điều kiện thời tiết. Khách hàng có thể tự lắp đặt tại nhà mà không cần tới sự trợ giúp của kĩ thuật viên cũng như không cần phải mang đến các Gara lắp đặt, chỉ cần bóc miếng dán 2 mặt và vệ sinh sạch sẽ bề mặt cần dán rồi dán lên trên.','04/12/2021',2)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(15,N'Ốp bảo vệ',N'Ốp tay nắm cửa xe Mercedes-Benz C-Class, GLC-Class 2016-2020 nhựa ABS vân Carbon cao cấp',520000,N'Ốp tay nắm cửa xe Mercedes-Benz C-Class, GLC-Class 2016-2020 nhựa ABS vân Carbon cao cấp.jpg',N'Ốp tay nắm cửa xe Mercedes-Benz C-Class, GLC-Class 2016-2020 nhựa ABS vân Carbon cao cấp, được sản xuất trên dây chuyền tiên tiến hiện đại, vừa vặn với phom tay nắm cửa xe. Chất liệu nhựa ABS vân Carbon mạnh mẽ, sang trọng, tạo điểm nhấn nổi bật cho diện mạo xế yêu của bạn. Đồng thời, bảo vệ cho các tay nắm – hõm cửa không bị trầy xước, phai màu sơn theo thời gian dài sử dụng.','04/12/2021',2)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(16,N'Ốp bảo vệ',N'Bộ ốp hõm cửa xe Mercedes GLC200, GLC250, GLC300 mạ Crom',450000,N'Bộ ốp hõm cửa xe Mercedes GLC200, GLC250, GLC300 mạ Crom.jpg',N'Bộ ốp hõm cửa xe Mercedes GLC200, GLC250, GLC300 2016-2020  mạ Crom. Được sản xuất trên dây chuyền tiên tiến hiện đại với chất liệu nhựa ABS được mạ Crom sáng bóng, vừa vặn với phom hõm cửa xe, tạo điểm nhấn nổi bật cho diện mạo xế yêu của bạn. Đồng thời, bảo vệ cho các hõm cửa không bị trầy xước, phai màu sơn theo thời gian dài sử dụng.','04/12/2021',2)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(17,N'Ốp bảo vệ',N'Bộ Ốp bậc cửa, Nẹp bước chân Titan Mercedes C180, C200, C250, C300 – Bên Trong',1650000,N'Bộ Ốp bậc cửa, Nẹp bước chân Titan Mercedes C180, C200, C250, C300 – Bên Trong.jpg',N'Bộ Ốp bậc cửa bên trong Mercedes C180, C200, C250, C300, Nẹp bước chân bên trong Mercedes C180, C200, C250, C300. Chất liệu thép không gỉ, sơn tĩnh điện Titan, độ bền cao, không bị phai màu, rạn nứt hay han gỉ trong thời gian dài sử dụng. Được sản xuất trên dây chuyền công nghệ hiện đại, thiết kế vừa vặn với phom bậc lên xuống xe.Sản phẩm được thiết kế các chi tiết nổi, vừa có tác dụng bảo vệ chống trơn trượt, chống trầy xước bậc lên xuống xe trong quá trình sử dụng xe. Vừa có tác dụng trang trí, làm nổi bật không gian nội thất, mang lại sự đẳng cấp và sang trọng cho xế yêu của bạn.',
'04/12/2021',2)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(18,N'Ốp bảo vệ',N'Bộ Ốp bậc cửa, Nẹp bước chân INOX Mercedes C180, C200, C250, C300 – Bên Trong',1490000,N'Bộ Ốp bậc cửa, Nẹp bước chân INOX Mercedes C180, C200, C250, C300 – Bên Trong.jpg',N'Bộ Ốp bậc cửa bên trong Mercedes C180, C200, C250, C300, Nẹp bước chân bên trong Mercedes C180, C200, C250, C300. Chất liệu INOX sáng bóng, độ bền cao, không bị phai màu, rạn nứt hay han gỉ trong thời gian dài sử dụng. Được sản xuất trên dây chuyền công nghệ hiện đại, thiết kế vừa vặn với phom bậc lên xuống xe.Sản phẩm được thiết kế các chi tiết nổi, vừa có tác dụng bảo vệ chống trơn trượt, chống trầy xước bậc lên xuống xe trong quá trình sử dụng xe. Vừa có tác dụng trang trí, làm nổi bật không gian nội thất, mang lại sự đẳng cấp và sang trọng cho xế yêu của bạn.','04/12/2021',2)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(19,N'Ốp bảo vệ',N'Ốp nội thất Mercedes C-Class C180, C200, C250, C300 vân Carbon cao cấp',1500000,N'Ốp nội thất Mercedes C-Class C180, C200, C250, C300 vân Carbon cao cấp.jpg',N'Ốp nội thất Mercedes C-Class C180, C200, C250, C300 vân Carbon cao cấp. Chất liệu nhựa ABS cao cấp, sơn tĩnh điện vân Carbon, được sản xuất trên dây chuyền công nghệ hiện đại, trùng khớp với từng chi tiết nội thất xe. Không những trang trí, làm nổi bật, tắng tính thẩm mỹ và mang lại sự sang trong cho không gian nội thất xe, mà còn bảo vệ chống trầy xước co ku vực cần số sau 1 thời gian dài sử dụng.','04/12/2021',2)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(20,N'Ốp bảo vệ',N'Bọc vô lăng D Cut logo cờ Pháp vân Carbon cao cấp',290000,N'Bọc vô lăng D Cut logo cờ Pháp vân Carbon cao cấp.jpg',N'Bọc vô lăng D Cut logo cờ Pháp vân Carbon cao cấp. Là dụng cụ trang trí và bảo vệ tay lái tuyệt hảo cho chiếc xe ô tô của bạn. Chất liệu da PU và cao su tự nhiên, được may dày dặn, bền chắc, mềm mại và có tính đàn hồi tốt, vẻ ngoài đẹp mắt và thời trang. Thiết kế đơn giản nhưng làm tôn lên nét lịch lãm sang trọng cho không gian nội thất xe thể hiện phong cách riêng của bạn.','04/12/2021',2)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(21,N'Thảm lót',N'Thảm sàn, lót sàn Mercedes GLC 200, GLC 250, GLC 300 thương hiệu Kata',1990000,N'Thảm sàn, lót sàn Mercedes GLC 200, GLC 250, GLC 300 thương hiệu Kata.jpg',N'Thảm sàn, lót sàn Mercedes GLC 200, GLC 250, GLC 300 thương hiệu Kata. Được thiết kế bởi những kĩ sư chuyên nghiệp, sự chi tiết và tỉ mỉ trong từng vị sẽ giúp lái xe không còn vấp phải những vấn đề về mất an toàn chân ga, phanh nữa. Với thành phần chính là cao su thiên nhiên đạt chuẩn Euro, thân thiện với môi trường, an toàn cho người sử dụng. Chất liệu cao su tự nhiên cao cấp không có mùi khó chịu, không thấm nước, dễ dàng tháo lắp lau chùi, vệ sinh. Chống chịu thời tiết tốt, không cong vênh khi đỗ xe ngoài nắng.Thảm lót sàn sau khi được đo và thiết kế sẽ được cài đặt và cắt bằng máy CNC theo khuôn mẫu zin của xe, 
để đảm bảo độ chính xác, trùng khớp với từng chi tiết sàn xe. Mặt trên thảm được thiết kế chấm bi tăng ma sát, mặt sau có gai nhám chống trơn trượt, tránh được những rủi ro do sự dịch chuyển của thảm khi điều khiển xe.Bộ Thảm sàn, lót sàn Mercedes GLC 200, GLC 250, GLC 300 thương hiệu Kata gồm thảm lót sàn cho 3 hàng ghế, được bảo hành 1 đổi 1 trong vòng 1 năm.','04/12/2021',3)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(22,N'Thảm lót',N'Lót cốp da 6D Mercedes GLC (GLC200, GLC250, GLC300) full thành',1500000,N'Lót cốp da 6D Mercedes GLC (GLC200, GLC250, GLC300) full thành.jpg',N'Lót cốp da 6D Mercedes GLC (GLC200, GLC250, GLC300) full thànhChất liệu:- Da cao cấp an toàn thân thiện với môi trường. Cấu tạo lớp thảm da gồm 5 lớp: da bề mặt – bông mút – đệm mút – dạ lót – gai nhám. Trong đó, lớp da bề mặt có 3 loại: PU tiêu chuẩn, PU cao cấp hoặc Carbon, đều có độ bền cao từ 3 đến 5 năm. – Gia công riêng cho xe đúng kích thước 100%Công dụng:Tạo sự mới mẻ cho chiếc xe của bạn.Tăng thêm tính sang trọng và tinh tế hơn cho nội thất.Độ bền cao, giảm ồn rất tốt, làm nổi bật nội thất xe.Độ bám tốt, được móc cố định, rất chắc chắn.Không mùi sử dụng An toàn cho sức khỏe và dễ dàng dễ vệ sinh.Nhiều màu sắc, mẫu mã lựa chọn.
Sản phẩm đều được may đo theo Form riêng từng hãng xe, loại xe, Model và đời xe. Quý khách hàng có thể tự lắp đặt tại nhà mà không cần sự hỗ trợ của nhân viên kỹ thuật.Lưu Ý: Sản phẩm có nhiều tùy chọn màu da, màu chỉ khác nhau. Quý khách có nhu cầu chọn màu thảm sàn khác vui lòng tham khảo bảng mầu mẫu trong hình ảnh sản phẩm. Sản phẩm shop cung cấp là lót cốp da 6D full thành bao gồm tấm lót cốp, tấm lót 2 bên thành cốp và tấm lót lưng  hàng ghế thứ 2, hàng ghế thứ 3.','04/12/2021',3)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(23,N'Thảm lót',N'Thảm sàn, lót sàn Da 6D cao cấp cho Mercedes GLC (200, 250, 300)',1490000,N'Thảm sàn, lót sàn Da 6D cao cấp cho Mercedes GLC (200, 250, 300).jpg',N'Thảm sàn, lót sàn 6D cao cấp cho Mercedes GLC (200, 250, 300)Chất liệu: .- Da cao cấp an toàn thân thiện với môi trường. - Gia công riêng cho xe đúng kích thước 100%Công dụng:Tạo sự mới mẻ cho chiếc xe của bạn.Tăng thêm tính sang trọng và tinh tế hơn cho nội thất.Độ bền cao, giảm ồn rất tốt, làm nổi bật nội thất xe.Độ bám tốt, được móc cố định, rất chắc chắn.Không mùi, không thấm nước sử dụng An toàn cho sức khỏe và dễ dàng dễ vệ sinh.Nhiều màu sắc, mẫu mã lựa chọn.Sản phẩm đều được may đo theo Form riêng từng hãng xe, loại xe, Model và đời xe. Quý khách hàng có thể tự lắp đặt tại nhà mà không cần sự hỗ trợ của nhân viên kỹ thuật.','04/12/2021',3)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(24,N'Thảm lót',N'Lót cốp Mercedes C180, C200, C250, C300 2015-2019 chất liệu TPO cao cấp',590000,N'Lót cốp Mercedes C180, C200, C250, C300 2015-2019 chất liệu TPO cao cấp.jpg',N'Lót cốp Mercedes C200, C250, C300 2015-2019 chất liệu TPO cao cấp. Vật liệu TPO (Thermoplastic Elastomers – nhựa nhiệt dẻo đàn hồi). Đó là một loại vật liệu cao cấp chống thấm nước, không mùi, có độ bền – độ đàn hồi cao. Được áp dụng vào nhiều lĩnh vực y tế, thể thao, nhựa trên taplo ô tô…Sản phẩm được đúc nguyên khối. Được định hình 3D theo đúng biên dạng với cốp xe và model xe riêng biệt. Thành cốp có độ cao 5 -10 cm (tùy từng dòng xe). Điều này giúp cho việc giữ nước cũng như các đồ vật ẩm thấm nước) và các vật bẩn khác không rơi ra cốp xe. Việc này sẽ bảo vệ nỉ cốp xe một cách an toàn và tốt nhất, mang lại cho không gian cốp xe của bạn luôn được sạch sẽ và sang trọng.','04/12/2021',3)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(25,N'Thảm lót',N'Thảm da Taplo Mercedes C180, C200, C250, C300 vân Carbon cao cấp',390000,N'Thảm da Taplo Mercedes C180, C200, C250, C300 vân Carbon cao cấp.jpg',N'Thảm da Taplo Mercedes C200, C250, C300 vân Carbon cao cấp là 1 trong những phụ kiện không thể thiếu cho xe. Thảm được thiết kế chuẩn form, cấu tạo bằng da Microfiber nhẹ, mềm, bền, dai. Mặt sau thiết kế các “hoa silicone” giúp tự bám dính vào bề mặt taplo mà không cần băng keo.Có tác dụng cách nhiệt, chống nóng, chống phản ánh nắng tốt. Đặc biệt bề mặt da mịn giúp dễ lau chùi cộng với khả năng không thấm nước khiến bạn có thể để chai nước hay bất cứ gì có nước mà không sợ bị thấm nước gây mùi hôi.','04/12/2021',3)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(26,N'Thảm lót',N'Bộ lót ghế, tựa lưng Massage hạt gỗ cho Ô tô, Xe hơi',550000,N'Bộ lót ghế, tựa lưng Massage hạt gỗ cho Ô tô, Xe hơi.jpg',N'Bộ lót ghế, tựa lưng cho Ô tô, Xe hơi Massage hạt gỗ. Được làm từ gỗ tự nhiên cao cấp, không bị bể hạt cho dù bạn ngồi với tư thế nào. Với thiết kế tinh xảo và được đan chắc chắn bằng tay nên không sợ bị bung hay rớt hạt, tạo tính thẩm mỹ cho chiếc ô tô của bạn. Kích thước lót ghế và tựa lưng phù hợp với toàn bộ form ghế các dòng xe ô tô nên bạn không phải đắn đo về việc chọn lựa. Dùng được cho cả ghế trưởng phòng, ghế quản lý, ghế giám đốc - tạo cảm giác thoái mái để làm việc. Bộ sản phẩm gồm 1 lót ghế, 1 tựa lưng.Ưu điểm của bộ lót ghế, tựa lưng Massage hạt gỗ: - Tạo dáng ngồi thẳng ngay ngắn và thoải mái. - Giúp giảm căng thẳng, nhức mỏi phần lưng cổ. - Hat gỗ trên lót ghế, tựa lưng sẽ giúp massage mông và lưng của bạn, 
tạo cảm giác thoải mái khi lái xe, làm việc trong thời gian dài. - Thiết kế gọn nhẹ, dễ dàng tháo lắp vệ sinh.','04/12/2021',3)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(27,N'Thảm lót',N'Bộ lót cốp và lưng ghế xe Mercedes C180, C200, C250, C300 thương hiệu Eudora CloudFoam',1590000,N'Bộ lót cốp và lưng ghế xe Mercedes C180, C200, C250, C300 thương hiệu Eudora CloudFoam.jpg',N'Bộ lót cốp và lưng hàng ghế xe Mercedes C180, C200, C250, C300 thương hiệu Eudora CloudFoamĐây là một sản phẩm sự dụng công nghệ bọt mây mang đến sự nhẹ nhàng êm ái cho người sử dụng. Một đặc tính nổi bật của CloudFoam đó chính là đặc tính mau khô, kiểm soát mùi, khả năng chống mài mòn cao nhờ đó mà tuổi thọ của thảm được nâng cao.Đặc điểm nổi bật của thảm Eudora CloudFoam còn đến từ thiết kế tổ ong trên khắp bề mặt giúp giữ nước, bụi bẩn ở những khoang rỗng, giúp bụi bẩn không bị phát tán trong khoang xe, nước không ngấm xuống gầm. Cùng với đó, trên bề mặt thảm có những gai nano giúp massage bàn chân và thư thái trong quá trình di chuyển. 
Mặt sau có những mảnh gai nhám giúp thảm cố định vị trí.Bên cạnh đó, thảm Eudora CloudFoam fit theo xe, đa dạng màu sắc và có thể phù hợp với mọi không gian nội thất của xe. Sản phẩm có nhiều màu sắc đa dạng, để có lựa chọn tốt nhất phù hợp với nhu cầu sử dụng. Thảm được thiết kế dành riêng cho từng model và đời xe tương ứng nên hoàn toàn chuẩn form so với cốp xe. Sản phẩm có màu: Đen, Kem, Ghi, Đỏ, Nâu. ','04/12/2021',3)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(28,N'Logo',N'Logo chữ VVT-i 3D nổi dán trang trí Ô tô, Xe hơi',90000,N'Logo chữ VVT-i 3D nổi dán trang trí Ô tô, Xe hơi.jpg',N'Logo chữ VVT-i 3D nổi dán trang trí Ô tô, Xe hơi. Được thiết kế tỉ mỉ và tinh tế với từng đường nét độc đáo, màu sắc sang trọng, nổi bật, tạo điểm nhấn giúp xế yêu của bạn trở nên nổi bật hơn, thu hút hơn và thể hiện được phong cách cũng như đẳng cấp chủ xe một cách rõ nét nhất.Được sản xuất từ chất liệu nhựa ABS sơn phủ tĩnh điện, có độ bền cao, không bị phai màu, rạn nứt hay hoen gỉ trong thời gian dài sử dụng.Sản phẩm có sẵn keo dính 3M ở mặt sau, chỉ cần bóc miếng dán 2 mặt và vệ sinh sạch sẽ bề mặt Capo rồi dán lên trên. Sau khi dán không rửa xe trong vòng 24h để sản phẩm đạt được độ bám dính tốt nhất.','04/12/2021',4)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(29,N'Logo',N'Logo chữ TRD 3D nổi dán trang trí Ô tô, Xe hơi',120000,N'Logo chữ TRD 3D nổi dán trang trí Ô tô, Xe hơi.jpg',N'Logo chữ TRD 3D nổi dán trang trí Ô tô, Xe hơi. Được thiết kế tỉ mỉ và tinh tế với từng đường nét độc đáo, màu sắc sang trọng, nổi bật, tạo điểm nhấn giúp xế yêu của bạn trở nên nổi bật hơn, thu hút hơn và thể hiện được phong cách cũng như đẳng cấp chủ xe một cách rõ nét nhất.Được sản xuất từ chất liệu nhựa ABS sơn phủ tĩnh điện, có độ bền cao, không bị phai màu, rạn nứt hay hoen gỉ trong thời gian dài sử dụng.Sản phẩm có sẵn keo dính 3M ở mặt sau, chỉ cần bóc miếng dán 2 mặt và vệ sinh sạch sẽ bề mặt Capo rồi dán lên trên. Sau khi dán không rửa xe trong vòng 24h để sản phẩm đạt được độ bám dính tốt nhất. Sản phẩm có 3 màu: Đen, Đỏ, Bạc.','04/12/2021',4)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(30,N'Logo',N'Logo chữ TITANIUM 3D nổi dán trang trí Ô tô, Xe hơi',190000,N'Logo chữ TITANIUM 3D nổi dán trang trí Ô tô, Xe hơi.jpg',N'Logo chữ TITANIUM 3D nổi dán trang trí Ô tô, Xe hơi. Được thiết kế tỉ mỉ và tinh tế với từng đường nét độc đáo, màu sắc sang trọng, nổi bật, tạo điểm nhấn giúp xế yêu của bạn trở nên nổi bật hơn, thu hút hơn và thể hiện được phong cách cũng như đẳng cấp chủ xe một cách rõ nét nhất.Được sản xuất từ chất liệu nhựa ABS sơn phủ tĩnh điện, có độ bền cao, không bị phai màu, rạn nứt hay hoen gỉ trong thời gian dài sử dụng.Sản phẩm có sẵn keo dính 3M ở mặt sau, chỉ cần bóc miếng dán 2 mặt và vệ sinh sạch sẽ bề mặt Capo rồi dán lên trên. Sau khi dán không rửa xe trong vòng 24h để sản phẩm đạt được độ bám dính tốt nhất. Sản phẩm có 2 màu: Bạc, Đen ','04/12/2021',4)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(31,N'Logo',N'Logo chữ DISCOVERY 3D nổi dán nắp Capo Ô tô, Xe hơi',190000,N'Logo chữ DISCOVERY 3D nổi dán nắp Capo Ô tô, Xe hơi.jpg',N'Logo chữ DISCOVERY 3D nổi dán nắp Capo Ô tô, Xe hơi. Được thiết kế tỉ mỉ và tinh tế với từng đường nét độc đáo, màu sắc sang trọng, nổi bật, tạo điểm nhấn giúp xế yêu của bạn trở nên nổi bật hơn, thu hút hơn và thể hiện được phong cách cũng như đẳng cấp chủ xe một cách rõ nét nhất.Được sản xuất từ chất liệu nhựa ABS sơn phủ tĩnh điện, có độ bền cao, không bị phai màu, rạn nứt hay hoen gỉ trong thời gian dài sử dụng.Sản phẩm có sẵn keo dính 3M ở mặt sau, chỉ cần bóc miếng dán 2 mặt và vệ sinh sạch sẽ bề mặt Capo rồi dán lên trên. Sau khi dán không rửa xe trong vòng 24h để sản phẩm đạt được độ bám dính tốt nhất. Sản phẩm có 2 màu: Bạc, Đen','04/12/2021',4)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(32,N'Logo',N'Bộ Logo 3D trang trí hông xe VIP biểu tượng bông lúa',90000,N'Bộ Logo 3D trang trí hông xe VIP biểu tượng bông lúa.jpg',N'Bộ Logo 3D trang trí hông xe VIP biểu tượng bông lúa. Chất liệu hợp kim không gỉ, mạ Crom sáng bóng, chống mài mòn tốt, bền chắc, không bong tróc, phai màu theo thời gian dài sử dụng. Chữ VIP màu vàng nổi bật trên nền đen, tạo điểm nhấn nổi bật, độc đáo. Mang đến sự sang trọng, lịch lãm, tăng thêm giá trị cho xế yêu của bạn.Bộ sản phẩm gồm 2 Logo, kích thước là 5×5 cm, sử dụng băng keo 2 mặt cắt sẵn theo hình Logo siêu dính, dễ dàng thao tác, bóc dán đơn giản không làm ảnh hưởng tới lớp sơn xe.','04/12/2021',4)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(33,N'Logo',N'Bộ Logo 3D trang trí hông xe Mercedes biểu tượng bông lúa',90000,N'Bộ Logo 3D trang trí hông xe Mercedes biểu tượng bông lúa.jpg',N'Bộ Logo 3D trang trí hông xe Mercedes biểu tượng bông lúa. Chất liệu hợp kim không gỉ, mạ Crom sáng bóng, chống mài mòn tốt, bền chắc, không bong tróc, phai màu theo thời gian dài sử dụng. Logo Mercedes màu vàng nổi bật trên nền đen, tạo điểm nhấn nổi bật, độc đáo. Mang đến sự sang trọng, lịch lãm, tăng thêm giá trị cho xế yêu của bạn.Bộ sản phẩm gồm 2 Logo, kích thước là 5x5 cm, sử dụng băng keo 2 mặt cắt sẵn theo hình Logo siêu dính, dễ dàng thao tác, bóc dán đơn giản không làm ảnh hưởng tới lớp sơn xe.','04/12/2021',4)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(34,N'Logo',N'Bộ 2 mang cá giả hốc gió trang trí sườn xe Ô tô, xe hơi',190000,N'Bộ 2 mang cá giả hốc gió trang trí sườn xe Ô tô, xe hơi.jpg',N'Bộ 2 mang cá giả hốc gió trang trí sườn xe Ô tô, xe hơi. Được sản xuất trên dây chuyền tiên tiến hiện đại với chất liệu nhựa ABS được mạ Crom sáng bóng. Chống chịu thời tiết tốt, không bong tróc, cong vênh khi đỗ xe ngoài trời nắng. Được thiết kế ấn tượng với kiểu dáng thể thao, màu sắc sang trọng, phù hợp với mọi loại xe. Mang cá dán ở hông xe, sườn xe. Tạo điểm nhấn, giúp cho chiếc xe trông cá tính, thể thao và nổi bật hơn khi lưu thông trên đường.','04/12/2021',4)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(35,N'Logo',N'Tem chữ 4WD Fulltime 3D nổi dán trang trí Ô tô, Xe hơi',190000,N'Tem chữ 4WD Fulltime 3D nổi dán trang trí Ô tô, Xe hơi.jpg',N'Tem chữ 4WD Fulltime 3D nổi dán trang trí Ô tô, Xe hơi.Được thiết kế tỉ mỉ và tinh tế với từng đường nét độc đáo, màu sắc sang trọng, nổi bật, tạo điểm nhấn giúp xế yêu của bạn trở nên nổi bật hơn, thu hút hơn và thể hiện được phong cách cũng như đẳng cấp chủ xe một cách rõ nét nhất.Được sản xuất từ chất liệu hợp kim không gỉ, có độ bền cao, không bị phai màu, rạn nứt hay hoen gỉ trong thời gian dài sử dụng.','04/12/2021',4)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(36,N'Logo',N'Logo chữ TRD-Sport 3D nổi dán trang trí Ô tô, Xe hơi',120000,N'Logo chữ TRD-Sport 3D nổi dán trang trí Ô tô, Xe hơi.jpg',N'Logo chữ TRD-Sport 3D nổi dán trang trí Ô tô, Xe hơi. Được thiết kế tỉ mỉ và tinh tế với từng đường nét độc đáo, màu sắc sang trọng, nổi bật, tạo điểm nhấn giúp xế yêu của bạn trở nên nổi bật hơn, thu hút hơn và thể hiện được phong cách cũng như đẳng cấp chủ xe một cách rõ nét nhất.Được sản xuất từ chất liệu nhựa hợp kim không gỉ, có độ bền cao, không bị phai màu, rạn nứt hay hoen gỉ trong thời gian dài sử dụng.','04/12/2021',4)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(37,N'Logo',N'Chữ Sport kim loại 3D nổi dán trang trí Ô tô, Xe hơi',120000,N'Chữ Sport kim loại 3D nổi dán trang trí Ô tô, Xe hơi.jpg',N'Chữ Sport kim loại 3D nổi dán trang trí Ô tô, Xe hơi. Chất liệu hợp kim không gỉ, chống chịu thời tiết tốt, không bong tróc, cong vênh khi đỗ xe ngoài trời nắng. Được thiết kế ấn tượng với kiểu chữ nổi 3D cùng tông màu đen và đỏ đối lập, kiểu dáng thể thao, màu sắc sang trọng, phù hợp với mọi loại xe. Có thể dán ở nhiều vị trí như đầu xe, đuôi xe, hông xe hoặc các vị trí khác theo sở thích người dùng. Tạo điểm nhấn, giúp cho chiếc xe trông cá tính và nổi bật hơn khi lưu thông trên đường. ','04/12/2021',4)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(38,N'Camera',N'Camera Hành Trình VAVA Dual Dash Cam VD002 – 2 mắt trước sau (Tặng kèm thẻ nhớ 16Gb)',4490000,N'Camera Hành Trình VAVA Dual Dash Cam VD002 – 2 mắt trước sau (Tặng kèm thẻ nhớ 16Gb).jpg',N'Camera hành trình ô tô hay còn được gọi là thiết bị giám sát hành trình, hộp đen hay cam giám sát hành trình là hệ thống camera giúp lưu trữ các thông tin, hình ảnh ghi được trong suốt quá trình xe lăn bánh và hỗ trợ tài xế lái xe an toàn trên mọi cung đường, mọi địa hình.Trên thị trường xuất hiện rất nhiều thương hiệu camera hành trình với nguồn gốc xuất xứ khác nhau. Nổi bật trong số đó phải kể đến ông lớn VAVA với hàng loạt các siêu phẩm camera hành trình được ưa chuộng nhất tại MỸ. ','04/12/2021',1)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(39,N'Nước Hoa',N'Nước hoa cho Xe hơi, Ô tô cao cấp chính hãng Bugale Zero Gold',410000,N'Nước hoa cho Xe hơi, Ô tô cao cấp chính hãng Bugale Zero Gold.jpg',N'Nước hoa cao cấp chính hãng Bugale Zero Gold - Thương hiệu nước hoa cho xe hơi, Ô tô nổi tiếng đễn từ Nhật Bản, được yêu thích tại nhiều quốc gia trên thế giới. Mùi hương kết hợp giữa Hương gỗ ấm, Vị muối biển, Hương cam vùng Sicili, Quýt, Hoa Iris, Xạ hương mang đến hương thơm dễ chịu, sảng khoái dài lâu. Sản phẩm an toàn cho sức khỏe với 100% nguyên liệu tự nhiên, không gây dị ứng, độc hại cho người sử dụng.','04/12/2021',5)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(40,N'Nước Hoa',N'Nước hoa cho Xe hơi, Ô tô cao cấp chính hãng Fresh Bottle Amber',410000,N'Nước hoa cho Xe hơi, Ô tô cao cấp chính hãng Fresh Bottle Amber.jpg',N'Nước hoa cho Xe hơi, Ô tô Chính hãng Fresh Bottle Amber là một sản phẩm đến từ tập đoàn SOFT99 của Nhật Bản, một trong những thương hiệu được yêu thích tại nhiều quốc gia trên thế giới. Sản phẩm an toàn cho sức khỏe với 100% nguyên liệu tự nhiên, không gây dị ứng, độc hại cho người sử dụng. Sản phẩm có chứa hương thơm tinh khiết với công nghệ tiên tiến có khả năng duy trì độ bền mùi trong 60 ngày.','04/12/2021',5)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(41,N'Nước Hoa',N'Nước hoa cho Xe hơi, Ô tô chính hãng Scentech Buckingham Plus hương Cà phê',410000,N'Nước hoa cho Xe hơi, Ô tô chính hãng Scentech Buckingham Plus hương Cà phê.jpg',N'Nước hoa Ô tô, Xe hơi Buckingham Plus hương Cà phê là một sản phẩm đến từ tập đoàn Scentech (Hàn Quốc). Là thương hiệu chăm sóc xe hơi được yêu thích tại nhiều quốc gia trên thế giới. Sản phẩm an toàn cho sức khỏe với 100% nguyên liệu tự nhiên, không gây dị ứng, độc hại cho người sử dụng. Bộ sản phẩm gồm 1 lọ 90ml và 1 hộp bổ sung 80ml.','04/12/2021',5)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(42,N'Nước Hoa',N'Nước hoa đồng hồ pha lê trang trí Taplo Ô tô, Xe hơi',190000,N'Nước hoa đồng hồ pha lê trang trí Taplo Ô tô, Xe hơi.jpg',N'Mùi hương thơm cao cấp, giữ lâu và được thiết kế sang trọng, tinh tế an toàn với sức khỏe của bạn. Nước hoa đồng hồ khử mùi ô tô là sự lựa chọn tuyệt vời cho những ai yêu thích phong cách tinh tế và đẳng cấp ngay trong chính chiếc xe hơi của mình. Nước hoa đồng hồ pha lê giúp bạn khử mùi hôi trên xe hơi, giúp bạn tập trung tinh thần và giảm stress khi lái xe ô tô nhiều giờ liên tục.
   Sản phẩm nước hoa đồng hồ trang trí mặt taplo xe ô tô là sản phẩm nước hoa khử mùi trên xe hơi và còn là phụ kiện trang trí cho nội thất ô tô của bạn, giúp các tài xế vừa quan sát được thời gian vừa có thể khử mùi hôi trên xe hơi. Sản phẩm giúp trang trí cho không gian nội thất bên trong xe thêm sang trọng và nổi bật hơn.','04/12/2021',5)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(43,N'Nước Hoa', N'Máy khử mùi, lọc không khí trong Ô tô, Xe hơi Hyundai HY-12',690000,N'Máy khử mùi, lọc không khí trong Ô tô, Xe hơi Hyundai HY-12.jpg',N'Máy khử mùi, lọc không khí trong Ô tô, Xe hơi Hyundai HY-12, thanh lọc không khí, bảo vệ sức khỏa của bạn. - Máy lọc không khí Hyundai tích hợp 4 lớp lọc HEPA/HESA loại bỏ các chất ô nhiễm trong xe hơi như mùi khói thuốc, mùi hôi, ẩm mốc và bụi mịn 2.5 micromet. 
- Làm mới không khí kết hợp với hương thơm tinh dầu (có tinh dầu thơm kèm theo). 
- Hiệu quả thanh lọc nhanh vật chất hạt, các hạt bụi siêu nhỏ CADR và các chất ô nhiễm TVOC. 
- Tốc độ lọc không khí: 10 m³ / h, làm hiệu quả diện tích từ 3-8（㎡）.  
Thông số sản phẩm: - Chất liệu: Nhựa ABS và hợp kim lưới thép .
- Kích thước: 155×42MM 
- Trọng lượng: 0.37（kg）
- Công suất 2.5 (W) 
- Độ ồn: 40-50dB(A) 
- Công suất lọc:  10（m3/ giờ） 
- Khử mùi hôi: 97.4% 
- Lọc bụi mịn CADR: 99.8% 
- Lọc các loại khí gây ô nhiễm TVOC: 97.5% 
- Làm mới không khí kết hợp với hương thơm tinh dầu 
- Thiết kể đẹp, nhỏ gọn sang trọng, làm bằng chất liệu cao cấp 
- Sử dụng cổng sạc 12V chân cắm tẩu xe 
- Dễ dàng vệ sinh và thay thế màng lọc * Bảo hành: Sản phẩm được bảo hành 12 tháng (lỗi đổi mới).','04/12/2021',5)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(44,N'Nước Hoa', N'Bộ tinh dầu khử mùi trên ô tô, xe hơi chính hãng Baseus',300000,N'Bộ tinh dầu khử mùi trên ô tô, xe hơi chính hãng Baseus.jpg',N'Bộ tinh dầu khử mùi trên ô tô, xe hơi chính hãng Baseus là loại máy chuyên dùng để lọc không khí và khử mùi dùng cho ô tô. Máy nhỏ gọn, thiết kế sang trọng phù hợp với nhiều loại nội thất trên xe do linh hoạt về hình dáng kích thước cũng như màu sắc. Với tính năng khử mùi độc đáo, máy lọc không khí, khử mùi Baseus trên ô tô thông qua công nghệ ozon, 
than hoạt tính nano hay ion âm loại bỏ mọi mùi hôi phát sinh từ: hệ thống điều hòa, nội thất xe, mùi đồ ăn.... Qua đó mang lại bầu không khí trong lành, xóa tan đi nỗi lo say xe cho những người ngồi trên ô tô. Ngoài ra máy lọc không khí trên ô tô còn có thể lọc sạch các hạt bụi bẩn, hay tiêu diệt vi khuẩn trên xe thông qua hệ thống màng lọc tích hợp trong máy. Với những tính năng trên, máy lọc không khí trên ô tô đặc biệt hữu ích khi chúng ta thường xuyên lái xe qua những cung đường nhiều bụi hoặc những bác tài có thói quen hút thuốc trong xe.','04/12/2021',5)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(45,N'Nước Hoa',N'Máy lọc không khí, khử mùi xe hơi, ô tô Sharp IG-KC15',2290000,N'Máy lọc không khí, khử mùi xe hơi, ô tô Sharp IG-KC15.jpg',N'Máy lọc không khí, khử mùi xe hơi, ô tô Sharp IG-KC15 nội địa Nhật Bản. Sử dụng công nghệ Plasma Cluster lọc không khí bằng các Ion âm giúp khử mùi nhanh chóng và giữ cho không khí trong xe luôn thoải mái. Làm việc hiệu quả cho xe từ 9 chỗ trở xuống. 
⛑ Điểm nổi bật: 
- Tạo Ion Plasma khử mùi 
- diệt khuẩn Khử trùng mùi ẩm mốc, mùi thuốc lá, ghế da, mùi điều hòa, … 
- Ức chế ảnh hưởng của virus trong không khí và hoạt động của vi khuẩn 
- Tạo độ bóng cho da - Được trang bị bộ lọc để bắt phấn hoa và bụi mịn 
- Sử dụng bộ chuyển đổi USB hoặc cắm qua đầu tẩu 
- Tùy chọn tốc độ làm việc Thông số từ nhà sản xuất: 
- Model: IG-KC15 
- Nguồn điện cấp: Bộ chuyển đổi xe hơi 
- Điện năng tiêu thụ: 1.9 W 
- Kích thước: Đường kính trên 74 x đường kính dưới 65 x chiều cao 162 mm 
- Trọng lượng: 300g 
- Dây nguồn : 1,5m 
- Phụ kiện: Tẩu sạc trên xe hơi 2 cổng USB 
🔧 Sản phẩm được bảo hành 12 tháng (lỗi đổi mới)','04/12/2021',5)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(46,N'Cảm Biến Áp Suất',N'Cảm biến áp suất lốp TPMS Steelmate E3W van ngoài',1380000,N'Cảm biến áp suất lốp TPMS Steelmate E3W van ngoài.jpg',N'Cảm biến áp suất lốp TPMS Steelmate E3W van ngoài. Màn hình LCD đa sắc, màn hình màu , sử dụng pin năng lượng mặt trời. Hiển thị áp suất và nhiệt độ thực tế của lốp của 4 lốp trên màn hình. Cảnh báo tức thời cho người điều khiển xe trong trường hợp áp suất lốp quá thấp hoặc quá cao và nhiệt độ của lốp tăng cao. Cảnh báo rò rỉ chậm (rò rỉ chậm là một trong những mối đe dọa tiềm ẩn dẫn đến một sự cố thảm khốc như xả hơi). 
Việc truyền các tín hiệu được thông qua công nghệ không dây xoắn ốc mới nhất. Có thể cài đặt lại các mức cảnh báo hoặc lựa chọn các mức cảnh báo mặc định. Có thể lựa chọn thông số hiển thị là PSI, kPa hoặc Bars và ° C hay ° F. Pin cảm biến có tuổi thọ lớn. Hiển thị đồng thời thông tin về áp suất lốp, nhiệt độ. Hệ thống sẽ cảnh báo người lái khi áp suất lốp xe giảm xuống dưới 23psi và/hoặc nhiệt độ lốp xe đạt đến 80°C.Sản phẩm bảo hành 1 đổi 1 trong vòng 12 tháng nếu có lỗi từ nhà sản xuất.','04/12/2021',6)

insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(48,N'Cảm Biến Áp Suất',N'Bơm mini cầm tay đa năng chính hãng Xiaomi MJCQB01QJ',1190000,N'Bơm mini cầm tay đa năng chính hãng Xiaomi MJCQB01QJ.jpg',N'Bơm mini cầm tay đa năng chính hãng Xiaomi MJCQB01QJ,Thiết kế nhỏ gọn, tính di động cao. Chính vì là một thiết bị bơm cầm tay, sản phẩm khá được chú trọng trong việc tối giản các chi tiết nhằm giúp người dùng có thể linh hoạt mang theo và lưu trữ. Cụ thể kích thước bơm vô cùng nhỏ gọn, các chi tiết được xử lý mềm mại giúp thao tác cầm nắm được thoải mái hơn.Vật liệu chất lượng cao, độ bền dài lâu, chống trầy xước và chịu nhiệt tốt. 
Mặt trước là màn hình kĩ thuật số giúp hiện thị áp suất lốp, đèn LED chiếu sáng linh hoạt hơn khi sử dụng vào ban đêm.Áp suất bơm mạnh mẽ, đa mục đích. Đặc biệt bơm còn được trang bị công nghệ với độ chính xác cao cho áp suất bơm tối đa là 150psi đáp ứng đầy đủ nhu cầu bơm các thiết bị cho người dùng. Hơn nữa bơm còn đa năng ở việc bạn có thể dễ dàng bơm được lốp xe đạp, xe máy, thậm chí là cả xe ô tô, các loại bóng và nhiều dụng cụ cần bơm khác.Ngoài ra một số tính năng thông minh còn được tích hợp trên chiếc bơm này như khả năng xác định áp xuất lốp xe, 
thiết lập điều chỉnh áp suất lốp nhằm đảm bảo an toàn trên suốt chuyến hành trình.Pin dung lượng cao, tối ưu hóa hiệu suất bơm. Bơm được tích hợp pin lithium 2000mAh và được sạc đầy qua cổng micro USB tiện dụng với thời gian sạc đầy chưa tới 3 giờ.','04/12/2021',6)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(49,N'Cảm Biến Áp Suất',N'Cảm biến áp suất lốp TPMS Steelmate TP-MT11 van trong',2590000,N'Cảm biến áp suất lốp TPMS Steelmate TP-MT11 van trong.jpg',N'Cảm biến áp suất lốp TPMS Steelmate TP-MT11 van trong, là mã sản phẩm áp suất lốp mới nhất của hãng được thiết kế và phân phối dành riêng cho thị trường Việt Nam. Sản phẩm được bảo hành 36 thángTính năng của cảm biến áp suất lốp Steel-Mate TP-MT11: 
1.Kiểm soát toàn thời gian Luôn thông báo tình trạng áp suất và nhiệt độ của 4 bánh xe, năng lượng pin của Mornitor. 
2.Báo động nhiều cấp và chi tiết từng sự cố Phân loại báo động thành nhiều cấp độ và định dạng sự cố chi tiết như:nhiệt độ cao,áp suất cao,xì hơi nhanh,áp suất thấp cấp độ 1(khi áp suất thực của lốp xe giảm 12.5% so với áp suất tiêu chuẩn),áp suất thấp cấp độ 2 (25%),áp suất thấp cấp độ 3 (50%),v.v...và có biểu tượng riêng biệt trên màn hình cho từng loại sự cố. Người lái có thể căn cứ vào từng loại báo động để xử lý phù hợp. 
3.Phản ứng cực nhanh Báo động về sự cố lốp xe trong vòng 0.05 giây từ khi hiện tượng xảy ra. 
4.Đảo lốp xe không cần tháo cảm biến Khi đảo bánh xe,chỉ cần reset  và cài đặt lại trên Monitor (màn hiển thị)  mà không phải hoán đổi vị trí các cảm biến cho các vị trí lốp. 
5.Cài đặt linh hoạt áp suất tiêu chuẩn Có thể được cài đặt áp suất tiêu chuẩn theo ý muốn tùy thuôc yêu cầu tiêu chuẩn từng loại xe,từng vị trí lốp xe,ngưỡng báo động hợp lý. 
6.Báo động xì hơi nhanh (Quick Leaking Alarm) Phát tín hiệu báo động ngay khi áp suất lốp xe giảm 0.2 Bar trong 20s. 
7.Báo động sự cố cảm biến Khi cảm biến có trục trặc,hệ thống không nhận được tín hiệu từ cảm biến hoặc monitor nhận tín hiệu chậm trễ, sẽ báo động kịp thời cho người lái để kiểm tra lại hệ thống. 
8. Công nghệ PIN Maxel Nhật Bản và chip Infineon của Đức Khác với dòng T606 và T602 mã TP-MT11 là mã mới chỉ phân phối duy nhất cho thị trường Việt Nam được sử dụng công nghệ mới nhất. Pin Maxel của Nhật Bản với tuổi thọ trên 5 năm và chip Infineon của Đức cho tốc độ cảnh báo nhanh hơn.','04/12/2021',6)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(50,N'Cảm Biến Áp Suất',N'Máy bơm lốp Xe hơi – Ô tô Chính hãng Xiaomi 70MAI Midrive TP01',1390000,N'Máy bơm lốp Xe hơi – Ô tô Chính hãng Xiaomi 70MAI Midrive TP01.jpg',N'Có thể cài đặt trước áp suất cần bơm. – Có đồng hồ điện tử đo được áp suất lốp xe ngay tức thì, chính xác. – Bơm sẽ tự động ngắt khi bơm đạt ngưỡng quy định thiết lập trước – Công suất bơm cao hơn các loại bơm lốp thông thường trên thị trường – Bơm tích hợp đèn LED giúp cho việc sử dụng dễ dàng, thuận tiệnBảo hành 1 đổi 1 trong vòng 12 tháng nếu có lỗi từ nhà sản xuất','04/12/2021',6)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(51,N'Cảm Biến Áp Suất',N'Máy bơm lốp Ô Tô, Xe hơi Xiaomi 70mai Midrive TP03',850000,N'Máy bơm lốp Ô Tô, Xe hơi Xiaomi 70mai Midrive TP03.jpg',N'Máy bơm lốp Ô Tô, Xe hơi Xiaomi 70mai Midrive TP03 sở hữu kích thước vô cùng nhỏ gọn chỉ 164 x 148 x 54mm, do đó người dùng có thể dễ dàng lưu trữ thiết bị ở bên trong hộc xe hơi của mình. Bên cạnh đó, máy bơm còn sử dụng thiết kế tích hợp khá tiện lợi, mỗi bộ phận đều có không gian lưu trữ riêng, được sắp xếp một cách gọn gàng nhất.Máy bơm được trang bị bảng điều khiển với màn hình kỹ thuật số trên cùng, hiển thị rõ ràng các thông số cụ thể. 
Đặc biệt, 4 nút bấm điều khiển được thiết kế tối giản giúp người dùng có thể dễ dàng thao tác sử dụng máy bơm một cách đơn giản nhất.','04/12/2021',6)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(52,N'Cảm Biến Áp Suất',N'Cảm biến áp suất lốp Steelmate E3 van trong',1690000,N'Cảm biến áp suất lốp Steelmate E3 van trong.jpg',N'Cảm biến áp suất lốp Steelmate E3 van trong.Bộ sản phẩm nguyên hộp: 4 van cảm biến, bộ hiển thị trung tâm, sách HDSD, Tem dán chân van. Để giảm thiểu các sự kiện bất lợi cho khách hàng, tất cả các sản phẩm đều được bộ phận kiểm thử của công ty chúng tôi kiểm tra trước khi đóng gói gửi đi. Thegioiphukien.vn khuyến nghị khách hàng đặt mọi câu hỏi nếu có với shop về sản phẩm để đảm bảo rằng quý khách được thông tin đầy đủ nhất về sản phẩm và các chính sách liên quan đến sản phẩm. 
Sản phẩm chính hãng Steelmate, Bảo hành 1 đổi 1 trong vòng 12 tháng nếu có lỗi từ nhà sản xuất.','04/12/2021',6)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(53,N'Cảm Biến Áp Suất',N'Bơm lốp ô tô, xe hơi mini Steelmate P05 tự ngắt',590000,N'Bơm lốp ô tô, xe hơi mini Steelmate P05 tự ngắt.jpg',N'Bơm lốp mini ô tô, xe hơi tự ngắt Steelmate P05  là phiên bản cao hơn của bơm ôtô, xe hơi mini Steelmate P03 . 
- Có thể cài đặt trước áp suất cần bơm. - Có đồng hồ điện tử đo được áp suất lốp xe ngay tức thì, chính xác. 
- Bơm sẽ tự động ngắt khi bơm đạt ngưỡng quy định thiết lập trước 
- Công suất bơm cao hơn bơm Steelmate P03 
- Bơm tích hợp đèn LED giúp cho việc sử dụng dễ dàng, thuận tiện. 
- Sản phẩm được bảo hành 12 tháng (lỗi đổi mới) 
* THÔNG SỐ KỸ THUẬT: 
☑ Điện áp vào: 12V 
☑ Công suất bơm: 102W 
☑ Áp suất lốp bơm tối đa 350kPa 
☑ Trọng lượng : 800g 
☑ Kích thước: 20x20x10cm 
☑ Vật liệu : Nhựa cao cấp 
☑ Dây nguồn dài 3m','04/12/2021',6)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(54,N'Cảm Biến Áp Suất',N'Cảm biến áp suất lốp Fobo Tire – Van Ngoài',2990000,N'Cảm biến áp suất lốp Fobo Tire – Van Ngoài.png',N'FOBO TIRE CẢM BIẾN ÁP SUẤT LỐP THEO THỜI GIAN THỰC
-Fobo Tire Là Cảm Biến Áp Suất Lốp theo thời gian thực – Tire Pressure Monitoring System (TPMS) sử dụng Bluetooth 4.0 làm việc trực tiếp với các thiết bị Android và iOS. Hoạt động trên điện thoại thông minh, Đồng hồ thông minh. Cảm biến áp suất lốp FOBO TIRE theo dõi và cảnh báo, hiển thị cho bạn những thay đổi về áp suất và nhiệt độ của lốp xe lên điện thoại của bạn chi tiết và đầy đủ nhất, để bạn có thể điều chỉnh cho hợp lý, đảm bảo an toàn trong quá trình sử dụng chiếc xe của mình.
-FOBO TIRE – GIÁM SÁT 24/7 LỐP XE CỦA BẠN
Ngay cả khi bạn chưa khởi động xe, hãy yên tâm rằng FOBO TIRE (TPMS) làm việc suốt ngày đêm để đảm bảo lốp xe của bạn luôn đủ áp suất, hay cảnh báo ngay khi có thay đổi về áp suất của lốp. Thiết bị cảm biến áp suất lốp FOBO TIRE là thiết bị không dây và không cần nguồn điện bên ngoài, đi kèm với pin kéo dài đến 2 năm và có thể dễ dàng thay thế. Cảm biến sử dụng pin CR2032, HUD điều khiển dùng pin AA.
-CÀI ĐẶT CẢM BIẾN ÁP SUẤT LỐP FOBO TIRE CỰC ĐƠN GIẢN
-Cài đặt Cảm Biến Áp Suất Lốp FOBO TIRE trong vòng chưa đầy 5 phút mà không cần trợ giúp chuyên nghiệp nào. Bạn chỉ cần làm theo hướng dẫn đơn giản trên màn hình ứng dụng Fobo Tire. Bạn không cần phải thay đổi hoặc sửa đổi van áp lực hiện có của lốp xe. Lắp đặt cực kỳ đơn giản chỉ với vài thao tác và hướng dẫn đi kèm trên app Fobo Tire.
-FOBO CÔNG NGHỆ BLUETOOTH 4.0
Sử dụng đơn giản giúp bạn xem được các chỉ số áp suất, nhiệt độ và pin mới nhất chỉ bằng một cú click chuột vào biểu tượng FOBO được hiển thị trên màn hình chủ điện thoại di động mà không cần đi sâu vào các ứng dụng.FOBO TIRE có một kết nối liên tục, không ngắt quãng với chiếc điện thoại Smartphone của bạn để có thể thông báo tình trạng lốp xe cho bạn bất kỳ lúc nào. Bạn hoàn toàn yên tâm không lo mất trộm vì khi thiết bị cảm biến áp suất này bị tháo khỏi lốp xe thì ngay lập tức sẽ báo về điện thoại cho bạn.
-CẢNH BÁO AN TOÀN
Mỗi bộ FOBO TIRE đều được mã hoá bằng chính Email của bạn, khi kẻ gian đánh cắp sẽ không thể tái sử dụng Cảm Biến Áp Suất Lốp mà chỉ có chủ sở hữu mới làm được. Hơn nữa, Cảm biến Fobo có đi kèm 6 ốc chống trộm và hai cờ lê nhỏ để móc khóa giúp các cảm biến không bị đánh cắp bằng phần cứng. Cảm biến thay thế sẽ được bán riêng lẻ. Bạn cũng sẽ được thông báo bởi các ứng dụng FOBO TIRE trong trường hợp cảm biến lốp bị mất cắp.','04/12/2021',6)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(55,N'Cảm Biến Áp Suất',N'Cảm biến áp suất lốp Xiaomi 70mai MiDrive T02 – Van ngoài',1380000,N'Cảm biến áp suất lốp Xiaomi 70mai MiDrive T02 – Van ngoài.jpg',N'Cảm biến áp suất lốp Xiaomi 70mai MiDrive T02 - Van ngoài. 
Đây là phiên bản quốc tế 2020 nên hỗ trợ hoàn toàn tiếng Anh. 
-Cảm biến áp suất lốp Xiaomi 70mai van ngoài gồm 4 van hơi lắp trên 4 van của bánh xe. 
-Bộ cảm biến giúp cung cấp cho người dùng các thông số, chỉ số về áp suất và nhiệt độ của lốp xe. 
-Thông số hiện thị được cập nhật liên tục chính xác cho từng bánh xe. 
-Tích hợp kết nối không dây với điện thoại thông minh qua Bluetooth với ứng dụng 70mai (hỗ trợ cả iOS và Android), dễ dàng thiết lập các thông số cảnh báo cần thiết ngay trên ứng dụng.
- Ngôn ngữ trên app hỗ trợ tiếng Anh hoàn toàn. 
-Van cảm biến được kết nối không dây với màn hình qua tần số radio 433 MHz. 
-Bộ hiển thị xử lý trung tâm được tích pin sạc nhiều lần với dung lượng 500mAh. 
-Ngoài cổng cắm sạc pin chuẩn Micro-USB thì thiết bị còn được tích hợp thêm tấm pin sạc năng lượng mặt trời, giúp thiết bị có thể tự cung cấp nguồn điện để duy trì hoạt động mà không cần cắm nguồn. 
-Sản phẩm thiết kế van ngoài nên tháo lắp dễ dàng, quý khách có thể tự lắp đặt tại nhà. 
-Để đảm bảo an toàn, cảm biến áp suất lốp Xiaomi 70mai van ngoài được thiết kế có đai an toàn chống trộm và tiêu chuẩn chống nước IP67. 
Ngoài ra sản phẩm còn hỗ trợ khả năng thay pin của van cảm biến hết sức dễ do chuẩn pin CR1632 rất dễ mua.
Sản phẩm chính hãng Xiaomi, Bảo hành 1 đổi 1 trong vòng 12 tháng nếu có lỗi từ nhà sản xuất. ','04/12/2021',6)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(56,N'Vô Lăng',N'Bọc vô lăng Sparco chính hãng SPS100RD, SPS100BK',450000,N'Bọc vô lăng Sparco chính hãng SPS100RD, SPS100BK.jpg',N'Bọc vô lăng Sparco chính hãng SPS100RD lấy cảm hứng thể thao từ các dòng xe đua kết hợp với công nghệ sản xuất tiên tiến. 
Các mẫu bọc vô lăng SPARCO đều có kích thước đường kính 38cm lắp vừa cho hầu hết xe ô tô con tại thị trường Việt Nam. Ưu điểm của bọc vô lăng Sparco Corsa chính hãng: Thương hiệu phụ kiện hàng đầu từ Italia. Vật liệu PU cao cấp, căng bền. Ôm khít hoàn toàn vào vô lăng và cho cảm giác thật chắc tay, chống bám mồ hôi tay vượt trội. Bảo vệ vô lăng khỏi sự bong tróc, trầy xước. Được gia công hoàn hảo chống bay màu sau thời gian sử dụng. Rất dể dàng lắp đặt. Phù hợp cho hầu hết các loại xe.
Thiết kế mang phong cách thể thao cá tính kết hợp chất liệu cao cấp giúp mang lại cảm giác chắc tay khi cầm lái. Tạo điểm nhấn nổi bật cho khoang nội thất xế yêu. Tiêu chuẩn EU: An toàn rất cao. Sparco – Thương hiệu nổi tiếng đến từ Italia: Sparco S.P.A là một công ty phụ kiện ô tô nổi tiếng của đất nước xinh đẹp cổ kính – Italia, công ty có trụ sở chính tại Volpiano, Turin, Ý. Được thành lập bởi Enrico Glorioso và Antonio Parisi, một cựu vận động viên đua xe. 
Với kinh nghiệm và niềm đam mê đối với đường đua tốc độ, họ đã trở thành những người tiên phong trong việc sản xuất các sản phẩm chuyên dụng cho các cuộc thi ô tô. Công ty được thành lập vào năm 1977 và đã có các nhà phân phối tại Hoa Kỳ trong khoảng 20 năm.','04/12/2021',7)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(57,N'Vô Lăng',N'Bọc vô lăng Sparco chính hãng SPS1102BL',450000,N'Bọc vô lăng Sparco chính hãng SPS1102BL.jpg',N'Bọc vô lăng Sparco chính hãng SPC1102BL lấy cảm hứng thể thao từ các dòng xe đua kết hợp với công nghệ sản xuất tiên tiến. Các mẫu bọc vô lăng SPARCO đều có kích thước đường kính 38cm lắp vừa cho hầu hết xe ô tô con tại thị trường Việt Nam. Ưu điểm của bọc vô lăng Sparco Corsa chính hãng: Thương hiệu phụ kiện hàng đầu từ Italia. Vật liệu PU cao cấp, căng bền. 
Ôm khít hoàn toàn vào vô lăng và cho cảm giác thật chắc tay, chống bám mồ hôi tay vượt trội. Bảo vệ vô lăng khỏi sự bong tróc, trầy xước. Được gia công hoàn hảo chống bay màu sau thời gian sử dụng. Rất dể dàng lắp đặt. Phù hợp cho hầu hết các loại xe. Thiết kế mang phong cách thể thao cá tính kết hợp chất liệu cao cấp giúp mang lại cảm giác chắc tay khi cầm lái. Tạo điểm nhấn nổi bật cho khoang nội thất xế yêu. 
Tiêu chuẩn EU: An toàn rất cao. Sparco – Thương hiệu nổi tiếng đến từ Italia: Sparco S.P.A là một công ty phụ kiện ô tô nổi tiếng của đất nước xinh đẹp cổ kính – Italia, công ty có trụ sở chính tại Volpiano, Turin, Ý. Được thành lập bởi Enrico Glorioso và Antonio Parisi, một cựu vận động viên đua xe. Với kinh nghiệm và niềm đam mê đối với đường đua tốc độ, họ đã trở thành những người tiên phong trong việc sản xuất các sản phẩm chuyên dụng cho các cuộc thi ô tô. Công ty được thành lập vào năm 1977 và đã có các nhà phân phối tại Hoa Kỳ trong khoảng 20 năm. ','04/12/2021',7)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(58,N'Vô Lăng',N'Bọc vô lăng Sparco chính hãng SPC1109AZ',450000,N'Bọc vô lăng Sparco chính hãng SPC1109AZ.jpg',N'Bọc vô lăng Sparco chính hãng SPC1109AZ lấy cảm hứng thể thao từ các dòng xe đua kết hợp với công nghệ sản xuất tiên tiến. Các mẫu bọc vô lăng SPARCO đều có kích thước đường kính 38cm lắp vừa cho hầu hết xe ô tô con tại thị trường Việt Nam. Ưu điểm của bọc vô lăng Sparco Corsa chính hãng: Thương hiệu phụ kiện hàng đầu từ Italia. Vật liệu PU cao cấp, căng bền. Ôm khít hoàn toàn vào vô lăng và cho cảm giác thật chắc tay, chống bám mồ hôi tay vượt trội. Bảo vệ vô lăng khỏi sự bong tróc, trầy xước. Được gia công hoàn hảo chống bay màu sau thời gian sử dụng. Rất dể dàng lắp đặt. Phù hợp cho hầu hết các loại xe. Thiết kế mang phong cách thể thao cá tính kết hợp chất liệu cao cấp giúp mang lại cảm giác chắc tay khi cầm lái. Tạo điểm nhấn nổi bật cho khoang nội thất xế yêu. Tiêu chuẩn EU: An toàn rất cao. Sparco – Thương hiệu nổi tiếng đến từ Italia: Sparco S.P.A là một công ty phụ kiện ô tô nổi tiếng của đất nước xinh đẹp cổ kính – Italia, công ty có trụ sở chính tại Volpiano, Turin, Ý. Được thành lập bởi Enrico Glorioso và Antonio Parisi, một cựu vận động viên đua xe. Với kinh nghiệm và niềm đam mê đối với đường đua tốc độ, họ đã trở thành những người tiên phong trong việc sản xuất các sản phẩm chuyên dụng cho các cuộc thi ô tô. Công ty được thành lập vào năm 1977 và đã có các nhà phân phối tại Hoa Kỳ trong khoảng 20 năm. ','04/12/2021',7)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(59,N'Vô Lăng',N'Bọc vô lăng Sparco chính hãng SPC1111GR',450000,N'Bọc vô lăng Sparco chính hãng SPC1111GR.jpg',N'Bọc vô lăng Sparco chính hãng SPC1111GR lấy cảm hứng thể thao từ các dòng xe đua kết hợp với công nghệ sản xuất tiên tiến. Các mẫu bọc vô lăng SPARCO đều có kích thước đường kính 38cm lắp vừa cho hầu hết xe ô tô con tại thị trường Việt Nam. Ưu điểm của bọc vô lăng Sparco Corsa chính hãng: Thương hiệu phụ kiện hàng đầu từ Italia. Vật liệu PU cao cấp, căng bền. Ôm khít hoàn toàn vào vô lăng và cho cảm giác thật chắc tay, chống bám mồ hôi tay vượt trội. Bảo vệ vô lăng khỏi sự bong tróc, trầy xước. Được gia công hoàn hảo chống bay màu sau thời gian sử dụng. Rất dể dàng lắp đặt. Phù hợp cho hầu hết các loại xe. Thiết kế mang phong cách thể thao cá tính kết hợp chất liệu cao cấp giúp mang lại cảm giác chắc tay khi cầm lái. Tạo điểm nhấn nổi bật cho khoang nội thất xế yêu. 
Tiêu chuẩn EU: An toàn rất cao. Sparco – Thương hiệu nổi tiếng đến từ Italia: Sparco S.P.A là một công ty phụ kiện ô tô nổi tiếng của đất nước xinh đẹp cổ kính – Italia, công ty có trụ sở chính tại Volpiano, Turin, Ý. Được thành lập bởi Enrico Glorioso và Antonio Parisi, một cựu vận động viên đua xe. Với kinh nghiệm và niềm đam mê đối với đường đua tốc độ, họ đã trở thành những người tiên phong trong việc sản xuất các sản phẩm chuyên dụng cho các cuộc thi ô tô. Công ty được thành lập vào năm 1977 và đã có các nhà phân phối tại Hoa Kỳ trong khoảng 20 năm.','04/12/2021',7)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(60,N'Vô Lăng',N'Bọc vô lăng Sparco chính hãng SPC1111RS',450000,N'Bọc vô lăng Sparco chính hãng SPC1111RS.jpg',N'Bọc vô lăng Sparco chính hãng SPC1111RS lấy cảm hứng thể thao từ các dòng xe đua kết hợp với công nghệ sản xuất tiên tiến. Các mẫu bọc vô lăng SPARCO đều có kích thước đường kính 38cm lắp vừa cho hầu hết xe ô tô con tại thị trường Việt Nam. Ưu điểm của bọc vô lăng Sparco Corsa chính hãng: Thương hiệu phụ kiện hàng đầu từ Italia. Vật liệu PU cao cấp, căng bền. Ôm khít hoàn toàn vào vô lăng và cho cảm giác thật chắc tay, chống bám mồ hôi tay vượt trội. Bảo vệ vô lăng khỏi sự bong tróc, trầy xước. Được gia công hoàn hảo chống bay màu sau thời gian sử dụng. Rất dể dàng lắp đặt. Phù hợp cho hầu hết các loại xe. Thiết kế mang phong cách thể thao cá tính kết hợp chất liệu cao cấp giúp mang lại cảm giác chắc tay khi cầm lái. Tạo điểm nhấn nổi bật cho khoang nội thất xế yêu. 
Tiêu chuẩn EU: An toàn rất cao. Sparco – Thương hiệu nổi tiếng đến từ Italia: Sparco S.P.A là một công ty phụ kiện ô tô nổi tiếng của đất nước xinh đẹp cổ kính – Italia, công ty có trụ sở chính tại Volpiano, Turin, Ý. Được thành lập bởi Enrico Glorioso và Antonio Parisi, một cựu vận động viên đua xe. Với kinh nghiệm và niềm đam mê đối với đường đua tốc độ, họ đã trở thành những người tiên phong trong việc sản xuất các sản phẩm chuyên dụng cho các cuộc thi ô tô. Công ty được thành lập vào năm 1977 và đã có các nhà phân phối tại Hoa Kỳ trong khoảng 20 năm.','04/12/2021',7)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(61,N'Vô Lăng',N'Bọc vô lăng Sparco chính hãng SPC1109GR',450000,N'Bọc vô lăng Sparco chính hãng SPC1109GR.jpg',N'Bọc vô lăng Sparco chính hãng SPC1109GR lấy cảm hứng thể thao từ các dòng xe đua kết hợp với công nghệ sản xuất tiên tiến. Các mẫu bọc vô lăng SPARCO đều có kích thước đường kính 38cm lắp vừa cho hầu hết xe ô tô con tại thị trường Việt Nam. Ưu điểm của bọc vô lăng Sparco Corsa chính hãng: Thương hiệu phụ kiện hàng đầu từ Italia. Vật liệu PU cao cấp, căng bền. Ôm khít hoàn toàn vào vô lăng và cho cảm giác thật chắc tay, chống bám mồ hôi tay vượt trội. Bảo vệ vô lăng khỏi sự bong tróc, trầy xước. Được gia công hoàn hảo chống bay màu sau thời gian sử dụng. Rất dể dàng lắp đặt. Phù hợp cho hầu hết các loại xe. Thiết kế mang phong cách thể thao cá tính kết hợp chất liệu cao cấp giúp mang lại cảm giác chắc tay khi cầm lái. Tạo điểm nhấn nổi bật cho khoang nội thất xế yêu. 
Tiêu chuẩn EU: An toàn rất cao. Sparco – Thương hiệu nổi tiếng đến từ Italia: Sparco S.P.A là một công ty phụ kiện ô tô nổi tiếng của đất nước xinh đẹp cổ kính – Italia, công ty có trụ sở chính tại Volpiano, Turin, Ý. Được thành lập bởi Enrico Glorioso và Antonio Parisi, một cựu vận động viên đua xe. Với kinh nghiệm và niềm đam mê đối với đường đua tốc độ, họ đã trở thành những người tiên phong trong việc sản xuất các sản phẩm chuyên dụng cho các cuộc thi ô tô. Công ty được thành lập vào năm 1977 và đã có các nhà phân phối tại Hoa Kỳ trong khoảng 20 năm.','04/12/2021',7)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(62,N'Phụ Kiện Khác',N'Bộ 4 rèm vải che nắng cửa kính Xe hơi, Ô tô',250000,N'Bộ 4 rèm vải che nắng cửa kính Xe hơi, Ô tô.jpg',N'Bộ 4 rèm vải che nắng cửa kính Xe hơi, Ô tô. Rèm che nắng xe hơi được may từ chất liệu vải cao cấp, không bai, không xù và rất khó bị rách. Những đường chỉ may rèm vô cùng chắc chắn và tinh tế, bạn có thể kéo ra và kéo vào thoải mái mà không lo rèm bị tuột, rách. May gấp nếp thẩm mỹ tạo cảm giác an toàn và thoải mái. Sản phẩm có 3 màu:  Vàng Kem, Đen, Ghi xám. Phù hợp cho các xe từ 4-7 chỗ.Bộ rèm che nắng cản sáng chống chói lóa hơn 80%, chống tia UV trên 80% 200nm -380nm), cách nhiệt chống tia hồng ngoài đến 90%. Giúp bảo vệ sức khỏe người sử dụng và nội thất xe bền màu và mềm mại lâu bên với thời gian, mang lại không gian kín đáo cho người ngồi trong xe.Sử dụng dễ dàng bằng cách đưa thanh ray của rèm lên sát khung tôn của cửa xe, nam châm trên thanh ray rèm sẽ giúp rèm cố định chặt trên khung cửa kính. Đối với những xe vị trí lắp không có kim loại để hút nam châm, sẽ dùng băng keo 3M để cố định rèm lên khung cửa','04/12/2021',8)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(63,N'Phụ Kiện Khác',N'Máy hút bụi Baseus Shark One H-505 Car Vacuum Cleaner không dây',700000,N'Máy hút bụi Baseus Shark One H-505 Car Vacuum Cleaner không dây.jpg',N'Máy hút bụi mini cầm tay Basseus Shark One có kích thước nhỏ gọn , kiểu dáng cơ động , thon dài với tay cầm phía sau . Phù hợp cho cả nhu cầu sử dụng trong nhà và trên xe hơi . Baseus Shark One có thể vệ sinh sạch sẽ được nhiều vị trí, bề mặt và không gian khác nhau từ cửa gió máy lạnh, lưng ghế, gầm ghế, các hộc chứa đồ và nhiều vị trí khác nhau trên xe nhờ được trang bị nhiều đầu chổi quét/ hút khác nhau . Baseus H505 có tính cơ động cao, dễ dàng mang theo và sử dụng mọi nơi nhờ được trang bị pin sạc tiện dụng, không lo vướng víu dây điện. Trên thân máy còn được trang bị đèn giúp bạn dễ dàng vệ sinh ở những góc tối trong nhà hoặc xe. Baseus H505 có cánh quạt làm bằng thép không rỉ có độ bền cao, lực hút mạnh, tốc độ quạt lên đến 4000 Pa, công suất 65W giúp bạn dễ dàng vệ sinh nhiều loại bụi bẩn và rác thải khác nhau từ bụi, tóc, giấy vụn, gỗ, bánh, tàn thuốc là và nhiều loại rác khác. Sản phẩm có màu đen - xám , bề mặt được thiết kế bóng bẩy, sang trọng và đẹp mắt . Đi kèm là túi vải nhỏ gọn, kiểu dáng trẻ trung , thể thao.Sản phẩm chính hãng Baseus, bảo hành 6 tháng lỗi đổi mới','04/12/2021',8)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(64,N'Phụ Kiện Khác',N'Thùng, hộp đựng đồ co giãn trên Ô tô, Xe hơi – thể tích 40L',370000,N'Thùng, hộp đựng đồ co giãn trên Ô tô, Xe hơi – thể tích 40L.jpg',N'Thùng, hộp đựng đồ co giãn trên Ô tô, Xe hơi. Chất liệu từ nhựa PP cao cấp, chịu nhiệt từ -15 đến 90 độ C an toàn cho người sử dụng. Thùng đựng đồ tiện ích có dung tích tối đa 40 lit, khả năng lưu trữ lên đến 20 kg, bạn có thể cất gọn ở bất kỳ đâu: gầm ghế ô tô, cốp ô tô, sau cánh cửa, ngăn tủ…cực kỳ gọn nhẹ và tiện lợi cho những chuyển du lịch dài ngày. Thùng đựng đồ trong cốp ô tô, thùng đựng đồ trong nhà, thùng đựng đồ tiện lợi trong văn phòng. Kích thước thu nhỏ: 48,5 x 28 x 11cm. Kích thước khi giãn: 48,5 x 28 x 30cm. Chất liệu: Nhựa PP .Khối lượng lưu trữ: 20Kg. Dung tích: 40 lít. Tính năng: Lữu trữ đồ dùng, chất lỏng.','04/12/2021',8)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(65,N'Phụ Kiện Khác',N'Bạt che, chắn nắng kính lái Ô tô, Xe hơi – Phủ bên ngoài',150000,N'Bạt che, chắn nắng kính lái Ô tô, Xe hơi – Phủ bên ngoài.jpg',N'Bạt chắn nắng kính lái ô tô 3 lớp với với chất liệu dày dặn chắc chắn, gồm 3 lớp, có lớp tráng nhôm, chống ánh nắng mặt trời, chống bức xạ nhiệt khi bị chiếu nắng trực tiếp, làm giảm nhiệt độ trong xe, tránh các tác hại gây ra cho ô tô do nhiệt độ quá cao. Tấm chắn nắng ô tô gần như ôm khít phần kính chắn gió của xe, tai ngoe có thể kẹp vào hai bên cửa xe ô tô chắc chắn, chống bay khi trời nổi gió. Có thể xếp gọn để cất giữ trong ô tô, tiện lợi, không chiếm diện tích.  Phù hợp với tất cả các dòng xe SUV, sedan, hatchback.','04/12/2021',8)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(66,N'Phụ Kiện Khác',N'Khay để đồ khe ghế Ô tô, xe hơi bọc da cao cấp',150000,N'Khay để đồ khe ghế Ô tô, xe hơi bọc da cao cấp.jpg',N'Khay để đồ khe ghế Ô tô, xe hơi đa năng. Chất liệu nhựa ABS, bọc da cao cấp mang đến vẻ sang trọng, đẳng cấp cho nội thất ô tô của bạn. Khung hộp được thiết kế chắc chắn, cứng cáp vừa vặn với khoảng trống giữa hộp số và ghế trước, không bị xê dịch khi xe lăn bánh. Nhiều khay to, nhỏ khác nhau giúp bạn giúp bạn để điện thoại, bao thuốc, giấy tờ, bật lửa, khăn,….một cách tiện lợi nhất. Sản phẩm có 4 màu Đen, Đỏ, Vàng Kem, Vàng Da Bò, phù hợp với mọi loại xe hơi 4-7 chỗ hiện nay.','04/12/2021',8)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(67,N'Phụ Kiện Khác',N'Tấm dán chống bám nước, đọng nước gương chiếu hậu xe hơi',100000,N'Tấm dán chống bám nước, đọng nước gương chiếu hậu xe hơi.jpg',N'Tấm dán chống bám nước, chống đọng nước cho gương chiếu hậu xe hơi. Đây là sản phẩm thiết kế dành riêng cho gương chiếu hậu xe hơi, cực kỳ hữu ích cho các bạn lái xe khi trời mưa (loại bỏ nỗi lo hạn chế tầm nhìn gây nguy hiểm khi lưu thông trên đường). Miếng dán từ tính trong suốt, khi dán lên không ảnh hưởng đến góc quan sát của gương chiếu hậu. Thao tác dán rất đơn giản, chỉ cần lau sạch gương và dán lên. Độ bền và hiệu quả sử dụng cao nên tiết kiệm so với các loại nước xịt chống bám nước. 1 bộ sản phẩm gồm 2 tấm dán được đựng trong hộp, đi kèm khăn lau, tấm lấy bụi,...Có 2 kích thước: size vừa hình tròn dùng cho hầu hết các dòng xe (100k/bộ, gồm 2 tấm); size to hình chữ nhật dùng cho các dòng xe có kích thước gương to (120k/bộ, gồm 2 tấm).','04/12/2021',8)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(68,N'Phụ Kiện Khác',N'Tẩu sạc ô tô Baseus 2 cổng sạc Type-C, USB 45W PPS Quick Changer',320000,N'Tẩu sạc ô tô Baseus 2 cổng sạc Type-C, USB 45W PPS Quick Changer.jpg',N'Tẩu sạc ô tô Baseus 2 cổng sạc Type-C, USB 45W PPS Quick Changer Thương hiệu Baseus Xuất Xứ Hong Kong Trang bị 2 cổng sạc chuẩn USB + Type-C , công suất lên đến 45W chuẩn 5A,
Hỗ trợ sạc nhanh chuẩn PD 3.0 / Quick charge 3.0 / Quick Chagre 4.0 và nhiều chuẩn sạc nhanh khác, cho tốc độ sạc nhanh và ổn định hơn 45%
Chip sạc xử lý nguồn thông minh , tự động nhận dạng thiết bị . Hỗ trợ nhiều mức điên áp và dòng điện khác nhau, bảo vệ thiết bị và quá trình sạc.
Thiết kế nhỏ gọn, bề mặt kim loại được sơn tỉnh điện đẹp mắt và sang trọng .
Được trang bị 2 cổng sạc chuẩn USB + Type-C, công suất lên đến 48W và dòng điện 6A, hỗ trợ sạc nhanh chuẩn Quick charge 3.0 / 4.0, sạc nhanh PD và nhiều chuản sạc nhanh khác cho tốc độ sạc nhanh đáng kể so với các thiết bị thông thường . Bạn có thể dùng để cấp nguồn hoặc sạc pin cho nhiều thiết bị cùng lúc
Trang bị chip xử lý nguồn thông minh , tự động nhận dạng thiết bị, tự động ngắt khi đầy .
Hỗ trợ nhiều mức điên áp và dòng điện khác nhau. Đảm bao tương thích với nhiều thiết bị khác nhau từ iPhone/ iPad / Macbook cho đến các điện thoại Android như Sony , Samsung , HTC, LG, Xiaomi, Hà tiết kiệm hơn 45% thời gian sạc so với các sản phẩm cùng loại.
Hai cổng sạc là 2 chip sạc nhanh giống nhau cho khả năng sạc nhanh như nhau ở 2 cổng. Adapter sạc sẽ tự điều chỉnh dòng điện qua từng giai đoạn sạc, sạc nhanh ban đầu và chậm dần về sau để thiết bị được an toàn và tự ngắt khi đầy.
Ngoài ra còn hỗ trợ bảo vệ điện áp, bảo vệ nghẽn mạch, chống tăng nhiệt độ khi sạc, chống quả tải điện áp, quá dòng Adapter hỗ trợ sạc nhanh hầu hết các tiêu chuẩn có mặt trên thị trường hiện nay của các thương hiệu lớn như Samsung, Huawei, Apple, Macbook
Trang bị màn hình LED thông minh báo cường độ dòng điện , điện áp trong từng giai đoạn sạc khác nhau, giúp bạn dễ dàng theo dõi quá trình sạc.
Thiết kế gọn nhẹ và dễ dáng mang theo, chúng sẽ không chiếm nhiều không gian trên xe của bạn.
Thiết bị thiết kế với hợp kim chắc chắn và 3 chấu ghim cho kết nối ổn định và chắc chắn, không dễ bị rơi ra hay mất kết nối khi chạy xe
Thiết kế phù hợp cho mọi thiết bị và mọi loại xe hiện nay, bạn có thể sạc đồng thời 2 thiết bị và tốc độ sạc nhanh là như nhau.
Với thiết kế hợp kim chắc chắn, bên ngoài được phủ lớp sơn tĩnh điện bền màu cộng với màu sắc vô cùng bắt mắt, sản phẩm cho một cái nhìn hoàn toàn mới về dòng sản phẩm tẩu sạc xe hơi','04/12/2021',8)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(69,N'Phụ Kiện Khác',N'Tượng Phật 3 mặt cầu tài, cầu bình an đặt Taplo Xe hơi, Ô tô',430000,N'Tượng Phật 3 mặt cầu tài, cầu bình an đặt Taplo Xe hơi, Ô tô.jpg',N'Tượng Phật 3 mặt cầu tài, cầu bình an đặt Taplo Xe hơi, Ô tô.Phật Di Lặc trong Phong thủy: Theo truyền thuyết, niềm vui lớn nhất của vị Bồ Tát này là biến những buồn phiền, giận dữ, áp lực hay căng thẳng của con người thành hạnh phúc.Phật Như Lai xua tan phiền lo, cuộc sống sung túc viên mãn, tài phú tăng tiến, chỉ được không mất.Phật Bà Quan Âm luôn là biểu tượng của điềm lành, lòng hướng thiện, hướng phật, may mắn lòng từ bi, bác ái, hóa hung khí, đem lại bình an, giải trừ những điều xấu cho gia chủ.Được chế tác tinh sảo, tỉ mỉ bằng hợp kim kẽm đặc mạ vàng, rất thuận phong thủy, thêm thuận lợi, suôn sẻ và may mắn cho mọi việc. Tượng có khu vực để sáp thơm, bùa bình an được thiết kế kín đáo và hợp lý bên dưới đài sen, mang lại cảm giác dễ chịu nhất, loại bỏ những mùi hôi lâu ngày trên xe của bạn.Tiện đặt trong xe hơi, bàn làm việc, Ngoài ra tiện lợi cho việc thờ, cúng, tâm linh hoặc làm quà tặng cũng rất ý nghĩa…','04/12/2021',8)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(70,N'Phụ Kiện Khác',N'Tượng Hổ vằn đính đá phong thủy trang trí Taplo Xe hơi, Ô tô',530000,N'Tượng Hổ vằn đính đá phong thủy trang trí Taplo Xe hơi, Ô tô.jpg',N'Tượng Hổ vằn đính đá phong thủy trang trí Taplo Xe hơi, Ô tô. TƯỢNG HỔ là biểu tượng của quyền uy, sự thăng tiến trong học hành, kinh doanh và đặc biệt trong xem tử vi thấy hợp với người tuổi Dần.Được chế tác tinh sảo, tỉ mỉ bằng hợp kim kẽm đặc mạ vàng, các vằn trên lưng hổ được đính đá tự nhiên, rất bắt mắt và sang trọng. Thuận phong thủy, thêm thuận lợi, suôn sẻ và may mắn cho mọi việc. Chân đế tượng được làm bằng thủy tinh, có lỗ để đựng nước hoa, tinh dầu có tác dụng khử mùi, chống say xe, tạo cảm giác dễ chịu, khoan khoái.Đặt tượng trên taplo xe càng tăng thêm vẻ sang trọng cho xế yêu của bạn. Bạn có thể đặt trên xe hơi, bàn làm việc, phòng khách, tủ trưng bày hoặc làm quà tặng…Kích thước: 27cm x 8cm x 8cm ','04/12/2021',8)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(71,N'Phụ Kiện Khác',N'Tượng Phật Di Lặc cầu tài, cầu bình an đặt Taplo Xe hơi, Ô tô',320000,N'Tượng Phật Di Lặc cầu tài, cầu bình an đặt Taplo Xe hơi, Ô tô.jpg',N'Tượng phật di lặc màu vàng với quả cầu có thể quay sử dụng năng lượng mặt trời –Tượng phật có khu vực để nước hoa bên dưới đáy– Tượng Phật trang trí mặt Taplo Có tấm dính chống trượt đi kèm– Kích thước 16cm x 12cm x cao 11cmPhật Di Lặc trong Phong thủy: Theo truyền thuyết, niềm vui lớn nhất của vị Bồ Tát này là biến những buồn phiền, giận dữ, áp lực hay căng thẳng của con người thành hạnh phúc.– Tượng to và sáng sang trọng. Khi đi đường quạt trên tay phật sẽ phe phẩy, khi có ánh nắng thì quả cầu như ý xoay. Có ngăn chứa nước hoa ở dưới đế tượng.– Tượng Phật Di Lặc Chạy năng lượng mặt trời. Quả cầu như ý trên tay phật sẽ xoay 360 độ khi có ánh nắng, xoay càng nhanh khi có nhiều ánh nắng.Phật sẽ Vẫy Quạt khi xe chuyển động tượng trưng cho phong thuỷ: Chiêu Tài, Đem về May Mắn Bình An TƯỢNG được đúc hình tượng sang trọng, được sơn vẽ kỳ công, lớp mạ rất bền màu ít bị bong tróc, Tiện đặt trong xe hơi, bàn làm việc, Ngoài ra tiện lợi cho việc thờ, cúng, tâm linh hoặc làm quà tặng cũng rất ý nghĩa…','04/12/2021',8)
insert into DoChoiXe(MaDC, LoaiDC,TenDC, GiaDC,AnhDC,MoTa,NgayCapNhat,MaLoaiDC) values
(72,N'Phụ Kiện Khác',N'Bảng số điện thoại dùng trên xe hơi chính hãng Baseus Dual Number vỏ nhôm',290000,N'Bảng số điện thoại dùng trên xe hơi chính hãng Baseus Dual Number vỏ nhôm.jpg',N'Bảng số điện thoại dùng trên xe hơi Baseus Dual Number vỏ nhôm. Bảng báo số điện thoại dùng dán trên táp lô xe hơi. Phiên bản nâng cấp có thể hiển thị được 2 số điện thoại khác nhauCó thể lựa chọn số hiện thị và giấu số nhanh chóng và dễ dàng chỉ bằng thao tác xoayDãy số dạ quang, có thể nhìn rỏ trong điều kiện thiếu sáng, bóng tốiThiết kế nhỏ gọn, không che khuất tầm nhìn. Chất liệu kim loại, siêu bền, dùng được trong điều kiện thời tiết nóngBảng số điện thoại ô tô số to, rõ ràng. Thiết kế đẹp mắt, tinh tế làm cho ôtô của bạn trở nên sang trọng hơn.Chất liệu hợp kim nhôm cao cấp chắc chắn, cho bạn thời gian sử dụng lâu dài.','04/12/2021',8)
SET IDENTITY_INSERT DoChoiXe Off;




Alter table Xe add Constraint FRK_Xe_Class foreign key (MaClass) references Class(MaClass)

Alter table DoChoiXe add Constraint FRK_DoChoiXe_LoaiDoChoiXe foreign key (MaLoaiDC) references LoaiDoChoiXe(MaLoaiDC)

Alter table ChiTietPhuKien add Constraint FRK_ChiTietPhuKien_PhuKien foreign key (MaPhuKien) references Phukien(MaPhuKien)

ALTER TABLE DonDatHang ADD CONSTRAINT FK_DDH_KH FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)

ALTER TABLE DonDatHangDoChoi ADD CONSTRAINT FK_DDHDC_KH FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)

ALTER TABLE ChiTietDonDatHangDC ADD CONSTRAINT FK_CTDDHDC_DDHDC FOREIGN KEY (MaDonHangDC) REFERENCES DonDatHangDoChoi(MaDonHangDC)

ALTER TABLE ChiTietDonDatHangDC ADD CONSTRAINT FK_CTDDHDC_KH FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)

