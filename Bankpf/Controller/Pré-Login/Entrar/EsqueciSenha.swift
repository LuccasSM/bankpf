//
//  EsqueciSenha.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 23/05/22.
//

import UIKit

class EsqueciSenha: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .grayDefault
        title = "Esqueci minha senha"
        
    // MARK: Cores do navigatorBar
        
        if let navigationBar = navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            navigationBar.scrollEdgeAppearance = appearance
            appearance.backgroundColor = .colorDefault
            appearance.titleTextAttributes = [.foregroundColor: UIColor.grayDefault]
            navigationItem.standardAppearance = appearance
            navigationItem.scrollEdgeAppearance = appearance
        }
        
    // MARK: Botoes do navigatorBar
                
        let barButtonLeft = UIBarButtonItem(customView: buttonLeft)
        self.navigationItem.leftBarButtonItem = barButtonLeft
        buttonLeft.addTarget(self, action: #selector(returnButton), for: .touchUpInside)
        
    // MARK: Removendo Keyboard
            
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
    // MARK: - Inserindo itens ao ScrollView
        
        self.view.addSubview(textVazio)
        self.view.addSubview(tfEmail)
        self.view.addSubview(buttonEnviar)
        
        NSLayoutConstraint.activate([
            buttonLeft.widthAnchor.constraint(equalToConstant: 20),
            buttonLeft.heightAnchor.constraint(equalToConstant: 20),
            
            textVazio.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 35),
            textVazio.bottomAnchor.constraint(equalTo: self.tfEmail.topAnchor, constant: -10),

            tfEmail.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            tfEmail.heightAnchor.constraint(equalToConstant: 60),
            tfEmail.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tfEmail.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100),

            buttonEnviar.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            buttonEnviar.heightAnchor.constraint(equalToConstant: 60),
            buttonEnviar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonEnviar.topAnchor.constraint(equalTo: self.tfEmail.bottomAnchor, constant: 30),
        ])
    }
    
    // MARK: Views da tela
    
    private lazy var buttonLeft: UIButton = {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.adjustsImageWhenHighlighted = false
        button.setImage(UIImage(named: "left"), for: UIControl.State.normal)
        return button
    }()

    private lazy var close: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.adjustsImageWhenHighlighted = false
        button.setImage(UIImage(named: "close-white"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(returnButton), for: .touchUpInside)
        return button
    }()

    private lazy var textVazio: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "É necessário preencher algum valor"
        text.textColor = .redDefault
        text.font = .systemFont(ofSize: 11)
        text.isHidden = true
        return text
    }()

    private lazy var tfEmail: UITextField = {
        let tf = TextField().tf()
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu E-mail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.colorDefault])
        return tf
    }()

    private lazy var buttonEnviar: UIButton = {
        let button = Buttons().button()
        button.backgroundColor = .colorDefault
        button.setTitle("Enviar", for: .normal)
        button.setTitleColor(.grayDefault, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(enviarEmail), for: .touchUpInside)
        return button
    }()
    
    // MARK: Navegacoes da tela
    
    @objc func returnButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func enviarEmail() {
        if self.tfEmail.validateEmail() {
            self.present(Success(), animated: true)
        } else {
            if let text = tfEmail.text, !text.isEmpty {
                self.present(Error(), animated: true)
                textVazio.isHidden = true
            } else {
                textVazio.isHidden = false
            }
        }
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
}

extension UITextField {
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validateRegex.evaluate(with: self.text)
    }
}
