class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")


        "/vendedor/$id/pulseras/total"(controller: "Vendedor", action: "totalPulseras")
        "/vendedor/$id/pulseras/asignaciones"(controller: "Vendedor", action: "asignaciones")
        "/vendedor/$id/pulseras/resumen"(controller: "Vendedor", action: "resumenAsignaciones")

        "500"(view:'/error')

	}
}
