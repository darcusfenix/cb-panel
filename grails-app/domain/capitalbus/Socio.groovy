package capitalbus

class Socio{
    User id
    String empresa;
    String nombres;
    String apellidos;
    String telefono;
    Float comision;

    static constraints = {
    }
    static mapping = {
        table 'ct_socio'
        id column: 'id_socio', generator: 'identity'
        empresa column: 'empresa'
        nombres column: 'nombres'
        apellidos column: 'apellidos'
        telefono column: 'telefono'
        comision column: 'comision'
        version false
    }
}
