package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.DuracionPersona
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])

class DuracionPersonaController {

    def index() {
        render(DuracionPersona.list() as JSON)
    }
}
