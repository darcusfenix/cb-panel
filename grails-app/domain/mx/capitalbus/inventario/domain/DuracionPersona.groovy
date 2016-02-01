package mx.capitalbus.inventario.domain

import org.apache.commons.lang.builder.HashCodeBuilder

class DuracionPersona implements Serializable {

    Persona persona
    Duracion duracion

    boolean equals(other) {
        if (!(other instanceof DuracionPersona)) {
            return false
        }

        other.persona == persona && other.duracion == duracion
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        builder.append persona
        builder.append duracion
        builder.toHashCode()
    }

    static constraints = {
    }

    static mapping = {
        table 'rl_persona_duracion'
        id composite: ['persona', 'duracion']
        persona column: 'id_persona'
        duracion column: 'id_horas'
        version false
    }

}
