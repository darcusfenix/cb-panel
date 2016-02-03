package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.Duracion
import grails.plugin.springsecurity.annotation.Secured


@Secured(['ROLE_ADMIN', 'ROLE_VENDEDOR'])

class DuracionController {

    def index() {
        render(Duracion.list() as JSON)
    }
}
