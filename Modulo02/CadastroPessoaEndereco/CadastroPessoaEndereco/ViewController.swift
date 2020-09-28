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
    }

    @IBAction func adicionaUsuario(_ sender: UIButton) {
    }
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.largeContentTitle = "Teste"
        return cell
    }
    
    
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

