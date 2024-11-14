//
//  Rectangulo.swift
//  manzanas
//
//  Created by SamsungBoot on 14/11/24.
//

import Foundation

class Rectangulo: Figura {
    private var largo: Double
    private var ancho: Double
    var Largo: Double{
        get {return largo}
        set {largo = newValue}
    }
    var Ancho: Double{
        get {return ancho}
        set {ancho = newValue}
    }
    
    init (_ large: Double, _ width: Double) {
        self.largo = large
        self.ancho = width
    }
    
    override func CalcularArea() -> Double {
        let area = Ancho * Largo
        return area
    }
}
