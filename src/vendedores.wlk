import ciudades.*
import centrosDeDistribucion.*

class Vendedores{
	var property certificaciones = #{}
	const property cantidadDePuntos = certificaciones.sum{c => c.cantidadDePuntos()}
	
	method puedeTrabajar(cuidad)
	method vendedorVersatil(){return certificaciones.size() > 3 and 
									 certificaciones.any({c => c.esSobreProductos()}) and 
									 certificaciones.any{c => not c.esSobreProductos()}
	}
	method vendedorFirme(){return cantidadDePuntos > 30}
	method vendedorInfluyente()
	method tieneAfinidad(centroDeDistri){return self.puedeTrabajar(centroDeDistri.ciudad())}
	method vendedorCandidato(centroDeDistri){return self.vendedorVersatil() and self.tieneAfinidad(centroDeDistri)}
}

class VendedorFijo inherits Vendedores {
	var property cuidadDondeVive
	
	override method puedeTrabajar(cuidad){return cuidad == cuidadDondeVive}
	override method vendedorInfluyente(){return false}
	method personaFisica(){return true}
}

class Viajante inherits Vendedores {
	var property provinciasDondePuedeTrabajar = #{}

	override method puedeTrabajar(cuidad){
		return provinciasDondePuedeTrabajar.contains(cuidad.provinciaDondeEsta())
	}
	override method vendedorInfluyente(){return provinciasDondePuedeTrabajar.sum({p => p.poblacion()}) > 10000000}
	method personaFisica(){return true}
}

class ComercioCorresposal inherits Vendedores {
	var property ciudadesConSucursales = []
	
	method provinciasConSucursales(){
		return ciudadesConSucursales.map{c => c.provinciaDondeEsta()}.asSet() 
	}
	override method puedeTrabajar(cuidad){
		return ciudadesConSucursales.contains(cuidad)
	}
	override method vendedorInfluyente(){return ciudadesConSucursales.size() > 5 or
												self.provinciasConSucursales().size() > 3
	}
	override method tieneAfinidad(centroDeDistri){
		return super(centroDeDistri.ciudad()) and
			   ciudadesConSucursales.any({c => not centroDeDistri.puedeCubrir(c)})
	}
	method personaFisica(){return false}
}

class Certificaciones{
	var property cantidadDePuntos
	var property esSobreProductos 
}