package mx.capitalbus.inventario.domain

class Persona {

    String nombre
    String descripcion

    static constraints = {
    }

    static mapping = {
        table 'ct_persona'
        id column: 'id_persona', generator: 'identity'
        nombre column: 'nombre'
        descripcion column: 'descripcion'
        version false
    }
}
