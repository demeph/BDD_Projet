drop role lesclients;
create role lesclients;

grant select on Film to lesclients;
grant select on Seance to lesclients;
grant select on Cinema to lesclients;
grant select on Casting to lesclients;
grant select on Realisateur to lesclients;
grant select on Acteur to lesclients;

drop role lesguichetiers;
create role lesguichetiers;

grant select,insert,update,delete on Reservation to lesguichetiers;
grant select,insert,update on Client to lesguichetiers;
grant select on Seance to lesguichetiers;

drop role lesgerantsFilm;
create role lesgerantsFilm;

grant select on Film to lesgerantsFilm;
grant select on Salle to lesgerantsFilm;
grant select,insert,update,delete on Seance to lesgerantsFilm;
