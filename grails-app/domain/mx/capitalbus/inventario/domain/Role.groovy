package mx.capitalbus.inventario.domain

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)

class Role implements Serializable{

    private static final long serialVersionUID = 1

    Integer id
    String authority

    Role (String authority) {
        this()
        this.authority = authority
    }

    @Override
    int hashCode() {
        authority?.hashCode() ?: 0
    }

    @Override
    boolean equals(other) {
        is(other) || (other instanceof Role && other.authority == authority)
    }

    @Override
    String toString() {
        authority
    }

    static constraints = {
        authority blank: false, unique: true
    }

    static mapping = {
        cache true
        id column: 'id_role', generator: 'identity'
        table 'ct_role'
        authority column: 'authority'
        version false
    }
}
