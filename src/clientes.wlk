import vendedores.*

class ClienteInseguro {
	method puedeSerAtentido(vendedor){return vendedor.vendedorVersatil() and vendedor.vendedorFirme()}
}

class ClienteDetallista {
	method puedeSerAtentido(vendedor){return vendedor.certificaciones().count{c => c.esSobreProductos()} > 3}
}

class ClienteHumanista {
	method puedeSerAtentido(vendedor){return vendedor.personaFisica()}
}