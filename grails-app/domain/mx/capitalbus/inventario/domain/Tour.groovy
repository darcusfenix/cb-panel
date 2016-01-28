package mx.capitalbus.inventario.domain

class Tour {
    String nombre
    Date fechaCreacion
    String ruta
    boolean activo

    static constraints = {
    }

    static mapping = {
        table 'ct_tour'
        id column: 'id_tour', generator: 'identity'
        nombre column: 'nombre'
        fechaCreacion column: 'fecha_creacion'
        ruta column: 'ruta'
        activo column: 'activo'
        version false
    }
}
