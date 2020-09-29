//
//  Endereco.swift
//  CadastroPessoaEndereco
//
//  Created by Rafael Nascimento Sampaio on 28/09/20.
//

import Foundation

class Endereco {
    var endereco: String
    var numero: String // O número está como string para permitir a pessoa adicionar por exemplo, Sem Número
    var complemento: String?
    var bairro: String
    var cidade: String
    var estado: String
    
    init(endereco: String, numero: String, complemento: String? = nil, bairro: String, cidade: String, estado: String) {
        self.endereco = endereco
        self.numero = numero
        self.complemento = complemento
        self.bairro = bairro
        self.cidade = cidade
        self.estado = estado
    }
    
    func descricao() -> String {
        var enderecoText = "\(self.endereco), nº \(self.numero)"
        if let complemento = self.complemento {
            enderecoText = "\(enderecoText)\n\(complemento)"
        }
        enderecoText += "\n\(self.bairro) - \(self.cidade)/\(self.estado)"
        return enderecoText
    }
}
