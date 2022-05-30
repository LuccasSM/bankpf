//
//  AuthService.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 30/05/22.
//

import Foundation
import Firebase

struct AuthCredentials {
    let name: String
    let email: String
    let cpf: String
    let data: String
    let password: String
    let confirmPassword: String
}

struct AuthService {
    static let shared = AuthService()
    
    func registerUser(credentials: AuthCredentials, completion: @escaping(Error?, DatabaseReference) -> Void) {
        let name = credentials.name
        let email = credentials.email
        let cpf = credentials.cpf
        let data = credentials.data
        let password = credentials.password
        let confirmPassword = credentials.confirmPassword
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Debug: Error is \(error.localizedDescription)")
                return
            }
            
            guard let uid = result?.user.uid else { return }
            let values = ["name": name, "email": email, "cpf": cpf, "data": data, "password": password, "confirmPassword": confirmPassword]
            
            REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: completion)
        }
    }
}
