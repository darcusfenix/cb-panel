import mx.capitalbus.inventario.domain.User
import mx.capitalbus.inventario.domain.Role
import mx.capitalbus.inventario.domain.UserRole

class BootStrap {

    def init = { servletContext ->
        User usr = new User(
                accountExpired: false,
                accountLocked: false,
                activo: true,
                correo: "juancvfenix@gmail.com",
                fechaCreacion: new Date(),
                password: "123"
        )
        def role = Role.findById(1)
        UserRole.create usr, role, true
    }
    def destroy = {
    }
}
