package mx.capitalbus.inventario.domain

class Duracion {

    String duracion

    static constraints = {
    }

    static mapping = {
        table 'ct_duracion'
        id column: 'id_horas', generator: 'identity'
        duracion column: 'total_horas'
        version false
    }
}
