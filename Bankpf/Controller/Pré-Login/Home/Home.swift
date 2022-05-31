//
//  Home.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 30/05/22.
//

import UIKit

class Home: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .grayDefault
            
        self.view.addSubview(button)
            
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
        
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Toque", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return button
    }()
        
    @objc func showAlert() {
        let alert = UIAlertController(title: "Deseja sair da sua conta?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .default))
        
        alert.addAction(UIAlertAction(title: "Sair", style: .destructive, handler: {action in
            let navVC = PreLogin()
            navVC.modalPresentationStyle = .fullScreen
            navVC.modalTransitionStyle = .flipHorizontal
            self.present(navVC, animated: true)
        }))
        
        present(alert, animated: true)
    }
}
