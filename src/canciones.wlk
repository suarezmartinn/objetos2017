
class Cancion {
	var titulo
	var duracion
	var letra

	constructor(_duracion, _letra, _titulo) {
		duracion = _duracion letra = _letra titulo = _titulo
	}
	constructor(_duracion, _titulo) {
		duracion = _duracion titulo = _titulo
	}
	constructor() { }

	method duracion() = duracion
	method letra() = letra
	method titulo() = titulo

	method contienePalabra(palabra) {
		return self.letra().toLowerCase().contains(palabra.toLowerCase())
	}
	method esCorta() {
		return self.duracion() < 180
	}
}
class Mashup inherits Cancion {

	constructor(_cancionesParaMashupear) {
		letra = self.mashupearCanciones(_cancionesParaMashupear) duracion =
		self.duracionMashup(_cancionesParaMashupear) titulo = "Un Mashup"
	}

	method mashupearCanciones(canciones) {
		return canciones.fold("", { letra , cancion => letra + cancion.letra() + " "
		}).trim()
	}
	method duracionMashup(canciones) {
		return canciones.map({ cancion => cancion.duracion() }).max()
	}
}
class Remix inherits Cancion {

	constructor(_cancionParaRemixar) {
		letra = self.remixar(_cancionParaRemixar) duracion =
		self.duracionRemix(_cancionParaRemixar)
	}
	
	method remixar(cancion) = "mueve tu cuelpo baby " + cancion.letra().trim() +
	" yeah oh yeah"
	method duracionRemix(cancion) = cancion.duracion() * 3
}

class CompararPorDuracion {
	method comparar(cancionesParaComparar) {
		return cancionesParaComparar.max({ cancion => cancion.duracion() })
	}
}

class CompararPorLetra {
	method comparar(cancionesParaComparar) {
		return cancionesParaComparar.max({ cancion => cancion.letra().length() })
	}
}

class CompararPorTitulo {
	method comparar(cancionesParaComparar) {
		return cancionesParaComparar.max({ cancion => cancion.titulo().length() })
	}
}