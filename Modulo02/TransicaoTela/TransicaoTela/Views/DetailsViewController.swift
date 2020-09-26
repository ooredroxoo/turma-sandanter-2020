//
//  DetailsViewController.swift
//  TransicaoTela
//
//  Created by Rafael Nascimento Sampaio on 25/09/20.
//

import UIKit

class DetailsViewController : UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    var myText: String?
    
    override func viewDidLoad() {
        self.myLabel.text = myText
    }
    
}
