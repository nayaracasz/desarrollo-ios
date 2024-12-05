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
