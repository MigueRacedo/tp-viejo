jugador(michaelJordan).
jugador(taz).
jugador(lolaBunny).
jugador(bugsBunny).
jugador(patoLucas).
jugador(pound).
jugador(bang).
jugador(bupkus).
jugador(blanko).
jugador(nawt).

viveEn(michaelJordan, tierra).
viveEn(taz, looneyTunes).
viveEn(lolaBunny, looneyTunes).
viveEn(patoLucas, looneyTunes).
viveEn(bugsBunny, looneyTunes).
viveEn(pound, tontolandia).
viveEn(bang, tontolandia).
viveEn(bupkus, tontolandia).
viveEn(blanko, tontolandia).
viveEn(nawt, tontolandia).

juegaA(michaelJordan, baloncesto).
juegaA(michaelJordan, beisbol).
juegaA(michaelJordan, golf).
juegaA(charlesBarkley, baloncesto).
juegaA(patrickEwing, baloncesto).
juegaA(muggsyBogues, baloncesto).
juegaA(larryJohnson, baloncesto).
juegaA(shawnBradley, baloncesto).

equipo(tuneSquad).
equipo(monstars).

juegaEn(tuneSquad, Jugador) :- viveEn(Jugador, looneyTunes).
juegaEn(tuneSquad, Jugador) :- viveEn(Jugador, tierra), 
							juegaA(michaelJordan, baloncesto),
							juegaA(michaelJordan, beisbol),
							juegaA(michaelJordan, golf).
juegaEn(monstars, Jugador) :- not(juegaEn(tuneSquad, Jugador)), viveEn(Jugador, tontolandia).

esEquipoDelbarrio(Equipo, Lugar) :- forall(juegaEn(Equipo, Jugador), viveEn(Jugador, Lugar)).

esEquipoIntergalactico(Equipo) :- not(esEquipoDelbarrio(Equipo, _)), juegaEn(Equipo, michaelJordan).