//
//  ValidatesAccount.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 26/05/22.
//

import UIKit

    // MARK: Validando campos de criar conta e acessar conta

extension UITextField {
    func validateName() -> Bool {
        let nameRegex = "[A-Za-z ]{3,1000}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return validateRegex.evaluate(with: self.text)
    }

    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validateRegex.evaluate(with: self.text)
    }
    
    func validateCPF() -> Bool {
        let cpfRegex = ".{14}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", cpfRegex)
        return validateRegex.evaluate(with: self.text)
    }

    func validatePassword() -> Bool {
        let passwordRegex = ".{6,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: self.text)
    }

    func validateConfirmPassword() -> Bool {
        let passwordRegex = ".{6,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return validateRegex.evaluate(with: self.text)
    }
}
