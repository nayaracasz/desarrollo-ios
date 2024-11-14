//
//  ViewController.swift
//  manzanas
//
//  Created by nayara on 10/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchCaptura: UISwitch!
    @IBOutlet weak var txtManzanas: UITextField!
    @IBOutlet weak var lblTotalNaranjas: UILabel!
    @IBOutlet weak var lblManzanasRestantes: UILabel!
    @IBOutlet weak var indicador: UIActivityIndicatorView!
    @IBOutlet weak var lblTitulo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblTotalNaranjas.text = "0"
        lblManzanasRestantes.text = "0"
        indicador.startAnimating()
        indicador.hidesWhenStopped = true
    }

    @IBAction func btnRealizarIntercambio(_ sender: Any) {
        let manzanas = (Int(txtManzanas.text!) ?? 0)
        let naranjas = 3 * (manzanas / 5)
        let manzanasRestantes = manzanas % 5
        
        lblTotalNaranjas.text = "\(naranjas)"
        lblManzanasRestantes.text = "\(manzanasRestantes)"
        if switchCaptura.isOn {
            lblTotalNaranjas.textColor = .blue
        } else {
            lblTotalNaranjas.textColor = .brown
        }
        
        if indicador.isAnimating{
            print("indicador encendido :o")
        } else {
            print("indicador apagado :(")
        }
    }

    @IBAction func swBloquearCaptura(_ sender: UISwitch) {
        if switchCaptura.isOn {
            print("Switch encendido :D")
        } else {
            print("Switch apagado :(")
        }
        
        if sender.isOn {
            print("Switch encendido :D")
            txtManzanas.isEnabled = true
            indicador.startAnimating()
        } else {
            print("Switch apagado :(")
            txtManzanas.isEnabled = false
            indicador.stopAnimating()
        }
    }
    
    @IBAction func SeleccionarSemestre(_ sender: UISlider) {
        let semestre = Int(sender.value)
        print(semestre)
        print("Valor máximo: \(Int(sender.maximumValue))\nValor mínimo: \(Int(sender.minimumValue))")
        
        if semestre == 1 {
            switchCaptura.setOn(false, animated: true)
            txtManzanas.isEnabled = true
        } else {
            switchCaptura.setOn(true, animated: false)
            txtManzanas.isEnabled = false
        }
    }
    @IBAction func SeleccionarEquipo(_ sender: UISegmentedControl) {
        print("Total de segmentos es \(sender.numberOfSegments)")
        print("El segmento seleccionado es \(sender.selectedSegmentIndex)")
        
        switch sender.selectedSegmentIndex {
        case 0:
            lblTitulo.textColor = .yellow
        case 1:
            lblTitulo.textColor = .systemRed
        case 2:
            lblTitulo.textColor = .systemYellow
        case 3:
            lblTitulo.textColor = .red
        default:
            lblTitulo.textColor = .black
        }
    }
}

