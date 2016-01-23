package capitalbus

class TipoUsuario {

    String descripcion;

    static constraints = {
    }

    static mapping = {
        table 'ct_tipo_usuario'
        id column: 'id_tipo', generator: 'identity'
        descripcion column: 'descripcion'
    }
}
