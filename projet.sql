DROP TABLE Casting;
DROP TABLE Acteur;
DROP TABLE Reservation;
DROP TABLE Client;
DROP TABLE Seance;
DROP TABLE Film;
DROP TABLE Realisateur;
DROP TABLE Salle;
DROP TABLE Cinema;

CREATE TABLE Casting
(
idFilm INTEGER,
role VARCHAR2(40),
idAct INTEGER,	
PRIMARY KEY (idFilm) REFERENCES Film
);

CREATE TABLE Acteur
(
idAct INTEGER,
nomA VARCHAR2(20),
prenomA VARCHAR2(20),
PRIMARY KEY (idAct)
);

CREATE TABLE Reservation
(
idClient INTEGER,
idSeance INTEGER,
numReservation INTEGER,
nbPlaceHandicapeRes INTEGER,
nbPlaceStandardRes INTEGER,
nbPlaceDboxRes INTEGER
);

CREATE TABLE Client
(
idClient INTEGER,
nomC VARCHAR2(20),
prenomC VARCHAR2(20),
PRIMARY KEY (idClient)
);

CREATE TABLE Seance
(
idSeance INTEGER,
idCine INTEGER,
idFilm INTEGER,
horaire TIME,
dateProjection DATE,
numSalle INTEGER,
diffusionEn3D BOOLEAN
);

CREATE TABLE Film
(
idFilm INTEGER,
nomFilm VARCHAR2(40),
dateSortie DATE,
public VARCHAR2(10),
duree INTEGER,
idReal INTEGER,
compatible3D BOOLEAN,
PRIMARY KEY (idFilm)
);

CREATE TABLE Realisateur
(
idReal INTEGER,
nomR VARCHAR2(20),
prenomR VARCHAR2(20),
PRIMARY KEY (idReal)
);

CREATE TABLE Salle
(
idCine INTEGER,
numSalle INTEGER,
salleCompatible3D BOOLEAN,
nbPlaceHandicape INTEGER,
nbPlaceStandard INTEGER,
nbPlaceDbox INTEGER
);

CREATE TABLE Cinema
(
idCinema INTEGER,
ville VARCHAR2(50),
adresse VARCHAR2(50),
franchise VARCHAR2(20),
nbSalle INTEGER,
PRIMARY KEY (idCinema)
);