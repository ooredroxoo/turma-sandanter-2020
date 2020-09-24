//
//  SecondViewController.swift
//  TransicaoTela
//
//  Created by Rafael Nascimento Sampaio on 23/09/20.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    @IBAction func voltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
