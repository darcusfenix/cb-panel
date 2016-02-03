package mx.capitalbus.inventario.service

import org.springframework.security.core.GrantedAuthority

/**
 * Created by grupobecm on 02/02/16.
 */
class MyUserDetails {
    final String fullName

    MyUserDetails(String correo, String password, boolean enabled,
                  boolean accountNonExpired, boolean credentialsNonExpired,
                  boolean accountNonLocked,
                  Collection<GrantedAuthority> authorities,
                  long id, String fullName) {
        super(correo, password, enabled, accountNonExpired,
                credentialsNonExpired, accountNonLocked, authorities, id)

        this.fullName = fullName
    }
}
