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