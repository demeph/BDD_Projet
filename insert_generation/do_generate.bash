#! /bin/bash

./generate_inserts.bash tableau.csv Film idFilm nomFilm dateSortie publicFilm duree idReal filmCompatible3D
./generate_inserts.bash tableau.csv Cinema idCine ville adresse franchise nbSalle
./generate_inserts.bash tableau.csv Realisateur idReal nomR prenomR
./generate_inserts.bash tableau.csv Client idClient nomC prenomC
./generate_inserts.bash tableau.csv Acteur idAct nomA prenomA
./generate_inserts.bash tableau.csv Casting idFilm role idAct
./generate_inserts.bash tableau.csv Seance idSeance idCine idFilm dateProjection numSalle diffusionEn3D
./generate_inserts.bash tableau.csv Reservation idClient idSeance numReservation nbPlaceHandicapeRes nbPlaceStandardRes nbPlaceDboxRes
./generate_inserts.bash tableau.csv Salle idCine numSalle salleCompatible3D nbPlaceHandicape nbPlaceStandard nbPlaceDbox
