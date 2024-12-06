//
//  Pedido.swift
//  restaurante2
//
//  Created by SamsungBoot on 05/12/24.
//

class Pedido {
    // atributos
    private var hamburguesasSencillas: Double
    private var hamburguesasConQueso: Double
    private var papasFritas: Double
    private var refrescos: Double
    private var postres: Double
    
    // propiedades
    var HamburguesasSencillas : Double {
        get { return hamburguesasSencillas }
        set { hamburguesasSencillas = newValue }
    }
    
    var HamburguesasConQueso : Double {
        get { return hamburguesasConQueso }
        set { hamburguesasConQueso = newValue }
    }
    
    var PapasFritas : Double {
        get { return papasFritas }
        set { papasFritas = newValue }
    }
    
    var Refrescos : Double {
        get { return refrescos }
        set { refrescos = newValue }
    }
    
    var Postres : Double {
        get { return postres }
        set { postres = newValue }
    }
    
    //constructor
    init() {
        self.hamburguesasSencillas = 0
        self.hamburguesasConQueso = 0
        self.papasFritas = 0
        self.refrescos = 0
        self.postres = 0
    }
    
    init(_ hamburguesasSencillas : Double, _ hamburguesasConQueso : Double, _ papasFritas : Double, _ refrescos : Double, _ postres : Double) {
        self.hamburguesasSencillas = hamburguesasSencillas
        self.hamburguesasConQueso = hamburguesasConQueso
        self.papasFritas = papasFritas
        self.refrescos = refrescos
        self.postres = postres
    }
    
    // resumen del pedido antes de calcular total
    func generarResumen(cuponActivado : Bool) -> String {
        var resumen = ""
        
        // agregar solo los productos que tienen cantidades mayores a 0
        if HamburguesasSencillas > 0 {
            let cantidadVisual = cuponActivado ? (HamburguesasSencillas / 2) : HamburguesasSencillas
            resumen += "Hamburguesas sencillas: \(Int(cantidadVisual))\n"
        }
        if HamburguesasConQueso > 0 {
            let cantidadVisual = cuponActivado ? (HamburguesasConQueso * 2) : HamburguesasConQueso
            resumen += "Hamburguesas con queso: \(Int(cantidadVisual))\n"
        }
        if PapasFritas > 0 {
            let cantidadVisual = cuponActivado ? (PapasFritas * 2) : PapasFritas
            resumen += "Papas fritas: \(Int(cantidadVisual))\n"
        }
        if Refrescos > 0 {
            let cantidadVisual = cuponActivado ? (Refrescos * 2) : Refrescos
            resumen += "Refrescos: \(Int(cantidadVisual))\n"
        }
        if Postres > 0 {
            let cantidadVisual = cuponActivado ? (Postres * 2) : Postres
            resumen += "Postres: \(Int(cantidadVisual))\n"
        }
        
        return resumen
    }
    
    //calcular total
    func CalcularTotal() -> Double {
        let totalHamburguesasSencillas = HamburguesasSencillas * 40
        let totalHamburguesasConQueso = HamburguesasConQueso * 50
        let totalPapasFritas = PapasFritas * 20
        let totalResfrescos = Refrescos * 40
        let totalPostres = Postres * 40
        return totalHamburguesasSencillas + totalHamburguesasConQueso + totalPapasFritas + totalResfrescos + totalPostres
    }
}
