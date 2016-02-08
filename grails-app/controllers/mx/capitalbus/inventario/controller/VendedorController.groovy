package mx.capitalbus.inventario.controller

import grails.converters.JSON
import mx.capitalbus.inventario.domain.CostoPulsera
import mx.capitalbus.inventario.domain.Pulsera
import mx.capitalbus.inventario.domain.TipoUsuario
import mx.capitalbus.inventario.domain.Vendedor
import grails.plugin.springsecurity.annotation.Secured
import org.hibernate.criterion.Restrictions

import java.text.SimpleDateFormat

@Secured(['ROLE_ADMIN', 'ROLE_VENDEDOR'])

class VendedorController {

    def index() {
        render(Vendedor.findAllByTipoUsuarioAndActivo(TipoUsuario.findById(4), true) as JSON)
    }

    def totalPulseras() {
        def v = Vendedor.findById(params.int("id"))

        if (v != null)
            render(Pulsera.countByVendedor(v))
        else {
            response.sendError(404)
            render([message: "error"] as JSON)
        }
    }

    def asignaciones() {
        def v = Vendedor.findById(params.int("id"))

        if (v != null) {
            def p = Pulsera.createCriteria()
            def results = p.list {
                and {
                    eq("vendedor", v)
                }
                projections {
                    groupProperty('fechaCreacion')
                    count("fechaCreacion")
                }
            }
            render(results as JSON)
        } else {
            response.sendError(404)
            render([message: "error"] as JSON)
        }
    }

    def resumenAsignaciones() {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        def v = Vendedor.findById(params.int("id"))
        def pf = params.list("f")
        def f

        if (pf != null) {
            f = formatter.parse(pf)

            def costos = CostoPulsera.list()

            costos.each { costo ->
                        log.error(costo)
            }

          //  Pulsera.countByVendedorAndFechaCreacionAndCostoPulsera(v,f,CostoPulsera.findById(1))
        }
        /*
        if (v != null && f != null) {
            def p = Pulsera.createCriteria()
            def results = p {
                and {
                    eq("vendedor", v)
                    eq("fechaCreacion", f)
                }
            }
            render(results as JSON)
        } else {
            response.sendError(404)
            render([message: "error"] as JSON)
        }
*/
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

    def email(String q) {
        def search = q ?: params.int('q');
        def v = Vendedor.createCriteria()
        def results = v.list {
            and {
                eq("tipoUsuario", TipoUsuario.findById(4))
                eq("activo", true)
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
