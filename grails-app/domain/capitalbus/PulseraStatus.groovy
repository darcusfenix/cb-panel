package capitalbus

class PulseraStatus {

    String descripccion;

    static constraints = {

    }
    static mapping = {
        table 'ct_status_pulcera'
        id column: 'id_status_pulcera', generator: 'identity'
        descripccion column: 'descripccion'
    }
}
