package mx.capitalbus.inventario.domain

class Pulsera {

    String codigo
    Date fechaActivacion
    Date fechaCreacion
    static belongsTo = [status: PulseraStatus, vendedor : Vendedor, costoPulsera : CostoPulsera];


    static constraints = {
        codigo nullable: false, blank: false
        status nullable: false, blank: false
        fechaActivacion nullable: true, blank: true
        vendedor nullable: true, blank: true
    }

    static mapping = {
        table 'ct_pulcera'
        id column: 'id_pulcera', generator: 'identity'
        codigo column: 'codigo'
        status column: 'id_status_pulcera'
        fechaActivacion column: 'fecha_activacion'
        vendedor column: 'vendedor'
        costoPulsera column: 'costo'
        fechaCreacion column: 'fecha_creacion'
        version false
    }

}
