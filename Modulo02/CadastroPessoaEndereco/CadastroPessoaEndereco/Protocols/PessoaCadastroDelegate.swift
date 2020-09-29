//
//  PessoaCadastroDelegate.swift
//  CadastroPessoaEndereco
//
//  Created by Rafael Nascimento Sampaio on 28/09/20.
//

import Foundation

protocol PessoaCadastroDelegate {
    func adicionaPessoa(pessoa: Pessoa) -> Void
}
