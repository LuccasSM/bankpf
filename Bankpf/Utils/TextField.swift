//
//  TextField.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 23/05/22.
//

import UIKit

class TextField: UITextField {
    func tf() -> UITextField {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderWidth = 1
        tf.layer.borderColor = CGColor(red: 55/255, green: 73/255, blue: 154/255, alpha: 1)
        tf.layer.cornerRadius = 10
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftViewMode = .always
        tf.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.rightViewMode = .always
        return tf
    }
}
