//
//  ViewController.swift
//  manzanas
//
//  Created by nayara on 10/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtManzanas: UITextField!
    @IBOutlet weak var lblTotalNaranjas: UILabel!
    @IBOutlet weak var lblManzanasRestantes: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblTotalNaranjas.text = "0"
        lblManzanasRestantes.text = "0"
    }

    @IBAction func btnRealizarIntercambio(_ sender: Any) {
        let manzanas = (Int(txtManzanas.text!) ?? 0)
        let naranjas = 3 * (manzanas / 5)
        let manzanasRestantes = manzanas % 5
        
        lblTotalNaranjas.text = "\(naranjas)"
        lblManzanasRestantes.text = "\(manzanasRestantes)"
    }
    
}

