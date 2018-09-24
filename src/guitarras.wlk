
object fender {
	const valor = 10

	method valor() = valor
}

object gibson {
	var estaSana = true

	method valor() {
		if (estaSana) return 15
		else return 5
	}

	method tratarMal() {
		estaSana = false
	}
	method arreglar() {
		estaSana = true
	}
}