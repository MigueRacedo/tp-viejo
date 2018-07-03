mago(harry, mestiza, [coraje, amistad, orgullo, inteligencia]).
mago(ron, pura, [amistad, diversion, coraje]).
mago(hermione, impura, [inteligencia, coraje, responsabilidad, amistad, orgullo]).
mago(hannahAbbott, mestiza, [amistad, diversion]).
mago(draco, pura, [inteligencia, orgullo]).
mago(lunaLovegood, mestiza, [inteligencia, responsabilidad, amistad, coraje]).

odia(harry,slytherin).
odia(draco,hufflepuff).

casa(gryffindor).
casa(hufflepuff).
casa(ravenclaw).
casa(slytherin).

caracteriza(gryffindor,amistad).
caracteriza(gryffindor,coraje).
caracteriza(slytherin,orgullo).
caracteriza(slytherin,inteligencia).
caracteriza(ravenclaw,inteligencia).
caracteriza(ravenclaw,responsabilidad).
caracteriza(hufflepuff,amistad).
caracteriza(hufflepuff,diversion).


% permiteEntrar/2:

permiteEntrar(Casa,Mago) :-
	mago(Mago,_,_),
	casa(Casa),
	Casa \= slytherin.

permiteEntrar(slytherin,Mago) :-
	not(tieneSagreSucia(Mago)).

tieneSagreSucia(Mago) :-
	mago(Mago,Sangre,_),
	Sangre \= pura.


% tieneCaracter/2:

tieneCaracter(Mago, Casa) :-
	mago(Mago,_,Caracteristicas),
	casa(Casa),
	forall(caracteriza(Casa,Caracteristica),member(Caracteristica, Caracteristicas)).


% casaPosible/2: 

casaPosible(Mago, Casa) :-
	tieneCaracter(Mago, Casa),
	permiteEntrar(Casa, Mago).

casaPosible(Mago, Casa) :-
	odia(Mago, UnaCasa),
	UnaCasa \= Casa,
	casaPosible(Mago, Casa).


% cadenaDeAmistades/1: cadenaDeAmistades([mago(Mago,_,Caracteristicas)]) :- mago(Mago,_,_), member(amistad, Caracteristicas).


lugarProhibido(bosque,50).
lugarProhibido(seccionRestringida,10).
lugarProhibido(tercerPiso,75).

alumnoFavorito(flitwick, hermione).
alumnoFavorito(snape, draco).

alumnoOdiado(snape, harry).

hizo(ron, buenaAccion(jugarAlAjedrez, 50)).
hizo(harry, fueraDeCama).
hizo(hermione, irA(tercerPiso)).
hizo(hermione, responder(“Donde se encuentra un Bezoar”, 15, snape)).
hizo(hermione, responder(“Wingardium Leviosa”, 25, flitwick)).
hizo(ron, irA(bosque)).
hizo(draco, irA(mazmorras)).

esDe(harry, gryffindor).
esDe(ron, gryffindor).
esDe(hermione, gryffindor).
esDe(draco, slytherin).


% esBuenAlumno/1:

esBuenAlumno(Mago) :-
	hizo(Mago,_),
	forall(hizo(Mago,Accion), not(restaPuntos(Accion))).

restaPuntos(irA(tercerPiso)).
restaPuntos(irA(bosque)).
restaPuntos(irA(seccionRestringida)).
restaPuntos(fueraDeCama).

% puntosDeCasa/2:

puntosDeCasa(Casa, PuntosTotales) :- 
	casa(Casa),
	findall(PuntosDeMagosTotales, puntosDeMago(Mago,PuntosDeMagosTotales), Totales),
	sumlist(Totales, PuntosFinales),
	PuntosTotales is PuntosFinales.

puntosDeMago(Mago, PuntosDeMagosTotales) :-
	hizo(Mago,_),
	findall(Puntos, )

% casaGanadora/1:

casaGanadora(Casa) :-
	casa(Casa),
	puntosDeCasa(Casa, PuntosTotales),
	forall(puntosDeCasa(_, OtroPuntaje), PuntosTotales >= OtroPuntaje).