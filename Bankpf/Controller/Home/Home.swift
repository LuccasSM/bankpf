//
//  Home.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 30/05/22.
//

import UIKit
import Firebase
import FirebaseAuth

class Home: UIViewController {
    var nome: String? {
        didSet {
            DispatchQueue.main.async {
                self.label.text = "Olá, \(self.nome ?? "")"
            }
        }
    }
    var userDefault = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .grayDefault
            
        self.view.addSubview(button)
        self.view.addSubview(label)
            
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            label.topAnchor.constraint(equalTo: self.button.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        fetchUser()
    }
        
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Toque", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return button
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Olá, "
        label.textColor = .colorDefault
        label.font = .systemFont(ofSize: 18)
        return label
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
    
    // MARK: Passando nome do user via Firebase
    
    func fetchUser() {
        if let userName = getUser() {
            self.nome = userName
        } else {
            Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    if let userDictionary = dictionary.first(where: { $0.key == "name" }) {
                        self.nome = userDictionary.value as? String
                        self.saveUser()
                    }
                }
            }, withCancel: nil)
        }
    }
    
    // MARK: Salvando nome do usuário via cache
    
    func saveUser() {
        if let id = Auth.auth().currentUser?.uid {
            userDefault.set(nome, forKey: id)
        }
    }
    
    func getUser() -> String? {
        if let id = Auth.auth().currentUser?.uid {
            if let user = userDefault.object(forKey: id) as? String {
                return user
            }
        }; return nil
    }
}
