//
//  Error.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 23/05/22.
//

import UIKit

class Error: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(viewWhite)
        self.viewWhite.addSubview(image)
        self.viewWhite.addSubview(titleView)
        self.viewWhite.addSubview(textView)
        self.viewWhite.addSubview(button)
        
        NSLayoutConstraint.activate([
            viewWhite.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            viewWhite.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            viewWhite.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50),
            viewWhite.heightAnchor.constraint(equalToConstant: 370),
            
            image.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            image.topAnchor.constraint(equalTo: self.viewWhite.topAnchor, constant: 32),
            image.widthAnchor.constraint(equalToConstant: 80),
            image.heightAnchor.constraint(equalToConstant: 80),
            
            titleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleView.bottomAnchor.constraint(equalTo: self.textView.topAnchor, constant: -30),
            
            textView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textView.bottomAnchor.constraint(equalTo: self.button.topAnchor, constant: -40),
            
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 90),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: self.viewWhite.bottomAnchor, constant: -32),
        ])
    }
    
    private lazy var image: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "error")
        return image
    }()
    
    private lazy var viewWhite: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .grayDefault
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var titleView: UILabel = {
        let text = UILabel(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Erro!"
        text.font = UIFont.boldSystemFont(ofSize: 22)
        text.textColor = .black
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    private lazy var textView: UILabel = {
        let text = UILabel(frame: .zero)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Por favor, certifique-se que \npreencheu os dados corretamente"
        text.font = UIFont.systemFont(ofSize: 16)
        text.textColor = .colorDefault
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    private lazy var button: UIButton = {
        let button = Buttons().button()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .colorDefault
        button.setTitle("Voltar", for: .normal)
        button.addTarget(self, action: #selector(returnButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Navegacoes da tela
    
    @objc func returnButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
