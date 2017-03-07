DROP SEQUENCE films_seq;
CREATE SEQUENCE films_seq start with 0 increment by 1 minvalue 0;
--CREATE SEQUENCE films_seq start with 1 increment by 1;

INSERT INTO Film Values (films_seq.nextval, 'xXx: Reactivated', to_date('19/01/2017', 'DD/MM/YYYY'), 'Tout public', 110, 1, 1);
INSERT INTO Film Values (films_seq.nextval, 'Assassin''s Creeds', to_date('21/12/2016', 'DD/MM/YYYY'), -12, 140, 2, 1);
INSERT INTO Film Values (films_seq.nextval, 'Lalaland', to_date('25/01/2017', 'DD/MM/YYYY'), 'Tout public', 125, 3, 0);

DROP SEQUENCE cine_seq;
CREATE SEQUENCE cine_seq start with 0 increment by 1 minvalue 0;
--CREATE SEQUENCE cine_seq start with 1 increment by 1;

INSERT INTO Cinema Values (cine_seq.nextval, 'St-Herblain', 'Place Jean-Bart', 'UGC', 10);
INSERT INTO Cinema Values (cine_seq.nextval, 'St-Herblain', 'Allée la Perouse', 'Pathe Gaumont', 12);
INSERT INTO Cinema Values (cine_seq.nextval, 'Nantes', '12 Place du Commerce', 'Pathe Gaumont', 8);
INSERT INTO Cinema Values (cine_seq.nextval, 'Angers', '1ère Avenue des Droits de l''Homme', 'Pathe Gaumont', 5);

DROP SEQUENCE real_seq;
CREATE SEQUENCE real_seq start with 0 increment by 1 minvalue 0;
--CREATE SEQUENCE real_seq start with 1 increment by 1;

INSERT INTO Realisateur Values (real_seq.nextval, 'Caruso', 'Daniel John');
INSERT INTO Realisateur Values (real_seq.nextval, 'Kurzel', 'Justin');
INSERT INTO Realisateur Values (real_seq.nextval, 'Chazelle', 'Damien');

DROP SEQUENCE clients_seq;
CREATE SEQUENCE clients_seq start with 0 increment by 1 minvalue 0;
--CREATE SEQUENCE clients_seq start with 1 increment by 1;

INSERT INTO Client Values (clients_seq.nextval, 'Martin', 'herve');
INSERT INTO Client Values (clients_seq.nextval, 'Dupont', 'Marc');
INSERT INTO Client Values (clients_seq.nextval, 'Dubois', 'Jeremie');
INSERT INTO Client Values (clients_seq.nextval, 'Morgan', 'philippe');
INSERT INTO Client Values (clients_seq.nextval, 'David', 'jean');

DROP SEQUENCE acteur_seq;
CREATE SEQUENCE acteur_seq start with 0 increment by 1 minvalue 0;
--CREATE SEQUENCE acteur_seq start with 1 increment by 1;

INSERT INTO Acteur Values (acteur_seq.nextval, 'diesel', 'vin');
INSERT INTO Acteur Values (acteur_seq.nextval, 'yan', 'donnie');
INSERT INTO Acteur Values (acteur_seq.nextval, 'padukone', 'deepika');
INSERT INTO Acteur Values (acteur_seq.nextval, 'wu', 'kris');
INSERT INTO Acteur Values (acteur_seq.nextval, 'rose', 'ruby ');
INSERT INTO Acteur Values (acteur_seq.nextval, 'McCann', 'rory ');
INSERT INTO Acteur Values (acteur_seq.nextval, 'fassbender', 'michael');
INSERT INTO Acteur Values (acteur_seq.nextval, 'cotillard', 'marion');
INSERT INTO Acteur Values (acteur_seq.nextval, 'irons', 'jeremy');
INSERT INTO Acteur Values (acteur_seq.nextval, 'gleeson', 'brendan');
INSERT INTO Acteur Values (acteur_seq.nextval, 'rampling', 'charlotte');
INSERT INTO Acteur Values (acteur_seq.nextval, 'labed', 'Ariane');
INSERT INTO Acteur Values (acteur_seq.nextval, 'gosling', 'ryan');
INSERT INTO Acteur Values (acteur_seq.nextval, 'stone', 'emma');
INSERT INTO Acteur Values (acteur_seq.nextval, 'legend', 'john');
INSERT INTO Acteur Values (acteur_seq.nextval, 'DeWitt', 'Rosemarie');
INSERT INTO Acteur Values (acteur_seq.nextval, 'Wittrock', 'Finn');
INSERT INTO Acteur Values (acteur_seq.nextval, 'Simmons', 'J.K');

INSERT INTO Casting Values (1, 'adele wofl', 5);
INSERT INTO Casting Values (1, 'nicks', 4);
INSERT INTO Casting Values (1, 'serena unger', 3);
INSERT INTO Casting Values (1, 'tennyson torch', 6);
INSERT INTO Casting Values (1, 'xander cage', 1);
INSERT INTO Casting Values (1, 'xiang', 2);
INSERT INTO Casting Values (2, 'aguilar de nerha', 7);
INSERT INTO Casting Values (2, 'cal lynch', 7);
INSERT INTO Casting Values (2, 'Ellen Kaye', 11);
INSERT INTO Casting Values (2, 'joseph lynch', 10);
INSERT INTO Casting Values (2, 'Maria', 12);
INSERT INTO Casting Values (2, 'rikkin', 9);
INSERT INTO Casting Values (2, 'sofia', 8);
INSERT INTO Casting Values (3, 'Bill', 18);
INSERT INTO Casting Values (3, 'Greg', 17);
INSERT INTO Casting Values (3, 'Keith', 15);
INSERT INTO Casting Values (3, 'Laura', 16);
INSERT INTO Casting Values (3, 'Mia', 14);
INSERT INTO Casting Values (3, 'Sebastian', 13);

DROP SEQUENCE seance_seq;
CREATE SEQUENCE seance_seq start with 0 increment by 1 minvalue 0;
--CREATE SEQUENCE seance_seq start with 1 increment by 1;

INSERT INTO Seance Values (seance_seq.nextval, 1, 1, to_date('24/01/2017 20:00', 'DD/MM/YYYY HH24:MI'), 7, 1);
INSERT INTO Seance Values (seance_seq.nextval, 2, 1, to_date('27/04/2017 16:30', 'DD/MM/YYYY HH24:MI'), 11, 0);
INSERT INTO Seance Values (seance_seq.nextval, 3, 2, to_date('10/05/2017 11:00', 'DD/MM/YYYY HH24:MI'), 1, 0);
INSERT INTO Seance Values (seance_seq.nextval, 4, 3, to_date('10/01/2017 22:00', 'DD/MM/YYYY HH24:MI'), 3, 0);

INSERT INTO Reservation Values (1, 1, 4, 0, 2, 0);
INSERT INTO Reservation Values (2, 1, 8, 1, 2, 0);
INSERT INTO Reservation Values (3, 2, 15, 0, 2, 2);
INSERT INTO Reservation Values (4, 3, 16, 0, 1, 2);
INSERT INTO Reservation Values (5, 4, 23, 0, 0, 2);

INSERT INTO Salle Values (1, 7, 1, 3, 100, 0);
INSERT INTO Salle Values (2, 11, 1, 5, 255, 10);
INSERT INTO Salle Values (3, 1, 0, 10, 345, 10);
INSERT INTO Salle Values (4, 3, 0, 3, 75, 3);
