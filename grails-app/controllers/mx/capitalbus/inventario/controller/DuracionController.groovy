package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.Duracion
import grails.plugin.springsecurity.annotation.Secured


@Secured(['permitAll'])

class DuracionController {

    def index() {
        render(Duracion.list() as JSON)
    }
}
