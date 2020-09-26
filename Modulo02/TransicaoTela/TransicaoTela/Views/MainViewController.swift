//
//  ViewController.swift
//  TransicaoTela
//
//  Created by Rafael Nascimento Sampaio on 23/09/20.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
 
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "mainToDetails", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailsVC : DetailsViewController? = segue.destination as? DetailsViewController
        detailsVC?.myText = "Olá da main view!"
        
    }
}

