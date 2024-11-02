CREATE TABLE Специальность(
	код int PRIMARY KEY,
	название varchar(30) NOT NULL
);
CREATE TABLE Врач(
	табельный_номер int PRIMARY KEY,
	фио varchar(50) NOT NULL,
	код_специальности int REFERENCES Специальность(код),
	стаж int,
	кабинет int
);
CREATE TABLE Пациент(
	номер_карты int PRIMARY KEY,
	фио varchar(100) NOT NULL,
	возраст float NOT NULL,
	пол char(1) NOT NULL,
	adress text
);
CREATE TABLE Болезнь(
	код int PRIMARY KEY,
	название varchar(100) NOT NULL
);
CREATE TABLE Прием(
	код int PRIMARY KEY,
	номер_карты int NOT NULL REFERENCES Пациент(номер_карты),
	код_врача int NOT NULL REFERENCES Врач(табельный_номер),
	симптом1 varchar(30) NOT NULL,
	симптом2 varchar(30),
	симптом3 varchar(30),
	код_болезни int NOT NULL REFERENCES Болезнь(код),
	дата_осмотра date NOT NULL,
	время_приема time NOT NULL
);

CREATE TABLE Лекарство(
	артикул varchar(100) PRIMARY KEY,
	название varchar(500) NOT NULL,
	цена money NOT NULL,
	по_рецепту bool NOT NULL
);

CREATE TABLE ЛекарствоОтБолезни(
	артикул_лекарства varchar(100) REFERENCES Лекарство(артикул),
	код_болезни int REFERENCES Болезнь(код),
	CONSTRAINT комб_ключ_артикул_лекарства_код_болезни PRIMARY KEY(артикул_лекарства, код_болезни)
);

CREATE TABLE Назначение(
	артикул_лекарства varchar(100) NOT NULL REFERENCES Лекарство(артикул),
	код_приема int NOT NULL REFERENCES Прием(код),
	CONSTRAINT уникальный_ключ_назначение PRIMARY KEY(артикул_лекарства, код_приема)
);

CREATE TABLE ИсторияБолезни(
	код int PRIMARY KEY,
	номер_карты int NOT NULL REFERENCES Пациент(номер_карты),
	код_болезни int NOT NULL REFERENCES Болезнь(код),
	дата_заболевания date NOT NULL,
	дата_выздоровления date NOT NULL,
	описание_лечения text
);

INSERT INTO Специальность(код, название)
VALUES(1, 'терапевт');
INSERT INTO Врач(табельный_номер, фио, код_специальности, стаж, кабинет)
VALUES(1, 'Петров Петр', 1, 15, 2013), (2, 'Васильев Василий', 1, 10, 2014), (3, 'Сидоров Олег', 1, 5, 2015);
INSERT INTO Пациент(номер_карты, фио, возраст, пол, adress)
VALUES(1, 'Абажуров Евгений', 15, 'м', 'Москва Коммунарка'), (2, 'Нереляционный Дмитрий', 20, 'м', 'Москва Коммунарка'), (3, 'Бэдэшная Анна', 25, 'ж', 'Москва Коммунарка');
INSERT INTO Болезнь(код, название)
VALUES(1, 'орви'), (2, 'грипп'), (3, 'мигрень'), (4, 'раздвоение личности');
INSERT INTO Прием(код, номер_карты, код_врача, симптом1, симптом2, симптом3, код_болезни, дата_осмотра, время_приема)
VALUES
(1, 1, 1, 'головная боль', null, null, 3, '2024-02-11', '12:00'),
(2, 1, 2, 'кашель', 'насморк','температура', 1, '2024-01-11', '11:45'),
(3, 2, 3, 'слабость', 'температура',null, 2, '2024-04-11', '09:15'),
(4, 2, 1, 'галюцинации', null ,null, 4, '2024-03-11', '14:20'),
(5, 3, 2, 'озноб', 'дрож', 'температура', 2, '2024-02-11', '19:40'),
(6, 3, 3, 'потеря памяти', 'забалтываемость', null, 4, '2024-01-11', '06:40');