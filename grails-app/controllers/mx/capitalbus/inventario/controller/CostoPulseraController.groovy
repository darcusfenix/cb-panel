package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.CostoPulsera
import mx.capitalbus.inventario.domain.Duracion
import mx.capitalbus.inventario.domain.DuracionPersona
import mx.capitalbus.inventario.domain.Persona

class CostoPulseraController {

    def index() {
        def a = DuracionPersona.findByDuracionAndPersona(Duracion.findById(1), Persona.findById(1))

        render( CostoPulsera.findAllByDuracionPersona(a) as JSON)
    }
}
