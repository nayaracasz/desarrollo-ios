//
//  ViewController.swift
//  ejercicioColores
//
//  Created by SamsungBoot on 19/11/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // numero de renglones
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colores.count
    }
    

    let colores = ["", "Azul", "Amarillo", "Gris", "Morado", "Verde", "Rojo", "Cafe", "Negro"]
    
    @IBOutlet weak var imgColor: UIImageView!
    @IBOutlet weak var pkvColores: UIPickerView!
    @IBOutlet weak var lblColor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pkvColores.delegate = self
        pkvColores.dataSource = self
        lblColor.text = ""
    }

    // indicar el listado
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colores[row]
    }
    
    // atrapar el valor seleccionado
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // obtener el renglon seleccionado
        lblColor.text = colores[row]
        switch row {
        case 1:
            lblColor.backgroundColor = .blue
            imgColor.image = UIImage(named: "blue")
        case 2:
            lblColor.backgroundColor = .yellow
            imgColor.image = UIImage(named: "yellow")
        case 3:
            lblColor.backgroundColor = .lightGray
            imgColor.image = UIImage(named: "gray")
        case 4:
            lblColor.backgroundColor = .purple
            imgColor.image = UIImage(named: "purple")
        case 5:
            lblColor.backgroundColor = .green
            imgColor.image = UIImage(named: "green")
        default:
            lblColor.backgroundColor = .clear
            imgColor.image = nil
        }
    }
    
    @IBAction func ReiniciarSeleccion(_ sender: UISwitch) {
        if sender.isOn {
            pkvColores.selectRow(0, inComponent: 0, animated: true)
        } else {
            pkvColores.selectRow(5, inComponent: 0, animated: false)
        }
    }
}

