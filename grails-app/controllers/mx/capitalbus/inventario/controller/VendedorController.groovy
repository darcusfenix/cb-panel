package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.TipoUsuario
import mx.capitalbus.inventario.domain.Vendedor
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_VENDEDOR'])

class VendedorController {


    def show(Integer id){
        render(  Vendedor.findById(id ?: params.int("id")) as JSON)
    }
    def get(Integer id){
        def idTemp = id ?: params.int("id")
        
        def vendedor = Vendedor.findByIdAndTipoUsuarioAndActivo(idTemp, TipoUsuario.findById(4),true)
        if (vendedor != null) {
            render (vendedor as JSON);
        }else {
            response.status = 404
            render([message: message(code: "vendedor.notFound")] as JSON)
        }

    }
    def email(String q){
        def search = q ?: params.int('q');
        def v = Vendedor.createCriteria()
        def results = v.list {
            and{
                eq("tipoUsuario", TipoUsuario.findById(4))
                eq("activo", true)
            }
            or {
                like("username", "%" + search + "%")
                like("nombres", "%" + search + "%")
            }
            maxResults(25)
        }
        render(  results as JSON)
    }
}
