//
//  ViewController.swift
//  figuras
//
//  Created by nayara on 11/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtAncho: UITextField!
    @IBOutlet weak var txtAlto: UITextField!
    @IBOutlet weak var txtX: UITextField!
    @IBOutlet weak var txtY: UITextField!
    @IBOutlet weak var lblTotalAreaPerimetro: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblTotalAreaPerimetro.text = ""
    }
    
    var ancho : Double = (Double(txtAncho.text!) ?? 0)
    var alto : Double = (Double(txtAlto.text!) ?? 0)
    var x : Double = (Double(txtX.text!) ?? 0)
    var y : Double = (Double(txtY.text!) ?? 0)
    @IBAction func btnCalcularArea(_ sender: Any) {
        
    }
    @IBAction func btnCalcularPerimetro(_ sender: Any) {
        
    }
    
}

