package capitalbus

class Pulsera {

    String codigo;
    PulseraStatus status;
    Date fechaActivacion;
    Vendedor vendedor;


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
        version false
    }
}
