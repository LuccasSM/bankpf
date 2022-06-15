//
//  OpcoesBankpfMaster.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 14/06/22.
//

import UIKit

enum OpcoesBankpfMaster: Int, CustomStringConvertible {
    case cartaoInternacional
    case renda
    case usarCredito
    case saldoMinimo
    case saldo
    case saque
    case acionista
    case relacionamento
    case transferencia
    case pixSemanal

    var description: String {
        switch self {
            case .cartaoInternacional: return "- Cartão de crédito internacional"
            case .renda: return "- Renda mensal de R$ 50.000,00"
            case .usarCredito: return "- R$ 10.000,00 cartão de crédito a.m"
            case .saldoMinimo: return "- Saldo mínimo poupança R$ 50.000,00"
            case .saldo: return "- Saldo R$ 50.000,00 conta corrente"
            case .saque: return "- Saque diferenciado Ex: dólar a.m"
            case .acionista: return "- Ser acionista ou ter ativos no bankpf"
            case .relacionamento: return "- Ter um bom relacionamento com nós"
            case .transferencia: return "- Transação mínima R$ 5.000,00 a.m"
            case .pixSemanal: return "- Pix semanal de R$ 1.000,00"
        }
    }
}
