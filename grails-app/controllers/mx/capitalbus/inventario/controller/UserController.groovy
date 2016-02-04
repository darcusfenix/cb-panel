package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.User
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class UserController {

    def index() {
        def usuairo  = User.findById(200);
        if (usuairo == null)
            log.error("---------------------->" + usuairo)
        render ( usuairo as JSON)
    }
}
