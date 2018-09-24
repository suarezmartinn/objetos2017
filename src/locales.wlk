
object lunaPark {
	const capacidad = 9290

	method capacidad(fecha) {
		return capacidad
	}
}

object laTrastienda {
	const capacidad = 400

	method capacidad(fecha) {
		return capacidad + self.capacidadPrimerPisoSegunFecha(fecha)
	}

	method capacidadPrimerPisoSegunFecha(fecha) {
		if (fecha.dayOfWeek() == 6) return 300
		else return 0
	}
}

object prixDami {
	const capacidad = 150
	
	method capacidad(fecha) {
		return capacidad
	}
}

object laCueva {
	const capacidad = 14000
	
	method capacidad(fecha) {
		return capacidad
	}
}