//
//  ClientBankpf.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 18/05/22.
//

import UIKit

class ClientBankpf: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .grayDefault
        let logo = UIImage(named: "logo")
        let image = UIImageView(image: logo)
        image.widthAnchor.constraint(equalToConstant: 135).isActive = true
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.navigationItem.titleView = image
        
    // MARK: Removendo Keyboard
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
    // MARK: Cores do navigatorBar
            
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.grayDefault
        ]
        navigationBarAppearance.backgroundColor = UIColor.colorDefault
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        
    // MARK: Botoes do navigatorBar
            
        let barButtonLeft = UIBarButtonItem(customView: buttonLeft)
        self.navigationItem.leftBarButtonItem = barButtonLeft
        buttonLeft.addTarget(self, action: #selector(returnButton), for: .touchUpInside)
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(tfEmail)
        self.view.addSubview(tfSenha)
        self.tfSenha.addSubview(olhoImageSenha)
        self.view.addSubview(buttonEntrar)
        self.view.addSubview(esqueciSenha)
        
        NSLayoutConstraint.activate([
            buttonLeft.widthAnchor.constraint(equalToConstant: 17),
            buttonLeft.heightAnchor.constraint(equalToConstant: 17),
            
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            titleLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.35),
            
            tfEmail.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            tfEmail.heightAnchor.constraint(equalToConstant: 60),
            tfEmail.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tfEmail.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100),
            
            tfSenha.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            tfSenha.heightAnchor.constraint(equalToConstant: 60),
            tfSenha.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tfSenha.topAnchor.constraint(equalTo: self.tfEmail.bottomAnchor, constant: 30),
            
            olhoImageSenha.widthAnchor.constraint(equalToConstant: 60),
            olhoImageSenha.heightAnchor.constraint(equalToConstant: 60),
            
            esqueciSenha.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            esqueciSenha.topAnchor.constraint(equalTo: self.tfSenha.bottomAnchor, constant: 30),
            
            buttonEntrar.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            buttonEntrar.heightAnchor.constraint(equalToConstant: 60),
            buttonEntrar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonEntrar.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }
    
    // MARK: Travando o limite de caracteres para o UITextField
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 6
        let currentString: NSString = tfSenha.text! as NSString
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    // MARK: Views da tela
    
    private lazy var buttonLeft: UIButton = {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.adjustsImageWhenHighlighted = false
        button.setImage(UIImage(named: "close-white"), for: UIControl.State.normal)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Acessar sua conta"
        lbl.textColor = .colorDefault
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    private lazy var tfEmail: UITextField = {
        let tf = TextField().tf()
        tf.attributedPlaceholder = NSAttributedString(string: "E-mail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.colorDefault])
        return tf
    }()
    
    private lazy var tfSenha: UITextField = {
        let tf = TextField().tf()
        tf.delegate = self
        tf.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.colorDefault])
        tf.keyboardType = .asciiCapableNumberPad
        tf.isSecureTextEntry = true
        tf.rightView = olhoImageSenha
        tf.rightViewMode = .always
        return tf
    }()
    
    private lazy var olhoImageSenha: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "olho-aberto"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 18, left: 28, bottom: 18, right: 10)
        button.addTarget(self, action: #selector(mostrarOcultarSenha), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonEntrar: UIButton = {
        let button = Buttons().button()
        button.backgroundColor = .colorDefault
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.grayDefault, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(returnButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var esqueciSenha: UILabel = {
        let lbl = UILabel()
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(senhaEsqueci))
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.underlineStyle: 1,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium),
            NSAttributedString.Key.foregroundColor: UIColor.colorDefault
        ]
        let underlineAttributedString = NSAttributedString(string: "Esqueci minha senha", attributes: attributes)
        lbl.attributedText = underlineAttributedString
        lbl.isUserInteractionEnabled = true
        lbl.textColor = .colorDefault
        lbl.addGestureRecognizer(tapAction)
        return lbl
    }()
    
    // MARK: Navegacoes da tela

    @objc func returnButton() {
        let navVC = PreLogin()
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    @objc func senhaEsqueci() {
        let controller = EsqueciSenha()
        let navVC = UINavigationController(rootViewController: controller)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    // MARK: Lógicas
    
    @objc func mostrarOcultarSenha() {
        if tfSenha.isSecureTextEntry == false {
            olhoImageSenha.setImage(UIImage(named: "olho-aberto"), for: .normal)
            tfSenha.isSecureTextEntry = true
        } else {
            olhoImageSenha.setImage(UIImage(named: "olho-fechado"), for: .normal)
            tfSenha.isSecureTextEntry = false
        }
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
}
