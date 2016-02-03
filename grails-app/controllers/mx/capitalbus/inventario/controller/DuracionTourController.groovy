package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.DuracionTour
import mx.capitalbus.inventario.domain.Tour
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_VENDEDOR'])

class DuracionTourController {

    def index() {
        render(DuracionTour.findAllByTour(Tour.findById(2)) as JSON)
    }
}
