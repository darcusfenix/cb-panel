package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.Pulsera
import mx.capitalbus.inventario.domain.TipoUsuario
import mx.capitalbus.inventario.domain.Vendedor
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_VENDEDOR'])

class VendedorController {

    def index() {
        render(Vendedor.findAllByTipoUsuarioAndActivo(TipoUsuario.findById(4), true) as JSON)
    }

    def pulseras() {
        def v = Vendedor.findById(params.int("id"))

        if (v != null)
            render(Pulsera.countByVendedor(v))
        else{
            response.sendError(404)
            render([message : "error"] as JSON)
        }
    }

    def show(Integer id) {
        render(Vendedor.findById(id ?: params.int("id")) as JSON)
    }

    def get(Integer id) {
        def idTemp = id ?: params.int("id")

        def vendedor = Vendedor.findByIdAndTipoUsuarioAndActivo(idTemp, TipoUsuario.findById(4), true)
        if (vendedor != null) {
            render(vendedor as JSON);
        } else {
            response.status = 404
            render([message: message(code: "vendedor.notFound")] as JSON)
        }
    }

    def email(String q, String b) {
        def search = q ?: params.int('q');
        def v = Vendedor.createCriteria()
        def results = v.list {
            and {
                eq("tipoUsuario", TipoUsuario.findById(4))
                eq("activo", params.boolean(b))
            }
            or {
                like("username", "%" + search + "%")
                like("nombres", "%" + search + "%")
            }
            maxResults(25)
        }
        render(results as JSON)
    }
}
