//
//  Buttons.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 17/05/22.
//

import UIKit

class Buttons: UIButton {
    func button() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.adjustsImageWhenHighlighted = false
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.layer.cornerRadius = 10
        return button
    }
}
