package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.Tour
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_VENDEDOR'])

class TourController {

    def index() {
        render(Tour.list() as JSON)
    }
}
