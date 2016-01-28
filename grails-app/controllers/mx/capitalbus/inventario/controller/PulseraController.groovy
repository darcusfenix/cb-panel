package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.Vendedor


class PulseraController {

    def pulseraService

    def index(Integer cantidad, Integer idVendedor) {
        def v = Vendedor.findById(idVendedor ?: params.int("idVendedor"))
        if (v != null) {
            def mapCVS =  pulseraService.generatePulseras(cantidad, v);
            response.setHeader("Content-disposition", "attachment; filename="+v.nombres+"-"+v.apellidos+".csv")
            render(contentType: "text/csv", text:mapCVS )
        }else {
            response.status = 404
            render([message: message(code: "vendedor.notFound")] as JSON)
        }
    }
}
