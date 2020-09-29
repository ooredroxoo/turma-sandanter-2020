//
//  ViewController.swift
//  CadastroPessoaEndereco
//
//  Created by Rafael Nascimento Sampaio on 28/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var adicionaUsuarioButton: UIButton!
    
    var pessoas: [Pessoa] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.adicionaUsuarioButton.layer.cornerRadius = 5.0
        self.usersTableView.dataSource = self
        self.usersTableView.delegate = self
    }

    @IBAction func adicionaUsuario(_ sender: UIButton) {
        performSegue(withIdentifier: SegueIdentifier.mainToCadastroPessoa.rawValue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if identifier == SegueIdentifier.mainToCadastroPessoa.rawValue {
            let cadastroVC: CadastroPessoaViewController = segue.destination as? CadastroPessoaViewController ?? CadastroPessoaViewController()
            cadastroVC.delegate = self
        } else {
            if let pessoa = sender as? Pessoa {
                let detailVC: DetalhesUsuarioViewController = segue.destination as? DetalhesUsuarioViewController ?? DetalhesUsuarioViewController()
                detailVC.pessoa = pessoa
            } else {
                let alert = UIAlertController(title: "Atenção", message: "Pessoa inválida", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Entendi", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.usersTableView.reloadData()
        print("Pessoas Cadastradas \(self.pessoas.count)")
    }
    
}

extension ViewController : PessoaCadastroDelegate {
    func adicionaPessoa(pessoa: Pessoa) {
        self.pessoas.append(pessoa)
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pessoas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell") as? UITableViewCell ?? UITableViewCell(style: .subtitle, reuseIdentifier: "basicCell")
        if let pessoa: Pessoa = self.pessoas[indexPath.row] {
            cell.textLabel?.text = pessoa.nome
            cell.detailTextLabel?.text = pessoa.email
        } else {
            cell.textLabel?.text = "Erro"
            cell.detailTextLabel?.text = "Erro"
        }
        
        return cell
    }
    
    
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: SegueIdentifier.mainToDetalhes.rawValue, sender: self.pessoas[indexPath.row])
    }
}

