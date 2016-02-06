class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")


        //REST full

        "/vendedor/$id/pulseras/total"(controller: "Vendedor", action: "pulseras")

        "500"(view:'/error')

	}
}
