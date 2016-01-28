package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.Duracion

class DuracionController {

    def index() {
        render (Duracion.list() as JSON)
    }
}
