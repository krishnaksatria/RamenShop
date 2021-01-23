USE RamenShop

--Customer
INSERT INTO Customer VALUES 
('CU001','Andi Rudianto Santoso','09-26-2013','Male','Bintaro Street','087711223332'),
('CU002','Steffany Anggraeny','02-09-1999','Female','Bandung Street','081242567891'),
('CU003','Gishella Angeline','11-12-1976','Female','Tangsel Street','089654164280'),
('CU004','Krishna Ksatria Putra','08-09-1999','Male','Gedung Utama Street','081263261463'),
('CU005','Anggraini','07-15-1968','Female','Urang Aring Street','087725334567'),
('CU006','Handi Thenadiputto','01-29-1993','Male','Kesana Kemari Street','087523456176'),
('CU007','Keeven Marcello','08-24-1987','Male','Imam Bonjol Street','087625678534'),
('CU008','Vallencia Hermawan','10-01-1975','Male','Pasar Delapan Street','081367891234'),
('CU009','Glenn Tama Winardi','12-05-1988','Male','Pangeran Diponogoro Street','089672561254'),
('CU010','Cindy Fransisca','07-18-1988','Female','Mohammad Hatta Street','089907865438'),
('CU011','Hendra Ariya Putra','04-17-1950','Male', 'Susilo Bambang Yudhoyono Street','082979460718'),
('CU012','Metta Sadhana','05-09-2003','Male','Joko Widodo Street','081956781345'),
('CU013','Upekkha Sadhana','05-09-2003','Female','Ki Hajar Dewantara Street','089157834570')


--Ramen
INSERT INTO Ramen VALUES
	('RA001','Kushiro Ramen','15000'),
	('RA002','Kitami Ramen','25000'),
	('RA003','Asahikawa Ramen','20000'),
	('RA004','Sapporo Ramen','17000'),
	('RA005','Hakodate Ramen','18000'),
	('RA006','Tsugaru Ramen','19000'),
	('RA007','Sendai Ramen','21000'),
	('RA008','Sakata Ramen','22000'),
	('RA009','Yonezawa Ramen','23000'),
	('RA010','Kitakata Ramen','24000')


--Staff
INSERT INTO Staff VALUES
('ST001','Marcell Rusman Narladi','Male','9/20/1988','082358735979','Bundaran HI Street',1750000),
('ST002','Bandam Daslinta','Male', '8/19/1997','085903662529','Turning Move Street',3175000),
('ST003','Jesslyn Carolina Santi','Female','7/18/1966','088203847011','Kuda Laut Perkasa Street', 3425000),
('ST004','Vamdamme','Male','6/17/2004','085288501053','Bunga Mawar Street',2630000),
('ST005','Nico Fernando','Male','5/16/1977','081969320618','Botol Minum Street',2643000),
('ST006','Samuel Christianto Chandra','Male','4/15/1988','087072055803', 'Pocky Street',1730000),
('ST007','Kent Anderson','Male','3/14/1966','086647020192','Batu Bara Merata Street',2153000),
('ST008','Jasson Adhiputra','Male','2/13/1955','089066555803','Music is My Life Street',2640000),
('ST009','Juan Lee Adipa','Male','1/12/1946','085662873554','Luar Biasa Street',1947000),
('ST010','Bacillus Protectus','Female','12/11/1995','088799656762','Ilmuan Hebat Street',1992000)


--Ingredient
INSERT INTO Ingredient VALUES
	('RI001','Garam','1'),
	('RI002','Air galon','2'),
	('RI003','Akar Jahe','3'),
	('RI004','Bawang Putih','4'),
	('RI005','Minyak Sayur','5'),
	('RI006','Tepung Terigu','6'),
	('RI007','Telur','7'),
	('RI008','Baking Soda','8'),
	('RI009','Daging','9'),
	('RI010','Kecap Asin','10')


--RecipeDetail
INSERT INTO RecipeDetail VALUES
	('RA001','RI006','1'),
	('RA001','RI007','2'),
	('RA001','RI008','3'),
	('RA002','RI009','3'),
	('RA002','RI010','2'),
	('RA002','RI009','1'),
	('RA003','RI008','2'),
	('RA003','RI007','3'),
	('RA003','RI006','2'),
	('RA004','RI005','1'),
	('RA004','RI004','2'),
	('RA005','RI003','3'),
	('RA005','RI002','2'),
	('RA006','RI001','1'),
	('RA006','RI002','2'),
	('RA007','RI003','3'),
	('RA007','RI004','2'),
	('RA008','RI005','1'),
	('RA009','RI006','2'),
	('RA010','RI007','3')


--Supplier
INSERT INTO Supplier VALUES
('SP001', 'Galileo Galilei', 'Kennardi Salim Street', '089612679346'),
('SP002', 'Shaun The Sheep', 'Jormin Santi Wakalingka Street',	'08913749172'),
('SP003', 'Spongebob Squarepants', 'Jusuf Bulaiman Street', '081659255648'),
('SP004', 'Web Diver', 'Rasa rasane Street', '087712226788'),
('SP005', 'Gundam', 'Cinta Indonesia Street', '098811557722'),
('SP006', 'Ingredients Enak dijamin', 'Berguruan Santoso Street', '081966772255'),
('SP007', 'Clean Wash',	'Bunga Bangkai Street', '089600193377'),
('SP008', 'Budi Budiman nan Budiman', 'Jarak diantaranya Street', '089155728548'),
('SP009', 'Pusing Namanya Apa', 'Galau Street', '081259273916'),
('SP010', 'Yuliana Hema Juwita Sari', 'Selimut hangat Street', '089912224567')


--PurchaseTrans
INSERT INTO PurchaseTrans VALUES 
('PU001', 'ST010', 'SP005', '12-30-2015'),
('PU002', 'ST009', 'SP004', '11-29-2015'),
('PU003', 'ST008', 'SP003', '10-28-2016'),
('PU004', 'ST007', 'SP002', '09-27-2016'),
('PU005', 'ST006', 'SP001', '08-26-2017'),
('PU006', 'ST005', 'SP002', '07-25-2017'),
('PU007', 'ST004', 'SP003', '06-24-2018'),
('PU008', 'ST003', 'SP004', '05-23-2018'),
('PU009', 'ST002', 'SP005', '04-22-2019'),
('PU010', 'ST001', 'SP006', '03-21-2019'),
('PU011', 'ST002', 'SP007', '02-20-2018'),
('PU012', 'ST003', 'SP008', '01-19-2018'),
('PU013', 'ST004', 'SP009', '02-18-2017'),
('PU014', 'ST005', 'SP010', '03-17-2017'),
('PU015', 'ST006', 'SP009', '04-16-2016'),
('PU016', 'ST007', 'SP008', '05-15-2016'),
('PU017', 'ST008', 'SP007', '06-14-2015'),
('PU018', 'ST009', 'SP006', '07-13-2015'),
('PU019', 'ST010', 'SP005', '08-12-2014'),
('PU020', 'ST009', 'SP004', '09-11-2014')

--PurchaseTransDetail
INSERT INTO PurchaseTransDetail VALUES
('PU001', 'RI007', 9),
('PU002', 'RI004', 8),
('PU003', 'RI003', 7),
('PU004', 'RI008', 6),
('PU005', 'RI010', 5),
('PU006', 'RI001', 4),
('PU007', 'RI004', 3),
('PU008', 'RI003', 2),
('PU009', 'RI009', 1),
('PU010', 'RI010', 2),
('PU011', 'RI006', 3),
('PU012', 'RI005', 4),
('PU013', 'RI010', 5),
('PU014', 'RI010', 6),
('PU015', 'RI002', 7),
('PU016', 'RI002', 8),
('PU017', 'RI003', 9),
('PU018', 'RI004', 8),
('PU019', 'RI004', 4),
('PU020', 'RI005', 5),
('PU019', 'RI005', 1),
('PU018', 'RI007', 3),
('PU017', 'RI007', 7),
('PU016', 'RI008', 3),
('PU015', 'RI008', 4),
('PU014', 'RI009', 2),
('PU013', 'RI009', 5),
('PU012', 'RI010', 9),
('PU011', 'RI004', 1),
('PU010', 'RI005', 2)

-- SalesTrans
INSERT INTO SalesTrans VALUES
('SL001', 'ST001', 'CU001','6-12-2013'),
('SL002', 'ST002', 'CU002', '7-13-2014'),
('SL003', 'ST003', 'CU003', '8-21-2015'),
('SL004', 'ST004', 'CU004', '9-26-2016'),
('SL005', 'ST005', 'CU005', '10-23-2017'),
('SL006', 'ST006', 'CU006', '11-27-2018'),
('SL007', 'ST007', 'CU007', '12-17-2019'),
('SL008', 'ST008', 'CU008', '11-16-2017'),
('SL009', 'ST009', 'CU009', '11-23-2019'),
('SL010', 'ST010', 'CU010', '9-15-2018'),
('SL011', 'ST009', 'CU011', '1-11-2018'),
('SL012', 'ST008', 'CU012', '4-22-2018'),
('SL013', 'ST007', 'CU013', '6-17-2017'),
('SL014', 'ST006', 'CU012', '5-11-2017'),
('SL015', 'ST005', 'CU011', '3-21-2016')

-- SalesTransDetail
INSERT INTO SalesTransDetail VALUES
('SL001', 'RA001', 3),
('SL001', 'RA002', 5),
('SL001', 'RA003', 2),
('SL002', 'RA004', 7),
('SL002', 'RA002', 6),
('SL002', 'RA005', 6),
('SL006', 'RA002', 9),
('SL003', 'RA006', 12),
('SL003', 'RA002', 3),
('SL004', 'RA007', 16),
('SL004', 'RA003', 3),
('SL004', 'RA001', 11),
('SL005', 'RA004', 10),
('SL005', 'RA005', 9),
('SL005', 'RA006', 7),
('SL006', 'RA007', 3),
('SL006', 'RA008', 8),
('SL006', 'RA009', 8),
('SL007', 'RA010', 16),
('SL008', 'RA007', 12)

DELETE FROM PurchaseTransDetail, SalesTransDetail, SalesTrans, PurchaseTrans, RecipeDetail, Ramen, Ingredient, Staff,  Supplier, Customer,