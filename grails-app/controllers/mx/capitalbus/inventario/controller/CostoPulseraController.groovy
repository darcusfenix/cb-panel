package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.CostoPulsera
import mx.capitalbus.inventario.domain.Duracion
import mx.capitalbus.inventario.domain.DuracionPersona
import mx.capitalbus.inventario.domain.Persona

class CostoPulseraController {

    def index() {
        def a = DuracionPersona.findByDuracionAndPersona(Duracion.findById(3), Persona.findById(2))

        render( CostoPulsera.findAllByDuracionPersona(a) as JSON)
    }
}
