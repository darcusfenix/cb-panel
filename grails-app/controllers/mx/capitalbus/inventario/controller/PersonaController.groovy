package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.Persona
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])

class PersonaController {

    def index() {
        render(Persona.list() as JSON)
    }
}
