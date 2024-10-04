import wollok.game.*
import posiciones.*


object hector {
	var property position = game.at(3,3)
	const property image = "player.png"
	const property cultivos = [] 
	var property cosechadas = []
	var property oro = 0 

method sembrar(cultivo) {

	self.validarPlantacion()
	game.addVisual(cultivo)
	self.agregarCultivo(cultivo)
	

}
method regar(cultivo) {
	self.validarRegado()
	cultivo.esRegada()
	
}
method validarRegado() {

	if (not self.hayCultivoAca()){
			self.error("No tengo nada para regar")
			}
}

method cosechar(cultivo) {
	self.validarCosecha()
	cultivo.esCosechada()
	self.agregarCosecha(cultivo)
	self.sacarCultivo(cultivo)

}
method vender() {
	oro += cosechadas.sum({cultivo=>cultivo.precio()})
	cosechadas.clear()
}
method agregarCosecha(cultivo) {
	cosechadas.add(cultivo) 
}
method sacarCultivo(cultivo) {
	cultivos.remove(cultivo)
}
method validarCosecha() {
	if (not self.hayCultivoAca()){
			self.error("No tengo nada para cosechar")
			}
}

method hayCultivoAca() {
	return  cultivos.any({cultivo => cultivo.position() == self.position()})
	
}
method cultivoAca() {
	return cultivos.find({cultivo=>cultivo.position() == self.position()})
}
method agregarCultivo(cultivo) {
	cultivos.add(cultivo)
}

method validarPlantacion() {
	
	return 	if (self.hayCultivoAca()){
		self.error("no puedo plantar")}
		
		
}

method mover(direccion) {
		self.validarMover(direccion)
		self.desplazar(direccion)
	}
method validarMover(direccion) {
		
		const siguiente = direccion.siguiente(self.position())
		tablero.validarDentro(siguiente)
		
	}
method desplazar(direccion) {
		self.validarMover(direccion)
		position = direccion.siguiente(self.position())
		
	}
	method oroYPlantas() {
		game.say(self, "tengo" + oro + "monedas, y " + cosechadas.size() + "plantas para vender")
	}
}





