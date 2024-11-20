//
//  ViewController.swift
//  areafiguras
//
//  Created by SamsungBoot on 14/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblMedida1: UILabel!
    @IBOutlet weak var lblMedida2: UILabel!
    @IBOutlet weak var lblTextoResultado: UILabel!
    @IBOutlet weak var lblResultado: UILabel!
    @IBOutlet weak var txtMedida1: UITextField!
    @IBOutlet weak var txtMedida2: UITextField!
    @IBOutlet weak var segFiguras: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMedida1.text = "Medida 1"
        lblMedida2.text = "Medida 2"
        lblMedida1.isEnabled = false
        lblMedida2.isEnabled = false
        txtMedida2.isEnabled = false
        txtMedida2.isEnabled = false
        lblTextoResultado.text = "Seleccione una figura para comenzar"
        lblResultado.text = "0"
    }
    
    @IBAction func SeleccionarFigura(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            lblMedida1.text = "Radio"
            lblMedida2.isEnabled = false
            txtMedida2.isEnabled = false
        case 1:
            lblMedida1.text = "Ancho"
            lblMedida2.text = "Largo"
            lblMedida2.isEnabled = true
            txtMedida2.isEnabled = true
        case 2:
            lblMedida1.text = "Base"
            lblMedida2.text = "Altura"
            lblMedida2.isEnabled = true
            txtMedida2.isEnabled = true
        default:
            lblMedida1.text = "Medida 1"
            lblMedida2.text = "Medida 2"
            lblMedida1.isEnabled = false
            lblMedida2.isEnabled = false
            txtMedida2.isEnabled = false
            txtMedida2.isEnabled = false
        }
    }
    
    @IBAction func MostrarResultadoArea(_ sender: Any) {
        switch segFiguras.selectedSegmentIndex {
        case 0:
            let circunferencia = Circunferencia(Double(txtMedida1.text!) ?? 0)
            lblTextoResultado.text = "El área de la circunferencia es:"
            lblResultado.text = String(circunferencia.CalcularArea())
        case 1:
            let rectangulo = Rectangulo(Double(txtMedida1.text!) ?? 0, Double(txtMedida2.text!) ?? 0)
            lblTextoResultado.text = "El área del rectángulo es:"
            lblResultado.text = String(rectangulo.CalcularArea())
        case 2:
            let triangulo = Triangulo(Double(txtMedida1.text!) ?? 0, Double(txtMedida2.text!) ?? 0)
            lblTextoResultado.text = "El área del triángulo es:"
            lblResultado.text = String(triangulo.CalcularArea())
        default:
            lblTextoResultado.text = "Seleccione una figura para comenzar"
            lblResultado.text = "0"
        }
    }
}

