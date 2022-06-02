//
//  OpcoesMenu.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 01/06/22.
//

import UIKit

enum OpcoesMenu: Int, CustomStringConvertible {
    case bankpfMaster
    case bankpfDefault
    case cartaoCredito
    case solicitarLimite
    case token
    case gerenciamento
    case cep

    var description: String {
        switch self {
            case .bankpfMaster: return "bankpf Master"
            case .bankpfDefault: return "bankpf Default"
            case .cartaoCredito: return "Cartão de crédito"
            case .solicitarLimite: return "Solicitar + limite"
            case .token: return "Token do meu cartão"
            case .gerenciamento: return "Gerenciamento"
            case .cep: return "CEP"
        }
    }

    var image: UIImage {
        switch self {
            case .bankpfMaster: return UIImage(named: "user-master") ?? UIImage()
            case .bankpfDefault: return UIImage(named: "user-default") ?? UIImage()
            case .cartaoCredito: return UIImage(named: "cartao-credito") ?? UIImage()
            case .solicitarLimite: return UIImage(named: "solicitar-limite") ?? UIImage()
            case .token: return UIImage(named: "token") ?? UIImage()
            case .gerenciamento: return UIImage(named: "gerenciamento") ?? UIImage()
            case .cep: return UIImage(named: "cep") ?? UIImage()
        }
    }
}
