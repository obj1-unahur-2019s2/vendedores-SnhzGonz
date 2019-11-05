import vendedores.*
import ciudades.*

class CentrosDeDistribucion {
	var property ciudad
	var property vendedores = []
	
	method agregarVendedor(vendedor){
		if(not vendedores.contains(vendedor)){
			vendedores.add(vendedor)
		}
		else {
			self.error("ya pertenece")
		}
	}
	method quitarVendedor(vendedor){vendedores.remove(vendedor)}
	
	method vendedorEstrella(){return vendedores.max({v => v.cantidadDePuntos()})}
	method puedeCubrir(ciudadDada){return vendedores.any({v => v.puedeTrabajar(ciudadDada)})}
	method vendedoresGenericos(){return vendedores.filter({v => not v.vendedorVersatil()})}
	method esRobusto(){return vendedores.count({v => v.vendedorFirme()}) > 3}
	
	method repartirCertificacion(certificacion){
		vendedores.forEach({v => v.certificaciones().add(certificacion)})
	}
	
	
}
