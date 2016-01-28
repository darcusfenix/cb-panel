package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.Persona

class PersonaController {

    def index() {
        render (Persona.list() as JSON)
    }
}
