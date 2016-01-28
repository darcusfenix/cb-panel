package mx.capitalbus.inventario.domain

class VentaDetalles {
    float precioVenta
    Integer tipoPulsera
    float comisionSocio
    float comisionConcierge

    static belongsTo = [venta: Venta, pulsera : Pulsera];

    static constraints = {
    }
    static mapping = {
        table 'rl_detalle_venta'
        id column: 'id_detalle_venta', generator: 'identity'
        precioVenta column: 'precio_venta'
        tipoPulsera column: 'tipo_pulcera'
        comisionSocio column: 'comision_socio'
        comisionConcierge column: 'comision_consearch'
        venta column: 'id_venta'
        pulsera column: 'id_pulcera'
        version false
    }
}
