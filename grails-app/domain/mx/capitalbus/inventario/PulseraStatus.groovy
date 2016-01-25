package mx.capitalbus.inventario

class PulseraStatus {

    String descripccion

    //static hasMany = [pulceras: Pulsera]
    //static mappedBy = [pulceras: 'status']

    static constraints = {

    }
    static mapping = {
        table 'ct_status_pulcera'
        id column: 'id_status_pulcera', generator: 'identity'
        descripccion column: 'descripccion'
        //pulceras fetch: 'join', lazy: false
        version false
    }

    //static fetchMode = [pulceras: 'eager']
}
