package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.Pulsera
import mx.capitalbus.inventario.domain.PulseraStatus
import mx.capitalbus.inventario.domain.Vendedor
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_VENDEDOR'])

class MainController {

    // static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        render ( PulseraStatus.list() as JSON)
    }
    def pulseras(){
        def vendedor =  Vendedor.findById(170)
        log.error(vendedor)
        if (vendedor != null)
            render Pulsera.findAllByVendedor(vendedor) as JSON
        else{
            response.status = 500
            render( ["error": 500] as JSON)
        }
    }
    def vendedor(){
        render ( Vendedor.findById(170) as JSON)
    }
}
