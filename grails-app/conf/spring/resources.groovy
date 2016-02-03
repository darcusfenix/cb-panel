// Place your Spring DSL code here
import org.springframework.security.authentication.encoding.PlaintextPasswordEncoder

beans = {
    userDetailsService(mx.capitalbus.inventario.service.MyUserDetailsService)
    passwordEncoder(PlaintextPasswordEncoder)
}
