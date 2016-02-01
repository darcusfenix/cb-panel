package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.CostoPulsera
import mx.capitalbus.inventario.domain.Duracion
import mx.capitalbus.inventario.domain.DuracionPersona
import mx.capitalbus.inventario.domain.Persona

class CostoPulseraController {

    def index() {
        def costos = CostoPulsera.executeQuery("SELECT cp.precio, cp.duracionPersona from CostoPulsera cp")
        render(costos as JSON)
    }


}
