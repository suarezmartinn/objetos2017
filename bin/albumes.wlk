
class Album {
	const nombre
	const canciones
	const fechaDeLanzamiento
	const unidadesPublicadas
	const unidadesVendidas

	constructor(_nombre, _canciones, _fechaDeLanzamiento, _unidadesPublicadas, _unidadesVendidas) {
		nombre = _nombre canciones = _canciones fechaDeLanzamiento =
		_fechaDeLanzamiento unidadesPublicadas = _unidadesPublicadas
		unidadesVendidas = _unidadesVendidas
	}
	
	method canciones() = canciones
	method unidadesVendidas() = unidadesVendidas
	method unidadesPublicadas() = unidadesPublicadas

	method lasCancionesSonCortas() {
		return self.canciones().all({ cancion => cancion.esCorta() })
	}
	method cancionesConTalPalabra(palabra) {
		return self.canciones().filter{ cancion => cancion.contienePalabra(palabra) }
	}
	method duracionDelAlbum() {
		return self.canciones().sum{ cancion => cancion.duracion() }
	}
	method vendioBien() {
		return self.unidadesVendidas() * 100 / self.unidadesPublicadas() > 75
	}
	method contieneCancion(cancion) {
		return self.canciones().contains(cancion)
	}
	method compararCanciones(criterio) {
		return criterio.comparar(self.canciones())
	}
}