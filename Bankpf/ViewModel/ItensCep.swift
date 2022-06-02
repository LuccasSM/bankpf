//
//  ItensCep.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 02/06/22.
//

import Foundation

struct ItensCep: Decodable {
    var logradouro: String
    var bairro: String
    var localidade: String
    var uf: String
    var ddd: String
}
