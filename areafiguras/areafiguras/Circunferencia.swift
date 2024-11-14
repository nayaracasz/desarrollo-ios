//
//  Circunferencia.swift
//  manzanas
//
//  Created by SamsungBoot on 14/11/24.
//

import Foundation
class Circunferencia: Figura {
    private var radio: Double
    var Radio: Double{
        get {return radio}
        set {radio = newValue}
    }
    
    init (_ rade: Double) {
        self.radio = rade
    }
    
    override func CalcularArea() -> Double {
        let area = 3.1416 * pow(Radio, 2)
        return area
    }
}
