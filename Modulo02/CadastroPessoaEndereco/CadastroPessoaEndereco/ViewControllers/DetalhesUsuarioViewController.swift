//
//  DetalhesUsuarioViewController.swift
//  CadastroPessoaEndereco
//
//  Created by Rafael Nascimento Sampaio on 28/09/20.
//

import UIKit

class DetalhesUsuarioViewController: UIViewController {

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var cpfLabel: UILabel!
    @IBOutlet weak var dataNascimentoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var enderecoLabel: UILabel!
    @IBOutlet weak var voltarButton: UIButton!
    
    var pessoa: Pessoa?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let _pessoa = self.pessoa {
            self.nomeLabel.text = _pessoa.nome
            self.cpfLabel.text = "CPF: \(_pessoa.cpf)"
            
            let dateString: String = _pessoa.dataNascimento.description(with: .current)
            
            self.dataNascimentoLabel.text = "Data Nascimento: \(dateString)"
            self.emailLabel.text = "e-mail: \(_pessoa.email)"
            
            if let endereco = _pessoa.endereco {
                var enderecoText = endereco.descricao()
                enderecoLabel.text = enderecoText
            } else {
                enderecoLabel.text = "Sem endereço"
            }
            
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func voltarAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
