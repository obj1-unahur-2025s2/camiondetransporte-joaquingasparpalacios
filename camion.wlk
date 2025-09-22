object camion {
    const carga = []

    method getCarga() = carga

    method peso() = 1000 + carga.pesoTotalCarga()

    method pesoTotalCarga() = carga.sum({a => a.peso()}) 

    method todosLosPesosPares() = carga.all({a => a.peso().even() }) // % 2 == 0

    method algunaCosaPesa(peso) = carga.any({a => a.peso() == peso})

    method primerCosaCargadaConPeligrosidad(nivelDePeligrosidad) = carga.find({a => a.peligrosidad() == nivelDePeligrosidad})
    
    method todasLasCosasConNivelDePeligrosidad(nivelDePeligrosidad) = carga.filter({a => a.peligrosidad() == nivelDePeligrosidad})

    method todasLasCosasQueSuperanElNivelDePeligrosidad(nivelDePeligrosidad) = carga.filter({a => a.peligrosidad() > nivelDePeligrosidad})

    method estaExedido() = self.peso() > 2500 //en Kilogramos

    method puedeCircular(nivelDePeligrosidad) {
        return not(self.estaExedido()) && carga.any({a => a.peligrosidad() > nivelDePeligrosidad})
        }

    method tieneAlgunaCosaEntre(valor1, valor2) {
        const salida = carga.filter({a => a.peso().between(valor1, valor2)})
    }

    method cosaMasPesadaCargada() = carga.max({a => a.peso()})

    method cargar(algo) {
      carga.add(algo)
    }

    method cargarVariasCosas(listaDeCosas) {
      carga.addAll(listaDeCosas)
    }

    method descargar(algo) {
      carga.remove(algo)
    }

    method descargarTodo() {
      carga.clear()
    }


}