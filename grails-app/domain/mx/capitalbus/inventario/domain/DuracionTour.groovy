package mx.capitalbus.inventario.domain

class DuracionTour {

    Integer duracionHoras
    float costoNino
    float costoAdulto
    boolean activo

    static belongsTo = [tour: Tour];

    static constraints = {
    }

    static mapping = {
        table 'ct_duracion_tour'
        id column: 'id_duracion_tour', generator: 'identity'
        duracionHoras column: 'duracion_horas'
        costoNino column: 'costo_nino'
        costoAdulto column: 'costo_adulto'
        tour column: 'id_tour'
        activo column: 'activo'
        version false
    }
}
