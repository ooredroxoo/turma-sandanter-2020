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
    @IBOutlet weak var enderecoLabel: UILabel!
    
    var pessoa: Pessoa?
    var endereco: Endereco?
    var delegate: PessoaCadastroDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configFields()
        // Do any additional setup after loading the view.
    }
    
    private func configFields() {
        nomeTextField.delegate = self
        cpfTextField.delegate = self
        emailTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let _endereco = self.endereco {
            enderecoLabel.text = _endereco.descricao()
            enderecoLabel.textColor = .systemPurple
        } else {
            enderecoLabel.text = "Sem endereço"
            enderecoLabel.textColor = .red
        }
    }
    
    @IBAction func adicionarEnderecoAction(_ sender: UIButton) {
        performSegue(withIdentifier: SegueIdentifier.cadastroPessoaParaCadastroEndereco.rawValue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.cadastroPessoaParaCadastroEndereco.rawValue {
            let cadastroEndereco: CadastroEnderecoViewController = segue.destination as? CadastroEnderecoViewController ?? CadastroEnderecoViewController()
            cadastroEndereco.delegate = self
        }
    }
    
    @IBAction func cadastrarUsuarioAction(_ sender: UIButton) {
        if validaDados() && validaEndereco() {
            let pessoa = Pessoa(nome: nomeTextField.text ?? "Sem Nome", cpf: cpfTextField.text ?? "Sem CPF", email: emailTextField.text ?? "Sem e-Mail", dataNascimento: dataNascimentoDatePicker.date, endereco: self.endereco)
            self.delegate?.adicionaPessoa(pessoa: pessoa)
            dismiss(animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Atenção", message: "Todos os campos e o endereço são de preenchimento obrigatório!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Entendi", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func validaDados() -> Bool {
        if !nomeTextField.hasText || !cpfTextField.hasText || !emailTextField.hasText {
            return false
        }
        return true
    }
    
    private func validaEndereco() -> Bool {
        if self.endereco != nil {
            return true;
        }
        return false;
    }
    
    @IBAction func dismissKeyboardFromDatePicker(_ sender: UIDatePicker) {
        if self.nomeTextField.isFirstResponder {
            self.nomeTextField.resignFirstResponder()
        } else if self.cpfTextField.isFirstResponder {
            self.cpfTextField.resignFirstResponder()
        } else if self.emailTextField.isFirstResponder {
            self.emailTextField.resignFirstResponder()
        }
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

extension CadastroPessoaViewController : UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.returnKeyType = .continue
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(self.nomeTextField) {
            self.cpfTextField.becomeFirstResponder()
        } else if textField.isEqual(self.cpfTextField) {
            self.emailTextField.becomeFirstResponder()
        } else if textField.isEqual(self.emailTextField) {
            textField.resignFirstResponder()
        }
        
        return true
    }
}

extension CadastroPessoaViewController : EnderecoCadastroDelegate {
    func adicionaEndereco(endereco: Endereco) {
        self.endereco = endereco
    }
}
