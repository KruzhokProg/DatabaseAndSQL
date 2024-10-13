-- CREATE TABLE Заказчик(
-- 	код int PRIMARY KEY,
-- 	фио varchar(50) NOT NULL,
-- 	телефон varchar(11) NOT NULL,
-- 	адрес text NOT NULL
-- );

-- CREATE TABLE Категория(
-- 	код int PRIMARY KEY,
-- 	название varchar(50) NOT NULL
-- );

-- CREATE TABLE Товар(
-- 	артикул varchar(100) PRIMARY KEY,
-- 	код_категории int NOT NULL REFERENCES Категория(код),
-- 	название text NOT NULL,
-- 	себестоимость money NOT NULL
-- );

-- CREATE TABLE ФотоТовара(
-- 	код int PRIMARY KEY,
-- 	артикул_товара varchar(100) NOT NULL REFERENCES Товар(артикул),
-- 	адрес text NOT NULL
-- );

-- CREATE TABLE Поставщик(
-- 	код int PRIMARY KEY,
-- 	название varchar(100) NOT NULL,
-- 	рейтинг float NOT NULL
-- );

-- CREATE TABLE ТоварПоставщика(
-- 	код int PRIMARY KEY,
-- 	артикул_товара varchar(100) NOT NULL REFERENCES Товар(артикул),
-- 	код_поставщика int NOT NULL REFERENCES Поставщик(код)
-- );

-- CREATE TABLE Заказ(
-- 	код int PRIMARY KEY,
-- 	код_заказчика int NOT NULL REFERENCES Заказчик(код),
-- 	код_товара_поставщика int NOT NULL REFERENCES ТоварПоставщика(код),
-- 	дата_заказа date NOT NULL,
-- 	дата_доставки date NOT NULL,
-- 	отзыв text
-- );

-- INSERT INTO Категория(код, название)
-- VALUES(1, 'продукты'),(2, 'техника')
-- INSERT INTO Товар(артикул, код_категории, название, себестоимость)
-- VALUES
-- ('qwerty123', 1, 'молока домик в деревне', 30),
-- ('asdfgh123', 2, 'телевизорв samsung', 3000)
-- INSERT INTO ФотоТовара(код, артикул_товара, адрес)
-- VALUES(1, 'qwerty123', 'https://www.productphoto.ru/6542163'),
-- (2, 'qwerty123', 'https://www.productphoto.ru/87648796')
-- INSERT INTO Поставщик(код, название, рейтинг)
-- VALUES(1, 'ИП Ивано Иван Иванович', 4.8)
-- INSERT INTO ТоварПоставщика(код, артикул_товара, код_поставщика)
-- VALUES(1, 'qwerty123', 1), (2, 'asdfgh123', 1)
-- INSERT INTO Заказчик(код, фио, телефон, адрес)
-- VALUES(1, 'Петров Петр', '89564738292', 'Коммунарка аврьпаровыа')
-- INSERT INTO Заказ(код, код_заказчика, код_товара_поставщика, дата_заказа, дата_доставки, отзыв)
-- VALUES(1, 1, 1, '2024-10-13', '2024-10-13', 'молоко бомба')
