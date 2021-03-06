//
//  ApiViaCep.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 02/06/22.
//

import Foundation

enum CEPError: Error {
    case cepNotFound
}

class APIViaCep {
    class func pesquisarCEP(_ cep: String, completion: @escaping (Result <ItensCep,CEPError>) -> Void) {
        guard let url = URL(string: "https://viacep.com.br/ws/\(cep)/json/") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let cep = try JSONDecoder().decode(ItensCep.self, from: data)
                        completion(.success(cep))
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    completion(.failure(.cepNotFound))
                }
            } else {
                print(error!.localizedDescription)
            }
        }.resume()
    }
}
