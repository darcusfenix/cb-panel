package capitalbus

class Vendedor {

    Sucursal sucursal;
    String nombres;
    String apellidos;
    Date fechaNacimiento;
    String direccion;
    String telefono;

    static constraints = {
    }
    static mapping = {
        table 'ct_vendedor'
        id column: 'id_vendedor', generator: 'identity'
        sucursal column: 'id_sucursal'
        nombres column: 'nombres'
        apellidos column: 'apellidos'
        fechaNacimiento column: 'fecha_nacimiento'
        direccion column: 'direccion'
        telefono column: 'telefono'
        version false
    }
}
