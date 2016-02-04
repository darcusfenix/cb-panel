package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.Tour
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])

class TourController {

    def index() {
        render(Tour.list() as JSON)
    }
}
