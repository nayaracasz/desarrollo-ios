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
        var mensaje = ""
        
        switch opcion {
        case 1:
            mensaje = "Test de la primera alerta"
        case 2:
            mensaje = ""
        case 3:
            mensaje = "Test de alerta con diferentes estilos"
        case 4:
            mensaje = "Test de alerta con cajas de texto"
        default:
            mensaje = ""
        }
    }
    func MostrarAlerta(tipoAlerta: Int, mensaje: String){
        let alerta: UIAlertController
        if tipoAlerta == 1 {
            // alerta tradicional
            // crear alerta
            alerta = UIAlertController(title: "Aviso", message: mensaje, preferredStyle: .alert)
            // agregar botones
            // default -> ok, cancelar -> accion de cancelar, el texto se pone en negritas, destructive -> se ve en color rojo
            alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {action in print("se oprimió el botón de la alerta")}))
            // presentar la alerta
            present(alerta, animated: true)
        } else if tipoAlerta == 2{
            
        } else if tipoAlerta == 3 {
            alerta = UIAlertController(title: "Aviso", message: mensaje, preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {action in print("se oprimió el botón de la alerta")}))
            alerta.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: {action in print("se oprimió el botón de la alerta")}))
            alerta.addAction(UIAlertAction(title: "Eliminar", style: .destructive, handler: {action in print("se oprimió el botón de la alerta")}))
            alerta.addAction(UIAlertAction(title: "Aceptar 4", style: .default, handler: {action in print("se oprimió el botón de la alerta")}))
            // presentar la alerta
            present(alerta, animated: true)
        } else if tipoAlerta == 4 {
            alerta = UIAlertController(title: "Aviso", message: mensaje, preferredStyle: .alert)
            // agregar cajas de texto a la alerta
            alerta.addTextField{
                (email) in
                email.placeholder = "Ingresar usuario"
            }
            alerta.addTextField{
                (password) in
                password.placeholder = "Ingresar contraseña"
                password.isSecureTextEntry = true
            }
            alerta.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: {
                (_) in
                // tomat los elementos de la alerta. van a estar en un arreglo de elementos
                if let camposTexto = alerta.textFields{
                    let txtUsuario = camposTexto[0]
                    let txtPassword = camposTexto[1]
                    
                    guard let usuario = txtUsuario.text, !usuario.isEmpty,
                          let password = txtPassword.text,
                          !password.isEmpty else {
                        print("No pueden estar vacios")
                        return
                    }
                    print("Usuario: \(usuario), Password: \(password)")
                }
            }))
            // presentar la alerta
            present(alerta, animated: true)
        }
        
    }
    

}

