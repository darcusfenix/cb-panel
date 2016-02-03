package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.Persona
import org.springframework.security.access.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_VENDEDOR'])

class PersonaController {

    def index() {
        render(Persona.list() as JSON)
    }
}
