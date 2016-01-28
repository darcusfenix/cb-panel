package mx.capitalbus.inventario.domain

class CostoPulsera {
    float precio
    //DuracionPersona duracionPersona
    static belongsTo = [duracionPersona: DuracionPersona]

    static constraints = {
    }

    static mapping = {
        table 'ct_costo_pulsera'
        id column: 'id_costo_pulsera', generator: 'identity'
        precio column: 'precio'

        columns {
            duracionPersona {
                column name: "id_persona"
                column name: "id_horas"
            }
        }
        version false
    }
}
