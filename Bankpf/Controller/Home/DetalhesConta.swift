//
//  DetalhesConta.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 08/06/22.
//

import UIKit

class DetalhesConta: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(viewWhite)
        self.viewWhite.addSubview(close)
        self.viewWhite.addSubview(titleView)
        self.viewWhite.addSubview(textView)
        
        NSLayoutConstraint.activate([
            viewWhite.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            viewWhite.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            viewWhite.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50),
            viewWhite.heightAnchor.constraint(equalToConstant: 370),
            
            close.topAnchor.constraint(equalTo: self.viewWhite.topAnchor, constant: 25),
            close.leadingAnchor.constraint(equalTo: self.viewWhite.leadingAnchor, constant: 25),
            close.widthAnchor.constraint(equalToConstant: 22),
            close.heightAnchor.constraint(equalToConstant: 22),
            
            titleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleView.topAnchor.constraint(equalTo: self.close.bottomAnchor, constant: 30),
            
            textView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 30),
        ])
    }
    
    private lazy var close: UIButton = {
        let close = UIButton()
        close.translatesAutoresizingMaskIntoConstraints = false
        close.setImage(UIImage(named: "close-blue"), for: .normal)
        close.addTarget(self, action: #selector(returnButton), for: .touchUpInside)
        return close
    }()
    
    private lazy var viewWhite: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .grayDefault
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var titleView: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Detalhes da minha conta"
        text.font = UIFont.boldSystemFont(ofSize: 22)
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    private lazy var textView: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Precisamos dos seus dados para \nlhe conhecer melhor, pois será \nnosso futuro cliente. \n\nAh, mas, fique tranquilo, pois aqui \nninguém terá acesso a eles, \nsegurança e privacidade para nós \né indispensável!"
        text.font = UIFont.systemFont(ofSize: 16)
        text.textColor = .colorDefault
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    // MARK: - Navegacoes da tela
    
    @objc func returnButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
