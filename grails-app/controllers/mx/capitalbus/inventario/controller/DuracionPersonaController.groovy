package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.DuracionPersona
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_VENDEDOR'])

class DuracionPersonaController {

    def index() {
        render(DuracionPersona.list() as JSON)
    }
}
