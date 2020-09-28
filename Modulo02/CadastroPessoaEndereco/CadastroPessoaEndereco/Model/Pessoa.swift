//
//  Pessoa.swift
//  CadastroPessoaEndereco
//
//  Created by Rafael Nascimento Sampaio on 28/09/20.
//

import Foundation

class Pessoa {
    var nome: String
    var cpf: String
    var email: String
    var dataNascimento: Date
    var endereco: Endereco?
    
    init(nome: String, cpf: String, email:String, dataNascimento:Date, endereco: Endereco? = nil) {
        self.nome = nome
        self.cpf = cpf
        self.email = email
        self.dataNascimento = dataNascimento
        self.endereco = endereco
    }
}
