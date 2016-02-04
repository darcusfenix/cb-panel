package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.User
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_VENDEDOR'])
class UserController {

    def index() {

        def usuairo  = User.findById(200);
        if (usuairo == null)
            log.error("---------------------->" + usuairo)
        else
            usuairo = new User()
        render ( usuairo as JSON)
    }
}
