import guitarras.*

class Musico {
	var grupo
	var habilidad
	var albumesEditados
	var tipoMusico
	var tipoDeCobro

	constructor(_grupo, _habilidad, _albumes, _tipoMusico, _tipoCobro) {
		grupo = _grupo habilidad = _habilidad albumesEditados = _albumes tipoMusico
		= _tipoMusico tipoDeCobro = _tipoCobro
	}

	method habilidad() = habilidad
	
	method habilidad(_habilidad) {
		habilidad = _habilidad
	}
	
	method tipoMusico(_tipoMusico) {
		tipoMusico = _tipoMusico
	}
	
	method tipoCobro(_tipoCobro) {
		tipoDeCobro = _tipoCobro
	}
	method tipoCobro() = tipoDeCobro
	
	method albumesEditados(_albumes) {
		albumesEditados = _albumes
	}
	
	method albumesEditados() = albumesEditados
	
	method grupo(_grupo) {
		grupo = _grupo
	}	
	method grupo() = grupo
	
	method tipoMusico() = tipoMusico
	
	method esMinimalista() {
		return self.albumesEditados().all({ album => album.lasCancionesSonCortas() })
	}
	
	method cancionesConTalPalabra(palabra) {
		return self.albumesEditados().flatMap({ album =>
		album.cancionesConTalPalabra(palabra) })
	}
	
	method duracionDeLaObra() {
		return self.albumesEditados().sum({ album => album.duracionDelAlbum()
		})
	}
	
	method laPego() {
		return self.albumesEditados().all({ album => album.vendioBien() })
	}
	
	method tocaBienUnaCancion(cancion) {
		return self.habilidad() > 60 || self.cancionEsDeSuAutoria(cancion) || self.tipoMusico().tocaBienUnaCancion(cancion)
	}
	
	method cualesTocaBien(canciones) {
		return canciones.filter{ cancion => self.tocaBienUnaCancion(cancion) }
	}
	
	method cuantoCobra(presentacion) {
		return self.tipoCobro().cuantoCobra(presentacion)
	}

	method cancionEsDeSuAutoria(cancion) {
		return self.albumesEditados().any({ album => album.contieneCancion(cancion)
		})
	}
}

class Palabrero {
	var palabra

	constructor(_palabra) {
		palabra = _palabra
	}

	method palabra() = palabra

	method tocaBienUnaCancion(cancion) {
		return cancion.contienePalabra(self.palabra())
	}
}
class Larguero {
	var duracion

	constructor(_duracion) {
		duracion = _duracion
	}

	method duracion(_duracion) {
		duracion = _duracion
	}
	method duracion() = duracion

	method tocaBienUnaCancion(cancion) {
		return cancion.duracion() > self.duracion()
	}
}
object imparero {
	method tocaBienUnaCancion(cancion) {
		return cancion.duracion().odd()
	}
}

class BasadoEnParticipantes {
	var montoIndividual

	constructor(_monto) {
		montoIndividual = _monto
	}

	method montoIndividual(monto) {
		montoIndividual = monto
	}
	method montoIndividual() = montoIndividual

	method cuantoCobra(presentacion) {
		if (presentacion.esIndividual()) {
			return self.montoIndividual()
		} else {
			return self.montoIndividual() / 2
		}
	}
}
class BasadoEnCapacidad {
	var monto
	var capacidadParametro

	constructor(_monto, _capacidad) {
		monto = _monto capacidadParametro = _capacidad
	}
	
	method monto() = monto
	method capacidadParametro() = capacidadParametro

	method cuantoCobra(presentacion) {
		if (presentacion.capacidadDelLocal() > self.capacidadParametro()) {
			return self.monto()
		} else {
			return self.monto() - 100
		}
	}
}
class BasadoEnInflacion {
	var montoBase
	var porcentajeAumento
	var fecha

	constructor(monto, porcentaje, _fecha) {
		montoBase = monto porcentajeAumento = porcentaje fecha = _fecha
	}

	method montoBase() = montoBase
	method porcentajeAumento() = porcentajeAumento

	method cuantoCobra(presentacion) {
		if (presentacion.fecha() > fecha) {
			return self.montoBase() * self.porcentajeAumento()
		} else {
			return self.montoBase()
		}
	}
}

class MusicoDeGrupo inherits Musico {
	var plusPorIntegrarGrupo

	constructor(_grupo, _habilidad, _albumes, _plus, _tipoDeMusico, _tipoDeCobro) = super ( _grupo ,
	_habilidad , _albumes, _tipoDeMusico, _tipoDeCobro) {
		plusPorIntegrarGrupo = _plus
	}
	
	method plusPorIntegrarGrupo() = plusPorIntegrarGrupo

	override method habilidad() {
		if (self.grupo()) return habilidad + self.plusPorIntegrarGrupo()
		else return habilidad
	}
}

class MusicoPopular inherits Musico {
	constructor(_grupo, _habilidad, _albumes, _tipoDeMusico, _tipoDeCobro) = super ( _grupo ,
	_habilidad , _albumes, _tipoDeMusico, _tipoDeCobro)

}

object lucia inherits MusicoPopular ( true , 70 , #{ }, new Palabrero("familia"), new BasadoEnCapacidad(400, 500) ) {
	override method habilidad() {
		if (self.grupo()) return ( habilidad - 20 )
		else return habilidad
	}
}
object luisAlberto inherits Musico ( false , 0 , #{ }, null, new BasadoEnInflacion(1000, 1.2, new Date(1, 10, 2017)) ) {
	var guitarra = fender

	method guitarra(_guitarra) {
		guitarra = _guitarra
	}
	
	method guitarra() = guitarra
	override method habilidad() {
		return 100.min(8 * self.guitarra().valor())
	}

	override method tocaBienUnaCancion(cancion) {
		return true
	}
}