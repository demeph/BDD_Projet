DROP TABLE Casting;
DROP TABLE Reservation;
DROP TABLE Seance;
DROP TABLE Salle;
DROP TABLE Cinema;
DROP TABLE Film;
DROP TABLE Client;
DROP TABLE Acteur;
DROP TABLE Realisateur;

CREATE TABLE Film
(
idFilm INTEGER PRIMARY KEY,
nomFilm VARCHAR2(40),
dateSortie DATE,
publicFilm VARCHAR2(20),
duree INTEGER,
idReal INTEGER,
filmCompatible3D INTEGER check( filmCompatible3D = 0 or filmCompatible3D = 1)
);

CREATE TABLE Cinema
(
idCine INTEGER PRIMARY KEY,
ville VARCHAR2(50),
adresse VARCHAR2(50),
franchise VARCHAR2(20),
nbSalle INTEGER
);

CREATE TABLE Realisateur
(
idReal INTEGER PRIMARY KEY,
nomR VARCHAR2(20),
prenomR VARCHAR2(20)
);

CREATE TABLE Client
(
idClient INTEGER PRIMARY KEY,
nomC VARCHAR2(20),
prenomC VARCHAR2(20)
);

CREATE TABLE Acteur
(
idAct INTEGER PRIMARY KEY,
nomA VARCHAR2(20),
prenomA VARCHAR2(20)
);



CREATE TABLE Casting
(
idFilm INTEGER REFERENCES Film,
role VARCHAR2(40),
idAct INTEGER,
PRIMARY KEY(idFilm,role)
);

CREATE TABLE Seance
(
idSeance INTEGER PRIMARY KEY,
idCine INTEGER REFERENCES Cinema,
idFilm INTEGER REFERENCES Film,
dateProjection DATE,
numSalle INTEGER,
diffusionEn3D INTEGER check (diffusionEn3D = 0 or diffusionEn3D = 1)
);


CREATE TABLE Reservation
(
idClient INTEGER REFERENCES Client,
idSeance INTEGER REFERENCES Seance,
numReservation INTEGER,
nbPlaceHandicapeRes INTEGER,
nbPlaceStandardRes INTEGER,
nbPlaceDboxRes INTEGER,
PRIMARY KEY(idClient,numReservation)
);

CREATE TABLE Salle
(
idCine INTEGER REFERENCES Cinema,
numSalle INTEGER,
salleCompatible3D INTEGER check (salleCompatible3D = 0 or salleCompatible3D = 1),
nbPlaceHandicape INTEGER,
nbPlaceStandard INTEGER,
nbPlaceDbox INTEGER,
PRIMARY KEY(idCine,numSalle)
);
