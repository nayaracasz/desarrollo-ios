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
    let menu = ["Hamburguesa sencilla", "Hamburguesa con queso", "Papas fritas", "Refresco", "Postre"]
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
        let selectRow = pkvMenu.selectedRow(inComponent: 0)
        switch segMesas.selectedSegmentIndex {
        case 0:
            print("seleccionando mesa 1")
            switch selectRow {
            case 0:
                if switchCupon.isOn {
                    mesaUno.HamburguesasSencillas = (Double(lblCantidad.text!) ?? 0) / 2
                    lblPedidoMesa.text! += "Hamburguesas sencillas (con cupón): \(Int(mesaUno.HamburguesasSencillas * 2))\n"
                } else {
                    mesaUno.HamburguesasSencillas = Double(lblCantidad.text!) ?? 0
                    lblPedidoMesa.text! += "Hamburguesas sencillas: \(Int(mesaUno.HamburguesasSencillas))\n"
                }
            case 1:
                if switchCupon.isOn {
                    mesaUno.HamburguesasConQueso = (Double(lblCantidad.text!) ?? 0) / 2
                    lblPedidoMesa.text! += "Hamburguesas con queso (con cupón): \(Int(mesaUno.HamburguesasConQueso * 2))\n"
                } else {
                    mesaUno.HamburguesasConQueso = Double(lblCantidad.text!) ?? 0
                    lblPedidoMesa.text! += "Hamburguesas con queso: \(Int(mesaUno.HamburguesasConQueso))\n"
                }
            case 2:
                if switchCupon.isOn {
                    mesaUno.PapasFritas = (Double(lblCantidad.text!) ?? 0) / 2
                    lblPedidoMesa.text! += "Papas fritas (con cupón): \(Int(mesaUno.PapasFritas * 2))\n"
                } else {
                    mesaUno.PapasFritas = Double(lblCantidad.text!) ?? 0
                    lblPedidoMesa.text! += "Papas fritas: \(Int(mesaUno.PapasFritas))\n"
                }
            case 3:
                if switchCupon.isOn {
                    mesaUno.Refrescos = (Double(lblCantidad.text!) ?? 0) / 2
                    lblPedidoMesa.text! += "Refrescos (con cupón): \(Int(mesaUno.Refrescos * 2))\n"
                } else {
                    mesaUno.Refrescos = Double(lblCantidad.text!) ?? 0
                    lblPedidoMesa.text! += "Refrescos: \(Int(mesaUno.Refrescos))\n"
                }
            case 4:
                if switchCupon.isOn {
                    mesaUno.Postres = (Double(lblCantidad.text!) ?? 0) / 2
                    lblPedidoMesa.text! += "Postres (con cupón): \(Int(mesaUno.Postres * 2))\n"
                } else {
                    mesaUno.Postres = Double(lblCantidad.text!) ?? 0
                    lblPedidoMesa.text! += "Postres: \(Int(mesaUno.Postres))\n"
                }
            default:
                break
            }
        case 1:
            print("seleccionando mesa 2")
        case 2:
            print("seleccionando mesa 3")
        default:
            break
        }
    }
    
    @IBAction func CalcularTotal(_ sender: UIButton) {
        var propina: Double = 
        lblTotal.text! += "Subtotal: "
    }
    
    
}

