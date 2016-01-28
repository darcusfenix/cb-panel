package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.DuracionPersona

class DuracionPersonaController {

    def index() {
         render (DuracionPersona.list() as JSON)
    }
}
