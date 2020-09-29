//
//  CadastroEnderecoViewController.swift
//  CadastroPessoaEndereco
//
//  Created by Rafael Nascimento Sampaio on 28/09/20.
//

import UIKit

class CadastroEnderecoViewController: UIViewController {

    @IBOutlet weak var logadouroTextField: UITextField!
    @IBOutlet weak var numeroTextField: UITextField!
    @IBOutlet weak var complementoTextField: UITextField!
    @IBOutlet weak var bairroTextField: UITextField!
    @IBOutlet weak var cidadeTextField: UITextField!
    @IBOutlet weak var estadoTextField: UITextField!
    @IBOutlet weak var adicionaEnderecoButton: UIButton!
    
    var delegate: EnderecoCadastroDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configFields()
        // Do any additional setup after loading the view.
    }
    
    private func configFields() {
        logadouroTextField.delegate = self
        numeroTextField.delegate = self
        complementoTextField.delegate = self
        bairroTextField.delegate = self
        cidadeTextField.delegate = self
        estadoTextField.delegate = self
    }
    
    @IBAction func adicionaEnderecoAction(_ sender: UIButton) {
        if validaDados() {
            let endereco = Endereco(endereco: logadouroTextField.text ?? "Sem logadouro", numero: numeroTextField.text ?? "Sem Número", complemento: complementoTextField.text, bairro: bairroTextField.text ?? "Sem bairro", cidade: cidadeTextField.text ?? "Sem cidade", estado: estadoTextField.text ?? "Sem estado")
            self.delegate?.adicionaEndereco(endereco: endereco)
            self.dismiss(animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Atenção", message: "Todos os campos com exceção do complemento são de preenchimento obrigatório!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Entendi", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func validaDados() -> Bool {
        if !logadouroTextField.hasText || !numeroTextField.hasText || !bairroTextField.hasText || !cidadeTextField.hasText || !estadoTextField.hasText {
            return false
        }
        return true
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

extension CadastroEnderecoViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if !textField.isEqual(self.estadoTextField) {
            textField.returnKeyType = .continue
        } else {
            textField.returnKeyType = .done
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(self.logadouroTextField) {
            self.numeroTextField.becomeFirstResponder()
        } else if textField.isEqual(self.numeroTextField) {
            self.complementoTextField.becomeFirstResponder()
        } else if textField.isEqual(self.complementoTextField) {
            self.bairroTextField.becomeFirstResponder()
        } else if textField.isEqual(self.bairroTextField) {
            self.cidadeTextField.becomeFirstResponder()
        } else if textField.isEqual(self.cidadeTextField) {
            self.estadoTextField.becomeFirstResponder()
        } else if textField.isEqual(self.estadoTextField) {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
