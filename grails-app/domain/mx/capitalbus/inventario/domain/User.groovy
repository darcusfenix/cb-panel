package mx.capitalbus.inventario.domain

class User {

    Integer id
    TipoUsuario tipoUsuario
    String correo
    String password
    Date fechaCreacion
    String urlFoto
    String verificacion
    boolean activo
    String permisos


    static constraints = {
    }

    static mapping = {
        tablePerHierarchy false
        table 'ct_usuario'
        id column: 'id_usuario', generator: 'identity'
        tipoUsuario column: 'id_tipo'
        correo column: 'correo'
        password column: 'passwd'
        fechaCreacion column: 'fecha_creacion'
        urlFoto column: 'url_foto'
        verificacion column: 'verificacion'
        activo column: 'activo'
        permisos column: 'permisos'
        version false
    }
 //   static mapWith = "none"
}
