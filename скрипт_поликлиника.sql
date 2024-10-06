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

-- DROP TABLE ЛекарствоОтБолезни;
-- DROP TABLE Назначение;
-- DROP TABLE Лекарство;
-- DROP TABLE ИсторияБолезни;
-- DROP TABLE Прием;
-- DROP TABLE Врач;
-- DROP TABLE Специальность;
-- DROP TABLE Болезнь;
-- DROP TABLE Пациент;


INSERT INTO Специальность(код, название)
VALUES(1, 'терапевт');
INSERT INTO Врач(табельный_номер, фио, код_специальности, стаж, кабинет)
VALUES(1, 'Петров Петр', 1, 15, 2013), (3, 'Сидоров Олег', 1, 5, 2014);
INSERT INTO Пациент(номер_карты, фио, возраст, пол, adress)
VALUES(123, 'Абажуров Евгений', 15, 'м', 'Москва Коммунарка');
INSERT INTO Болезнь(код, название)
VALUES(1, 'ОРВИ');
INSERT INTO Прием(код, номер_карты, код_врача, симптом1, симптом2, симптом3, код_болезни, дата_осмотра, время_приема)
VALUES(1, 123, 1, 'температура', null, null, 1, '2024-09-29', '12:07');

INSERT INTO Прием(код, номер_карты, код_врача, симптом1, симптом2, симптом3, код_болезни, дата_осмотра, время_приема)
VALUES(2, 123, 1, 'насморк', null, null, 1, '2024-10-06', '10:51');
INSERT INTO Лекарство(артикул, название, цена, по_рецепту)
VALUES('hg3fy2r62354', 'Нурофен', 400.0, false);
INSERT INTO Назначение(артикул_лекарства, код_приема)
VALUES('hg3fy2r62354', 1);
INSERT INTO ИсторияБолезни(код, номер_карты, код_болезни, дата_заболевания, дата_выздоровления, описание_лечения)
VALUES(1, 123, 1, '2024-10-06', '2024-10-13', 'Принимать нурофен и всё будет хорошо');























