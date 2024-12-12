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
        lblTotal.text = """
        Subtotal: $\(String(format: "%.2f", 0))
        Propina: \(0)% ($\(String(format: "%.2f", 0)))
        Total: $\(String(format: "%.2f", 0))
        """
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
    let menu = ["Hamburguesa sencilla ($40)", "Hamburguesa con queso ($50)", "Papas fritas ($20)", "Refresco ($12)", "Postre ($8)"]
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
        // Reiniciar el stepper y cantidad mostrada
        lblCantidad.text = "0"
        
        // Verificar el total calculado de la mesa seleccionada
        switch sender.selectedSegmentIndex {
        case 0:
            lblPedidoMesa.text = mesaUno.generarResumen()
            lblTotal.text = generarTextoTotal(para: mesaUno)
        case 1:
            lblPedidoMesa.text = mesaDos.generarResumen()
            lblTotal.text = generarTextoTotal(para: mesaDos)
        case 2:
            lblPedidoMesa.text = mesaTres.generarResumen()
            lblTotal.text = generarTextoTotal(para: mesaTres)
        default:
            break
        }
    }
    
    @IBAction func AgregarProducto(_ sender: UIButton) {
        let selectRow = pkvMenu.selectedRow(inComponent: 0) // producto seleccionado
        let cantidad = Double(lblCantidad.text!) ?? 0 // cantidad solicitada
        let tieneCupon = switchCupon.isOn // si tiene cupón
        
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

        pedidoActual.agregarProducto(selectRow, cantidad: cantidad, cupon: tieneCupon)

        // Actualiza el pedido correspondiente
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
        
        lblPedidoMesa.text = pedidoActual.generarResumen()
        for subview in view.subviews {
            if let stepper = subview as? UIStepper {
                stepper.value = 0
            }
        }
        lblCantidad.text! = "0"
        switchCupon.isOn = false
    }
    
    @IBAction func CalcularTotal(_ sender: UIButton) {
        // Obtener el pedido actual según la mesa seleccionada
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
        
        
        // Mostrar resultados en el lblTotal
        lblTotal.text = generarTextoTotal(para: pedidoActual)
    }
    
    func generarTextoTotal(para pedido: Pedido) -> String {
        let total = pedido.calcularTotal()
        if total == 0 {
            return "Subtotal: $0\nPropina: 0% ($0)\nTotal: $0"
        }
        
        // Cálculos
        let subtotal = pedido.calcularTotal()
        let propina = pedido.Propina
        let porcentajePropina = propina > 0 ? Int((propina / subtotal) * 100) : 0
        let totalConPropina = pedido.calcularTotalConPropina()

        return """
        Subtotal: $\(String(format: "%.2f", total))
        Propina: \(Int(porcentajePropina))% ($\(String(format: "%.2f", propina)))
        Total: $\(String(format: "%.2f", totalConPropina))
        """
    }

    func agregarPropina(porcentaje: Double) {
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

        let totalActual = pedidoActual.calcularTotal()
        let propina = totalActual * porcentaje
        pedidoActual.agregarPropina(propina)

        // Actualiza el pedido correspondiente
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
    }
    
    @IBAction func MostrarMenuPropina(_ sender: UIButton) {
        let alert = UIAlertController(title: "Propina", message: "Selecciona una cantidad de propina", preferredStyle: .actionSheet)

        // Opciones de propina
        let tresPorCiento = UIAlertAction(title: "3%", style: .default) { _ in
            self.agregarPropina(porcentaje: 0.03)
        }
        let diezPorCiento = UIAlertAction(title: "10%", style: .default) { _ in
            self.agregarPropina(porcentaje: 0.10)
        }
        let quincePorCiento = UIAlertAction(title: "15%", style: .default) { _ in
            self.agregarPropina(porcentaje: 0.15)
        }
        let sinPropina = UIAlertAction(title: "Sin propina", style: .cancel) { _ in
            self.agregarPropina(porcentaje: 0.0)
        }

        // Agregar acciones al menú
        alert.addAction(tresPorCiento)
        alert.addAction(diezPorCiento)
        alert.addAction(quincePorCiento)
        alert.addAction(sinPropina)

        // Mostrar el menú
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func LimpiarPedido(_ sender: UIButton) {
        var pedidoActual: Pedido
        
        switch segMesas.selectedSegmentIndex {
        case 0:
            mesaUno = Pedido()
            pedidoActual = mesaUno
        case 1:
            mesaDos = Pedido()
            pedidoActual = mesaDos
        case 2:
            mesaTres = Pedido()
            pedidoActual = mesaTres
        default:
            return
        }
        
        lblPedidoMesa.text = ""
        lblCantidad.text = "0"
        lblTotal.text = """
        Subtotal: $0.00
        Propina: 0% ($0.00)
        Total: $0.00
        """
        
        // Mostrar mensaje de confirmación
        let alert = UIAlertController(title: "Mesa reiniciada", message: "Todos los valores han sido reiniciados.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
}

