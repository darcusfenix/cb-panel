package mx.capitalbus.inventario.domain

class Sucursal {

    Socio socio
    User usuario
    String nombreSucursal
    String nombreResponsable
    String apellidoResponsable
    String genero
    Date fechaNacimiento
    String direccion

    static constraints = {
    }
    static mapping = {
        table 'ct_sucursal'
        id column: 'id_sucursal', generator: 'identity'
        socio column: 'id_socio'
        usuario column: 'id_usuario'
        nombreSucursal column: 'nombre_sucursal'
        nombreResponsable column: 'nombre_responsable'
        apellidoResponsable column: 'apellidos_responsable'
        genero column: 'genero'
        fechaNacimiento column: 'fecha_nacimiento'
        direccion column: 'direccion'
        version false
    }
    static mapWith = "none"
}
