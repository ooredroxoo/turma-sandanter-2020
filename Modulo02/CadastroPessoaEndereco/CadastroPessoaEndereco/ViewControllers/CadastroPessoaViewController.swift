//
//  CadastroPessoaViewController.swift
//  CadastroPessoaEndereco
//
//  Created by Rafael Nascimento Sampaio on 28/09/20.
//

import UIKit

class CadastroPessoaViewController: UIViewController {

    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var dataNascimentoDatePicker: UIDatePicker!
    @IBOutlet weak var adicionarEnderecoButton: UIButton!
    @IBOutlet weak var cadastrarUsuarioButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func adicionarEnderecoAction(_ sender: UIButton) {
    }
    
    @IBAction func cadastrarUsuarioAction(_ sender: UIButton) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
