object vonLukaz {
	
	var energia = 150
	var diversion = 70
	const edad = 17

	method indumentaria() {
		return "remeraBlanca"
	}
	
	method modificarEnergia(energy) {
		energia += energy
	}
	
	
	method modificarDiversion(fun) {
		diversion += fun
	}
	
	method entrarAlClub(unPatova){
		return unPatova.dejarPasarA(self)
	}
}

object binaker {
	
	var energia = 140
	var diversion = 80
	const edad = 22

	method indumentaria() {
		return "todoDeNegro"
	}
	
	method modificarEnergia(energy) {
		energia += energy
	}
	
	
	method modificarDiversion(fun) {
		diversion += fun
	}
	
	method entrarAlClub(unPatova){
		return unPatova.dejarPasarA(self)
	}
}

object gonzen {
	
	var energia = 90
	var diversion = 15
	const edad = 33

	method indumentaria() {
		return "remeraNegra"
	}
	
	method modificarEnergia(energy) {
		energia += energy
	}
	
	
	method modificarDiversion(fun) {
		diversion += fun
	}
	
	method entrarAlClub(unPatova){
		return unPatova.dejarPasarA(self)
	}
}