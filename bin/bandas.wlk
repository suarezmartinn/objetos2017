
class Banda {

	var musicos
	var nombre
	var representante
	
	constructor(_musicos, _nombre, _representante) {
		musicos = _musicos
		musicos.map{ musico => musico.grupo(_nombre)}
		nombre = _nombre
		representante = _representante
	}
	
	method habilidad() {
		return self.musicos().sum{ musico => musico.habilidad() } * 1.1
	}
	method musicos() = musicos
	method representante() = representante
	
	method cuantoCobra(presentacion) {
		return ( self.musicos().sum{ musico => musico.cuantoCobra(presentacion) } )
		+ self.representante().cuantoCobra()
	}
	
	method tocaBienUnaCancion(cancion) {
		return self.musicos().all{ musico => musico.tocaBienUnaCancion(cancion) }
	}
}