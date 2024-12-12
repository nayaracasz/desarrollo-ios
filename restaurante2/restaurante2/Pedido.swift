class Pedido {
    // atributos
    private var hamburguesasSencillas: Double
    private var hamburguesasSencillasConCupon: Double
    private var hamburguesasConQueso: Double
    private var hamburguesasConQuesoConCupon: Double
    private var papasFritas: Double
    private var papasFritasConCupon: Double
    private var refrescos: Double
    private var refrescosConCupon: Double
    private var postres: Double
    private var postresConCupon: Double
    private var propina: Double

    // inicializadores
    init() {
        self.hamburguesasSencillas = 0
        self.hamburguesasSencillasConCupon = 0
        self.hamburguesasConQueso = 0
        self.hamburguesasConQuesoConCupon = 0
        self.papasFritas = 0
        self.papasFritasConCupon = 0
        self.refrescos = 0
        self.refrescosConCupon = 0
        self.postres = 0
        self.postresConCupon = 0
        self.propina = 0
    }

    init(_ hamburguesasSencillas: Double, _ hamburguesasConQueso: Double, _ papasFritas: Double, _ refrescos: Double, _ postres: Double, _ propina: Double) {
        self.hamburguesasSencillas = hamburguesasSencillas
        self.hamburguesasSencillasConCupon = 0
        self.hamburguesasConQueso = hamburguesasConQueso
        self.hamburguesasConQuesoConCupon = 0
        self.papasFritas = papasFritas
        self.papasFritasConCupon = 0
        self.refrescos = refrescos
        self.refrescosConCupon = 0
        self.postres = postres
        self.postresConCupon = 0
        self.propina = propina
    }

    // getters totales para cada producto
    var TotalHamburguesasSencillas: Double {
        return hamburguesasSencillas + hamburguesasSencillasConCupon
    }

    var TotalHamburguesasConQueso: Double {
        return hamburguesasConQueso + hamburguesasConQuesoConCupon
    }

    var TotalPapasFritas: Double {
        return papasFritas + papasFritasConCupon
    }

    var TotalRefrescos: Double {
        return refrescos + refrescosConCupon
    }

    var TotalPostres: Double {
        return postres + postresConCupon
    }
    
    var Propina: Double {
        return propina
    }
    
    // Método para agregar propina
    func agregarPropina(_ cantidad: Double) {
        propina = cantidad
    }

    // Método para calcular el total con propina
    func calcularTotalConPropina() -> Double {
        return calcularTotal() + propina
    }

    // funciones para manejar las cantidades con y sin cupón
    func agregarProducto(_ producto: Int, cantidad: Double, cupon: Bool) {
        switch producto {
        case 0: // hamburguesa sencilla
            if cupon {
                hamburguesasSencillasConCupon += cantidad
            } else {
                hamburguesasSencillas += cantidad
            }
        case 1: // hamburguesa con queso
            if cupon {
                hamburguesasConQuesoConCupon += cantidad
            } else {
                hamburguesasConQueso += cantidad
            }
        case 2: // papas fritas
            if cupon {
                papasFritasConCupon += cantidad
            } else {
                papasFritas += cantidad
            }
        case 3: // refrescos
            if cupon {
                refrescosConCupon += cantidad
            } else {
                refrescos += cantidad
            }
        case 4: // postres
            if cupon {
                postresConCupon += cantidad
            } else {
                postres += cantidad
            }
        default:
            break
        }
    }

    // función para calcular el total correctamente
    func calcularTotal() -> Double {
        let totalHamburguesasSencillas = (hamburguesasSencillas * 40) + (hamburguesasSencillasConCupon * 20)
        let totalHamburguesasConQueso = (hamburguesasConQueso * 50) + (hamburguesasConQuesoConCupon * 25)
        let totalPapasFritas = (papasFritas * 20) + (papasFritasConCupon * 10)
        let totalRefrescos = (refrescos * 12) + (refrescosConCupon * 6)
        let totalPostres = (postres * 8) + (postresConCupon * 4)

        return totalHamburguesasSencillas + totalHamburguesasConQueso + totalPapasFritas + totalRefrescos + totalPostres
    }

    // función para generar el resumen total sin dividir entre cupones
    func generarResumen() -> String {
        var resumen = ""
        if TotalHamburguesasSencillas > 0 {
            resumen += "Hamburguesas sencillas: \(Int(TotalHamburguesasSencillas))\n"
        }
        if TotalHamburguesasConQueso > 0 {
            resumen += "Hamburguesas con queso: \(Int(TotalHamburguesasConQueso))\n"
        }
        if TotalPapasFritas > 0 {
            resumen += "Papas fritas: \(Int(TotalPapasFritas))\n"
        }
        if TotalRefrescos > 0 {
            resumen += "Refrescos: \(Int(TotalRefrescos))\n"
        }
        if TotalPostres > 0 {
            resumen += "Postres: \(Int(TotalPostres))\n"
        }
        return resumen
    }
}

