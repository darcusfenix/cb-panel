package mx.capitalbus.inventario.controller

import grails.converters.JSON
import groovy.json.JsonSlurper
import mx.capitalbus.inventario.domain.Pulsera
import mx.capitalbus.inventario.domain.Vendedor
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_VENDEDOR'])
class PulseraController {
    static allowedMethods = [save: "POST"]
    def pulseraService
    def index(Integer cantidad, Integer idVendedor) {
        render (text: "nsdakjnlkfds")
    }
    def create (){
        render (new Pulsera() as JSON)
    }
    def save (String json, Integer idVendedor){
        def v = Vendedor.findById(idVendedor ?: params.int("idVendedor"))
        if (v != null) {
            def jsonSlurper = new JsonSlurper()
            def object = jsonSlurper.parseText(json)
            def map  = [:]
            for (String a : object) {
                def cc = JSON.parse(a)
                Integer ic = cc.idCosto
                Integer ca = cc.cantidad
                map.put(ic,ca)
            }
            def mapCVS =  pulseraService.generatePulseras(map, v);
            //response.setHeader("Content-disposition", "attachment; filename="+v.nombres+"-"+v.apellidos+".csv")
            //render(contentType: "text/csv", text:mapCVS )
            render( [text : mapCVS + ""] as JSON )
        }else {
            response.status = 404
            render([message: message(code: "vendedor.notFound")] as JSON)
        }
    }
}