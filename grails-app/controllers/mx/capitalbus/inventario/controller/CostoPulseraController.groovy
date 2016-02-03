package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.CostoPulsera
import mx.capitalbus.inventario.domain.Duracion
import mx.capitalbus.inventario.domain.DuracionPersona
import mx.capitalbus.inventario.domain.Persona
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_VENDEDOR'])
class CostoPulseraController {

    def index() {
        //todo Debido a un error entre db y mapeo de grails se manda como array de objetos
        def costos = CostoPulsera.executeQuery("SELECT cp.id, cp.precio, cp.duracionPersona from CostoPulsera cp")
        render(costos as JSON)
    }

}
