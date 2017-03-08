DROP TABLE Casting CASCADE ;
DROP TABLE Reservation CASCADE;
DROP TABLE Seance CASCADE;
DROP TABLE Salle CASCADE;
DROP TABLE Cinema CASCADEa;
DROP TABLE Film CASCADE;
DROP TABLE Client CASCADE;
DROP TABLE Acteur CASCADE;
DROP TABLE Realisateur CASCADE;

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
idFilm INTEGER REFERENCES Film ON DELETE CASCADE,
role VARCHAR2(40),
idAct INTEGER,
PRIMARY KEY(idFilm,role)
);

CREATE TABLE Seance
(
idSeance INTEGER PRIMARY KEY ON DELETE CASCADE,
idCine INTEGER REFERENCES Cinema ON DELETE CASCADE,
idFilm INTEGER REFERENCES Film ON DELETE CASCADE,
dateProjection DATE,
numSalle INTEGER,
diffusionEn3D INTEGER check (diffusionEn3D = 0 or diffusionEn3D = 1)
);

CREATE TABLE Reservation
(
idClient INTEGER REFERENCES Client ON DELETE CASCADE,
idSeance INTEGER REFERENCES Seance ON DELETE CASCADE,
numReservation INTEGER,
nbPlaceHandicapeRes INTEGER,
nbPlaceStandardRes INTEGER,
nbPlaceDboxRes INTEGER,
PRIMARY KEY(idClient,numReservation)
);

CREATE TABLE Salle
(
idCine INTEGER REFERENCES Cinema ON DELETE CASCADE,
numSalle INTEGER,
salleCompatible3D INTEGER check (salleCompatible3D = 0 or salleCompatible3D = 1),
nbPlaceHandicape INTEGER,
nbPlaceStandard INTEGER,
nbPlaceDbox INTEGER,
PRIMARY KEY(idCine,numSalle)
);
