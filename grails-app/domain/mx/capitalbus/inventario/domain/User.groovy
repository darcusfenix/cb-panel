package mx.capitalbus.inventario.domain

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='correo')
@ToString(includes='correo', includeNames=true, includePackage=false)

class User implements Serializable {

    private static final long serialVersionUID = 1

    transient springSecurityService //added

    Integer id
    TipoUsuario tipoUsuario
    String correo
    String password
    Date fechaCreacion
    String urlFoto
    String verificacion
    boolean activo
    String permisos

    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    User(String correo, String password) { //added
        this()
        this.correo = correo
        this.password = password
    }
    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this)*.role
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ?
                springSecurityService.encodePassword(password) :
                password
    }

    static transients = ['springSecurityService']

    static constraints = {
        correo blank: false, unique: true
        password blank: false
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
        accountExpired column: 'account_expired'
        accountLocked column: 'account_locked'
        passwordExpired column: 'password_expired'
        version false
    }
 //   static mapWith = "none"
}
