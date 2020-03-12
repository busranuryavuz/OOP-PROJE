CREATE DATABASE [otel]
GO
USE [otel]
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 24.05.2019 14:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](50) NULL,
	[soyad] [nvarchar](50) NULL,
	[yas] [smallint] NULL,
	[tc_kimlik] [char](11) NULL,
	[telefon] [char](20) NULL,
	[sifre] [nchar](10) NULL,
	[meslek] [nvarchar](50) NULL,
	[userID] [nchar](20) NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odalar]    Script Date: 24.05.2019 14:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odalar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[otel_ID] [int] NULL,
	[musteri_ID] [int] NULL,
	[oda_tipi] [nvarchar](50) NULL,
	[fiyati] [int] NULL,
	[toplam_ucret] [int] NULL,
	[oda_numarasi] [int] NULL,
	[dolumu] [smallint] NULL,
	[baslangicTarihi] [date] NULL,
	[bitis] [date] NULL,
 CONSTRAINT [PK_Odalar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oteller]    Script Date: 24.05.2019 14:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oteller](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[otel_adi] [nvarchar](50) NULL,
	[adres] [nvarchar](50) NULL,
	[yildiz] [nchar](5) NULL,
	[sahibi] [nvarchar](50) NULL,
	[resim] [nchar](10) NULL,
 CONSTRAINT [PK_Oteller] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Musteriler] ON 

INSERT [dbo].[Musteriler] ([id], [ad], [soyad], [yas], [tc_kimlik], [telefon], [sifre], [meslek], [userID]) VALUES (1, N'Barýþ', N'Meral', 24, N'44254569871', N'05363654484         ', N'123       ', N'Programcý', N'baris               ')
INSERT [dbo].[Musteriler] ([id], [ad], [soyad], [yas], [tc_kimlik], [telefon], [sifre], [meslek], [userID]) VALUES (2, N'Ali', N'Can', 20, N'14523698745', N'05874123564         ', N'135       ', N'Hekim', N'ali                 ')
INSERT [dbo].[Musteriler] ([id], [ad], [soyad], [yas], [tc_kimlik], [telefon], [sifre], [meslek], [userID]) VALUES (3, N'Ayþe', N'Yýlmaz', 18, N'58452169874', N'05412563987         ', N'123456    ', N'Avukat', N'ayse                ')
INSERT [dbo].[Musteriler] ([id], [ad], [soyad], [yas], [tc_kimlik], [telefon], [sifre], [meslek], [userID]) VALUES (4, N'Beyza', N'Yavuz', 20, N'76254832891', N'05349872513         ', N'123       ', N'Developer', N'beyza               ')
INSERT [dbo].[Musteriler] ([id], [ad], [soyad], [yas], [tc_kimlik], [telefon], [sifre], [meslek], [userID]) VALUES (5, N'hüseyin', N'can', 12, N'4512235645 ', N'05467894512         ', N'sasaa     ', N'matbaa', N'husey               ')
INSERT [dbo].[Musteriler] ([id], [ad], [soyad], [yas], [tc_kimlik], [telefon], [sifre], [meslek], [userID]) VALUES (6, N'ahmet', N'Savaþ', 20, N'1111111111 ', N'05371111111         ', N'123       ', N'Bil.Mühendisi', N'ahmet               ')
INSERT [dbo].[Musteriler] ([id], [ad], [soyad], [yas], [tc_kimlik], [telefon], [sifre], [meslek], [userID]) VALUES (7, N'Ýlayda', N'Savaþer', 20, N'22222222222', N'11212121211         ', N'123       ', N'Bil.Mühendisi', N'ilayda              ')
SET IDENTITY_INSERT [dbo].[Musteriler] OFF
SET IDENTITY_INSERT [dbo].[Odalar] ON 

INSERT [dbo].[Odalar] ([id], [otel_ID], [musteri_ID], [oda_tipi], [fiyati], [toplam_ucret], [oda_numarasi], [dolumu], [baslangicTarihi], [bitis]) VALUES (1, 1, 2, N'normal', 540, 600, 13, 1, CAST(N'2019-05-21' AS Date), CAST(N'2019-04-30' AS Date))
INSERT [dbo].[Odalar] ([id], [otel_ID], [musteri_ID], [oda_tipi], [fiyati], [toplam_ucret], [oda_numarasi], [dolumu], [baslangicTarihi], [bitis]) VALUES (2, 2, 1, N'ekonomik', 450, 500, 10, 1, CAST(N'2019-04-21' AS Date), CAST(N'2019-04-25' AS Date))
INSERT [dbo].[Odalar] ([id], [otel_ID], [musteri_ID], [oda_tipi], [fiyati], [toplam_ucret], [oda_numarasi], [dolumu], [baslangicTarihi], [bitis]) VALUES (3, 3, 3, N'normal', 200, 350, 9, 1, CAST(N'2019-05-21' AS Date), CAST(N'2019-04-22' AS Date))
INSERT [dbo].[Odalar] ([id], [otel_ID], [musteri_ID], [oda_tipi], [fiyati], [toplam_ucret], [oda_numarasi], [dolumu], [baslangicTarihi], [bitis]) VALUES (9, 1, 2, N'normal', 200, 250, 7, 1, CAST(N'2019-04-04' AS Date), CAST(N'2019-04-04' AS Date))
INSERT [dbo].[Odalar] ([id], [otel_ID], [musteri_ID], [oda_tipi], [fiyati], [toplam_ucret], [oda_numarasi], [dolumu], [baslangicTarihi], [bitis]) VALUES (10, 3, 1, N'normal', 1068, 1068, 4, 1, CAST(N'2019-05-25' AS Date), CAST(N'2019-05-28' AS Date))
INSERT [dbo].[Odalar] ([id], [otel_ID], [musteri_ID], [oda_tipi], [fiyati], [toplam_ucret], [oda_numarasi], [dolumu], [baslangicTarihi], [bitis]) VALUES (11, 3, 1, N'ekonomik', 1068, 1068, 3, 1, CAST(N'2019-05-25' AS Date), CAST(N'2019-05-28' AS Date))
INSERT [dbo].[Odalar] ([id], [otel_ID], [musteri_ID], [oda_tipi], [fiyati], [toplam_ucret], [oda_numarasi], [dolumu], [baslangicTarihi], [bitis]) VALUES (12, 3, 1, N'normal', 1068, 1068, 2, 1, CAST(N'2019-05-25' AS Date), CAST(N'2019-05-28' AS Date))
INSERT [dbo].[Odalar] ([id], [otel_ID], [musteri_ID], [oda_tipi], [fiyati], [toplam_ucret], [oda_numarasi], [dolumu], [baslangicTarihi], [bitis]) VALUES (13, 3, 2, N'normal', 200, 200, 4, 1, CAST(N'2019-07-07' AS Date), CAST(N'2019-07-07' AS Date))
INSERT [dbo].[Odalar] ([id], [otel_ID], [musteri_ID], [oda_tipi], [fiyati], [toplam_ucret], [oda_numarasi], [dolumu], [baslangicTarihi], [bitis]) VALUES (14, 5, 1, N'normal', 340, 340, 3, 1, CAST(N'2019-05-24' AS Date), CAST(N'2019-05-30' AS Date))
INSERT [dbo].[Odalar] ([id], [otel_ID], [musteri_ID], [oda_tipi], [fiyati], [toplam_ucret], [oda_numarasi], [dolumu], [baslangicTarihi], [bitis]) VALUES (15, 5, 1, N'ekonomik', 340, 340, 2, 1, CAST(N'2019-05-24' AS Date), CAST(N'2019-05-30' AS Date))
INSERT [dbo].[Odalar] ([id], [otel_ID], [musteri_ID], [oda_tipi], [fiyati], [toplam_ucret], [oda_numarasi], [dolumu], [baslangicTarihi], [bitis]) VALUES (26, 2, 7, N'normal', 284, 284, 3, 1, CAST(N'2019-05-25' AS Date), CAST(N'2019-05-27' AS Date))
INSERT [dbo].[Odalar] ([id], [otel_ID], [musteri_ID], [oda_tipi], [fiyati], [toplam_ucret], [oda_numarasi], [dolumu], [baslangicTarihi], [bitis]) VALUES (27, 2, 7, N'ekonomik', 284, 284, 7, 1, CAST(N'2019-05-25' AS Date), CAST(N'2019-05-27' AS Date))
SET IDENTITY_INSERT [dbo].[Odalar] OFF
SET IDENTITY_INSERT [dbo].[Oteller] ON 

INSERT [dbo].[Oteller] ([id], [otel_adi], [adres], [yildiz], [sahibi], [resim]) VALUES (1, N'Armada Otel Ýstanbul', N'Beþiktaþ', N'5    ', N'Armada', N'1.jpg     ')
INSERT [dbo].[Oteller] ([id], [otel_adi], [adres], [yildiz], [sahibi], [resim]) VALUES (2, N'Faros Otel', N'Beyoðlu', N'4    ', N'Faros', N'2.jpg     ')
INSERT [dbo].[Oteller] ([id], [otel_adi], [adres], [yildiz], [sahibi], [resim]) VALUES (3, N'Dedeman Ýstanbul', N'Niþantaþý', N'5    ', N'Abdullah Salih', N'3.jpg     ')
INSERT [dbo].[Oteller] ([id], [otel_adi], [adres], [yildiz], [sahibi], [resim]) VALUES (4, N'Hotel Milano', N'Taksim', N'3    ', N'Þeyma Subaþý', N'4.jpg     ')
INSERT [dbo].[Oteller] ([id], [otel_adi], [adres], [yildiz], [sahibi], [resim]) VALUES (5, N'Sultan Palace Otel', N'Bebek', N'5    ', N'Sultan Yýlmaz', N'5.jpg     ')
INSERT [dbo].[Oteller] ([id], [otel_adi], [adres], [yildiz], [sahibi], [resim]) VALUES (6, N'Arena Otel', N'Kadýköy', N'3    ', N'Süleyman Hakan', N'6.jpg     ')
SET IDENTITY_INSERT [dbo].[Oteller] OFF
ALTER TABLE [dbo].[Odalar]  WITH CHECK ADD  CONSTRAINT [FK_Odalar_Musteriler1] FOREIGN KEY([musteri_ID])
REFERENCES [dbo].[Musteriler] ([id])
GO
ALTER TABLE [dbo].[Odalar] CHECK CONSTRAINT [FK_Odalar_Musteriler1]
GO
ALTER TABLE [dbo].[Odalar]  WITH CHECK ADD  CONSTRAINT [FK_Odalar_Oteller] FOREIGN KEY([otel_ID])
REFERENCES [dbo].[Oteller] ([id])
GO
ALTER TABLE [dbo].[Odalar] CHECK CONSTRAINT [FK_Odalar_Oteller]
GO
