//
//  Triangulo.swift
//  manzanas
//
//  Created by SamsungBoot on 14/11/24.
//

import Foundation

class Triangulo: Figura {
    private var altura: Double
    private var base: Double
    var Altura: Double{
        get {return altura}
        set {altura = newValue}
    }
    var Base: Double{
        get {return base}
        set {base = newValue}
    }
    
    init (_ height: Double, _ base: Double) {
        self.altura = height
        self.base = base
    }
    
    override func CalcularArea() -> Double {
        let area = (Base * Altura) / 2
        return area
    }
}
