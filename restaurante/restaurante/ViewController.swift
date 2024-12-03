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
    
    //arreglo del menu de productos
    let menu = ["Hamburguesa sencilla", "Hamburguesa con queso", "Papas fritas", "Refresco", "Postre"]
    var mesaUno : Pedido
    var mesaDos : Pedido
    var mesaTres : Pedido
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pkvMenu.delegate = self
        pkvMenu.dataSource = self
    }
    
    
    
    @IBAction func SeleccionarMesa(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mesaUno = Pedido()
        case 1:
            mesaDos = Pedido()
        case 2:
            mesaTres = Pedido()
        default:
            break
        }
    }
    
    @IBAction func AgregarProducto(_ sender: Any) {
        switch pkvMenu.selectedRow(inComponent: <#T##Int#>) {
        case 0:
            mesaUno.HamburguesasSencillas = (swtCupon.isOn) ? (
        }
    }
    
    @IBAction func AgregarPropina(_ sender: Any) {
        
    }
    
    @IBAction func CalcularTotal(_ sender: Any) {
        
    }
}
