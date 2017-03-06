create role gerantFilm;

grant select on Seance to lesclients
grant select on Cinema to lesclients;
grant select Film to lesclients;
grant select Casting to lesclients;
grant select Realisateur to lesclients;
grant select Acteur to lesclients;

create role lesguichetiers;

grant select,insert,update,delete on Reservation to lesguichetiers;
grant select,insert,update on Clients to lesguichetiers;
grant select on Seance to lesguichetiers;

create role lesgerantsFilm;

grant select on Film to lesgerantsFilm;
grant select on salle to lesgerantsFilm;
grant select,insert,update,delete on Seance to lesgerantsFilm;
