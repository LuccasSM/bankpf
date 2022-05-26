//
//  TextFieldSenhas.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 25/05/22.
//

import UIKit

class TextFieldSenhas: UITextField {
    func tf() -> UITextField {
        let tf = UITextField(frame: .zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderWidth = 1
        tf.layer.borderColor = CGColor(red: 55/255, green: 73/255, blue: 154/255, alpha: 1)
        tf.layer.cornerRadius = 10
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftViewMode = .always
        tf.keyboardType = .asciiCapableNumberPad
        tf.rightViewMode = .always
        tf.isSecureTextEntry = true
        return tf
    }
}
