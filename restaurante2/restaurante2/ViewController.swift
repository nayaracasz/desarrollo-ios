//
//  ViewController.swift
//  restaurante2
//
//  Created by SamsungBoot on 05/12/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pkvMenu.delegate = self
        pkvMenu.dataSource = self
        lblPedidoMesa.text! = ""
    }

    // funciones para el pickerview
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
    
    // arreglo del menu
    let menu = ["Hamburguesa sencilla ($40)", "Hamburguesa con queso ($50)", "Papas fritas ($20)", "Refresco ($12)", "Postre (8)"]
    // objetos para los pedidos de las mesas
    var mesaUno : Pedido = Pedido()
    var mesaDos : Pedido = Pedido()
    var mesaTres : Pedido = Pedido()
    // total del pedido para las mesas
    var mesaUnoTotal = 0
    var mesaDosTotal = 0
    var mesaTresTotal = 0
    
    // controles
    @IBOutlet weak var imgMenu: UIImageView!
    @IBOutlet weak var pkvMenu: UIPickerView!
    @IBOutlet weak var lblCantidad: UILabel!
    @IBOutlet weak var segMesas: UISegmentedControl!
    @IBOutlet weak var lblPedidoMesa: UILabel!
    @IBOutlet weak var switchCupon: UISwitch!
    @IBOutlet weak var lblTotal: UILabel!
    
    // mostrar cantidad en el label en base al stepper
    @IBAction func ColocarCantidad(_ sender: UIStepper) {
        lblCantidad.text! = String(Int(sender.value))
    }
    
    // inicializacion de objetos de las mesas segun al segmento que este seleccionado
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
    
    @IBAction func AgregarProducto(_ sender: UIButton) {
        let selectRow = pkvMenu.selectedRow(inComponent: 0) // producto seleccionado
        let cantidad = Double(lblCantidad.text!) ?? 0 // cantidad que solicitan
        let tieneCupon = switchCupon.isOn // si tiene cupon
        let cantidadReal = tieneCupon ? (cantidad / 2) : cantidad // cantidad ajustada de acuerdo al cupon
        
        var pedidoActual: Pedido
        
        switch segMesas.selectedSegmentIndex {
        case 0:
            pedidoActual = mesaUno
        case 1:
            pedidoActual = mesaDos
        case 2:
            pedidoActual = mesaTres
        default:
            return
        }

        switch selectRow {
        case 0: // hamburguesa sencilla
            pedidoActual.HamburguesasSencillas += cantidadReal
        case 1: // hamburguesa con queso
            pedidoActual.HamburguesasConQueso += cantidadReal
        case 2: // papas fritas
            pedidoActual.PapasFritas += cantidadReal
        case 3: // refrescos
            pedidoActual.Refrescos += cantidadReal
        case 4: // postres
            pedidoActual.Postres += cantidadReal
        default:
            return
        }
        
        switch segMesas.selectedSegmentIndex {
        case 0:
            mesaUno = pedidoActual
        case 1:
            mesaDos = pedidoActual
        case 2:
            mesaTres = pedidoActual
        default:
            break
        }
        
        lblPedidoMesa.text = pedidoActual.generarResumen(cuponActivado: tieneCupon)
    }
    
    @IBAction func CalcularTotal(_ sender: UIButton) {
//        var propina: Double =
//        lblTotal.text! += "Subtotal: "
    }
    
    
}

