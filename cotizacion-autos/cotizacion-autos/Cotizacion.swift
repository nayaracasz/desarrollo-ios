//
//  Cotizacion.swift
//  cotizacion-autos
//
//  Created by nayara on 11/12/24.
//
import Foundation

class Cotizacion {
    var precioAuto: Double
    var enganche: Double
    var tasaAnual: Double = 0.12
    var plazo: Int
    
    init(precioAuto: Double, enganche: Double, plazo: Int) {
        self.precioAuto = precioAuto
        self.enganche = enganche
        self.plazo = plazo
    }
    
    func calcularMensualidad() -> Double {
        let montoCredito = precioAuto - enganche
        let tasaMensual = tasaAnual / 12
        return (tasaMensual * montoCredito) / (1 - pow(1 + tasaMensual, Double(-plazo)))
    }
}
