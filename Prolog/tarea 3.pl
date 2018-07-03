%pirata(nombre, litrosDeRon).
%soldado(nombre, armada).
%criatura(nombre, cantidadDeAñosSinPisarTierra).
 
barco(perlaNegra, pirata(jackSparrow, 1000)).
barco(holandesErrante, criatura(davyJones,80)).
 
tripulante(perlaNegra, pirata(jackSparrow, 999999999)).
tripulante(perlaNegra, pirata(willTurner, 88)).
tripulante(perlaNegra, pirata(elizabethSwann, 66)).
tripulante(holandesErrante,  criatura(davyJones,80)).
tripulante(holandesErrante, soldado(jamesNorrington, marinaRealBritanica)).
tripulante(holandesErrante, pirata(barbossa, 65)).

puedeRobar(Pirata,Barco) :-
	tripulante(_, pirata(Pirata,RonDelPirata)),
	barco(Barco, pirata(Capitan,RonDelCapitan)),
	Pirata \= Capitan,
	RonDelPirata > RonDelCapitan.

puedeRobar(Pirata,Barco) :-
	barco(Barco, soldado(_,_)).

puedeRobar(Pirata,Barco) :-
	barco(Barco, criatura(Criatura,_)),
	Criatura \= davyJones.

esBarcoDePiratas(Barco) :- forall(tripulante(Barco, pirata(_,_)),barco(Barco, pirata(_,_))).