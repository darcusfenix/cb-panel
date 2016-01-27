package capitalbus

import grails.converters.JSON
import mx.capitalbus.inventario.TipoUsuario
import mx.capitalbus.inventario.Vendedor

class VendedorController {

    def index() {}

    def show(Integer id){
        render(  Vendedor.findById(id ?: params.int("id")) as JSON)
    }
    def get(Integer id){
        def idTemp = id ?: params.int("id")
        log.error("############################# ->" + idTemp)
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
                like("correo", "%" + search + "%")
                like("nombres", "%" + search + "%")
            }
            maxResults(25)
        }
        render(  results as JSON)
    }
}
