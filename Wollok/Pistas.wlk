object mainRoom {
	
	var personasBailando = {}
	
	method entrarAlMainRoom(unaPersona){
		personasBailando.add(unaPersona)	
	}
	
	method todosBailen(){
		personasBailando.map({persona => persona.modificarEnergia(-40)})
		personasBailando.map({persona => persona.modificarDiversion(30)})	
	}
	
	method cuantosEstanBailando(){
		return personasBailando.size()
	}
}

object panoramaBar {
	
	var personasBailando = {}
	
	method entrarAlPanoramaBar(unaPersona){
		personasBailando.add(unaPersona)
	}
	
	method todosBailen(){
		
	}
	
	method dixon(unaPersona){
		unaPersona.modificarEnergia(-60)
		unaPersona.modificarDiversion(+120)
	}
	
	method marcelDettmann(unaPersona){
		unaPersona.modificarEnergia(-unaPersona.energia())
		unaPersona.modificarDiversion(+1000)
	}
	
	method tommyMunioz(unaPersona){
		unaPersona.modificarEnergia(-80)
		unaPersona.modificarDiversion(-unaPersona.energia())
	}
	
	method cuantosEstanBailando(){
		return personasBailando.size()
	}
}

object darkRoom {
	
	var personasBailando = {}
	
	method entrarAlDarkRoom(unaPersona){
		personasBailando.add(unaPersona)
	}
	
	method todosBailen(){
		
	}
	
	method cuantosEstanBailando(){
		return personasBailando.size()
	}
}