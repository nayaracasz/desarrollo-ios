//
//  ViewController.swift
//  restaurante
//
//  Created by nayara on 01/12/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // funciones para pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return menu.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return menu[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            imgMenu.image = UIImage(named: "hamburguesa-sencilla")
        case 1:
            imgMenu.image = UIImage(named: "hamburguesa-queso")
        case 2:
            imgMenu.image = UIImage(named: "papas-fritas")
        case 3:
            imgMenu.image = UIImage(named: "soda")
        case 4:
            imgMenu.image = UIImage(named: "postre")
        default:
            imgMenu.image = nil                                 
        }
    }
    
    // controles
    @IBOutlet weak var imgMenu: UIImageView!
    @IBOutlet weak var pkvMenu: UIPickerView!
    @IBOutlet weak var stpCantidad: UIStepper!
    @IBOutlet weak var swtCupon: UISwitch!
    @IBOutlet weak var lblProductos: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblCantidad: UILabel!
    @IBOutlet weak var segMesas: UISegmentedControl!
    
    //arreglo del menu de productos
    let menu = ["Hamburguesa sencilla", "Hamburguesa con queso", "Papas fritas", "Refresco", "Postre"]
    var mesaUno : Pedido = Pedido()
    var mesaDos : Pedido = Pedido()
    var mesaTres : Pedido = Pedido()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pkvMenu.delegate = self
        pkvMenu.dataSource = self
        lblProductos.text = ""
        lblTotal.text = ""
    }
    
    // seleccionar mesa
    @IBAction func SeleccionarMesa(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mesaUno = Pedido(0, 0, 0, 0, 0)
        case 1:
            mesaDos = Pedido(0, 0, 0, 0, 0)
        case 2:
            mesaTres = Pedido(0, 0, 0, 0, 0)
        default:
            break
        }
    }
    
    // agregar producto
    @IBAction func AgregarProducto(_ sender: Any) {
        let cantidadProductos = Double(lblCantidad.text!) ?? 0.0
        let selectedRow = pkvMenu.selectedRow(inComponent: 0) // Cambiado a 0
        
        switch segMesas.selectedSegmentIndex {
        case 0:
            switch selectedRow {
            case 0:
                mesaUno.HamburguesasSencillas += (swtCupon.isOn) ? (cantidadProductos / 2) : cantidadProductos
                lblProductos.text! += "Hamburguesas sencillas: \(mesaUno.HamburguesasSencillas)\n"
            case 1:
                mesaUno.HamburguesasConQueso += (swtCupon.isOn) ? (cantidadProductos / 2) : cantidadProductos
                lblProductos.text! += "Hamburguesas con queso: \(mesaUno.HamburguesasConQueso)\n"
            case 2:
                mesaUno.PapasFritas += (swtCupon.isOn) ? (cantidadProductos / 2) : cantidadProductos
                lblProductos.text! += "Papas fritas: \(mesaUno.PapasFritas)\n"
            case 3:
                mesaUno.Refrescos += (swtCupon.isOn) ? (cantidadProductos / 2) : cantidadProductos
                lblProductos.text! += "Refrescos: \(mesaUno.Refrescos)\n"
            case 4:
                mesaUno.Postres += (swtCupon.isOn) ? (cantidadProductos / 2) : cantidadProductos
                lblProductos.text! += "Postres: \(mesaUno.Postres)\n"
            default:
                break
            }
        case 1:
            switch selectedRow {
            case 0:
                mesaDos.HamburguesasSencillas = (swtCupon.isOn) ? (cantidadProductos / 2) : cantidadProductos
                lblProductos.text! += "Hamburguesas sencillas: \(mesaDos.HamburguesasSencillas)\n"
            case 1:
                mesaDos.HamburguesasConQueso = (swtCupon.isOn) ? (cantidadProductos / 2) : cantidadProductos
            case 2:
                mesaDos.PapasFritas = (swtCupon.isOn) ? (cantidadProductos / 2) : cantidadProductos
            case 3:
                mesaDos.Refrescos = (swtCupon.isOn) ? (cantidadProductos / 2) : cantidadProductos
            case 4:
                mesaDos.Postres = (swtCupon.isOn) ? (cantidadProductos / 2) : cantidadProductos
            default:
                break
            }
        case 2:
            switch selectedRow {
            case 0:
                mesaTres.HamburguesasSencillas = (swtCupon.isOn) ? (cantidadProductos / 2) : cantidadProductos
            case 1:
                mesaTres.HamburguesasConQueso = (swtCupon.isOn) ? (cantidadProductos / 2) : cantidadProductos
            case 2:
                mesaTres.PapasFritas = (swtCupon.isOn) ? (cantidadProductos / 2) : cantidadProductos
            case 3:
                mesaTres.Refrescos = (swtCupon.isOn) ? (cantidadProductos / 2) : cantidadProductos
            case 4:
                mesaTres.Postres = (swtCupon.isOn) ? (cantidadProductos / 2) : cantidadProductos
            default:
                break
            }
        default:
            break
        }
    }
    
    @IBAction func AgregarPropina(_ sender: Any) {
        // Código para agregar propina
    }
    
    @IBAction func CalcularTotal(_ sender: Any) {
        // Código para calcular el total
    }
    
    @IBAction func ColocarCantidad(_ sender: UIStepper) {
        lblCantidad.text = String(Int(sender.value))
    }
}
