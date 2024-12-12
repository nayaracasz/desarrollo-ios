//
//  ViewController.swift
//  cotizacion-autos
//
//  Created by nayara on 11/12/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return autos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return autos[row].0
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            imgAuto.image = UIImage(named: "compacto")
        case 1:
            imgAuto.image = UIImage(named: "familiar")
        case 2:
            imgAuto.image = UIImage(named: "deportivo")
        default:
            imgAuto.image = nil
        }
        calcularCotizacion()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pkvAuto.delegate = self
        pkvAuto.dataSource = self
        calcularCotizacion()
    }
    
    @IBOutlet weak var imgAuto: UIImageView!
    @IBOutlet weak var lblMensualidad: UILabel!
    @IBOutlet weak var lblPlazo: UILabel!
    @IBOutlet weak var sldPlazo: UISlider!
    @IBOutlet weak var lblEnganche: UILabel!
    @IBOutlet weak var segEnganche: UISegmentedControl!
    @IBOutlet weak var pkvAuto: UIPickerView!
    
    
    let autos = [("Compacto ($500,000)", 500000.0), ("Familiar ($700,000)", 700000.0), ("Deportivo ($950,000)", 950000.0)]

    @IBAction func SeleccionarEnganche(_ sender: UISegmentedControl) {
        calcularCotizacion()
    }
    
    func obtenerPorcentajeEnganche() -> Double {
        switch segEnganche.selectedSegmentIndex {
        case 0: return 0.20
        case 1: return 0.30
        case 2: return 0.40
        case 3: return 0.50
        default: return 0.0
        }
    }

    @IBAction func ColocarPlazo(_ sender: UISlider) {
        sender.value = round(sender.value / 12) * 12
        
        let plazo = Int(sender.value.rounded())
        lblPlazo.text = "\(plazo) meses"
        calcularCotizacion()
    }
    
    func calcularCotizacion() {
        let selectedAuto = autos[pkvAuto.selectedRow(inComponent: 0)]
        let porcentajeEnganche = obtenerPorcentajeEnganche()
        let enganche = selectedAuto.1 * porcentajeEnganche
        let plazo = Int(sldPlazo.value.rounded())
        
        let cotizacion = Cotizacion(precioAuto: selectedAuto.1, enganche: enganche, plazo: plazo)
        let mensualidad = cotizacion.calcularMensualidad()
        
        lblEnganche.text = "$\(String(format: "%.2f", enganche))"
        lblMensualidad.text = "$\(String(format: "%.2f", mensualidad)) / mes"
    }

}

