import hector.*
import wollok.game.*
import posiciones.*


class Maiz {
	var property plantado =  hector.position()
	var property position = plantado
	var property bebe = true 
	var property precio = 150 

	
	
	method image() {
	
		return if (bebe){
			"corn_baby.png"
			}else {
				"corn_adult.png"
			}	
	}

	method esRegada() {
		bebe = false 
	}
	method esCosechada() {
		self.validarCosecha()
		game.removeVisual(self)
	} 
	method validarCosecha(){
		if (bebe){
			self.error("no puedo ser cosechada")
		}
	}


}
class Trigo {
	var property plantado =  hector.position()
	var property  position = plantado
	var property evolucion = 0 
	var property precio = 100 

	method image() {
		
		return "wheat_" + evolucion + ".png"
	}

	method esRegada() {
		if (evolucion < 3){
			evolucion += 1
		} else 
			evolucion = 0		
}
	method esCosechada() {
		self.validarCosecha()
		game.removeVisual(self)
		
	} 
	method validarCosecha(){
		if (evolucion < 1){
			self.error("No puedo ser cosechada")
		}
	}

}
class Tomaco {
	var property plantado =  hector.position()
	var property  position = plantado
	var property precio = 80 
	
	
	method image() {
		return "tomaco.png"
	}
	method esRegada() {
		position = game.at(position.x(),(game.height()-1).min (position.y()+1))

	}
	
	method esCosechada() {
		game.removeVisual(self)
		
	} 

		

}