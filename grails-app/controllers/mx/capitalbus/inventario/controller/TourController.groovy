package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.Tour

class TourController {

    def index() {
        render(Tour.list() as JSON)
    }
}
