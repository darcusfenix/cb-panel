package mx.capitalbus.inventario.domain

class Vendedor extends User{

    //Sucursal sucursal;
    String nombres
    String apellidos
    Date fechaNacimiento
    String direccion
    String telefono

    //static belongsTo = [vendedor: Pulsera];

    static constraints = {
    }
    static mapping = {
        table 'ct_vendedor'
        id column: 'id_vendedor', generator: 'identity'
      //  sucursal column: 'id_sucursal'
        nombres column: 'nombres'
        apellidos column: 'apellidos'
        fechaNacimiento column: 'fecha_nacimiento'
        direccion column: 'direccion'
        telefono column: 'telefono'
        version false
    }
    //static mapWith = "none"

    static mappedBy = [pulsera: 'vendedor']


}
