package capitalbus

import grails.converters.JSON
import mx.capitalbus.inventario.Pulsera
import mx.capitalbus.inventario.PulseraStatus
import mx.capitalbus.inventario.Vendedor

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
