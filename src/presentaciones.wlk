import locales.*
import canciones.*

class Presentacion {
	var fecha
	const lugar
	var musicos
	var tieneBanda

	constructor(_fecha, _lugar, _musicos, _tieneBanda) {
		fecha = _fecha lugar = _lugar musicos = _musicos tieneBanda = _tieneBanda
	}
	constructor(_fecha, _lugar, _musicos) {
		fecha = _fecha lugar = _lugar musicos = _musicos
	}

	method fecha() = fecha
	
	method fecha(_fecha) {
		fecha = _fecha	
	}
	
	method musicos(_musicos) {
		musicos = _musicos
	}
	method musicos() = musicos

	method lugar() = lugar

	method costoDeLaPresentacion() {
		return musicos.sum{ musico => musico.cuantoCobra(self) }
	}
	method esIndividual() {
		return musicos.size() == 1 && !tieneBanda
	}
	method esConcurrida() {
		return lugar.capacidad(fecha) > 5000
	}
	
	method magia() {
		return musicos.sum { musico => musico.habilidad()}
	}
	method capacidadDelLocal() = self.lugar().capacidad(self.fecha())
}

object pdPalooza inherits Presentacion (new Date(15, 12, 2017), lunaPark, #{ }) {
	
	const cancionAlicia =
	new Cancion(510, "Quien sabe Alicia, este pais no estuvo hecho porque si. Te vas a ir, vas a salir pero te quedas, ¿donde mas vas a ir? Y es que aqui, sabes el trabalenguas, trabalenguas, el asesino te asesina, y es mucho para ti. Se acabo ese juego que te hacia feliz.", "Cancion de Alicia en el pais")
	
	method habilidadMayorA70(musico) {
		if (musico.habilidad() >= 70) return true
		else throw new Exception("No tiene habilidad suficiente")
	}
	method compusoCanciones(musico) {
		if (musico.albumesEditados().size() > 0) return true
		else throw new Exception("No compuso canciones")
	}
	method agregarMusico(musico) {
		if (self.habilidadMayorA70(musico) && self.compusoCanciones(musico) &&
		musico.tocaBienUnaCancion(cancionAlicia)) musicos.add(musico)
	}
}