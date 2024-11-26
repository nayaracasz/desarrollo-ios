//
//  ViewController.swift
//  avisos
//
//  Created by SamsungBoot on 26/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtOpcion: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func ImprimirAlerta(_ sender: Any) {
        let opcion = (Int(txtOpcion.text!) ?? 0)
    }
    func MostrarAlerta(tipoAlerta: Int, mensaje: String){
        let alerta: UIAlertController
        if tipoAlerta == 1{
            // alerta tradicional
            // crear alerta
            alerta = UIAlertController(title: "Aviso", message: mensaje, preferredStyle: .alert)
            // agregar botones
            // default -> ok, cancelar -> accion de cancelar, el texto se pone en negritas, destructive -> se ve en color rojo
            alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {action in print("se oprimió el botón de la alerta")}))
            // presentar la alerta
            present(alerta, animated: true)
        }
    }
    

}

