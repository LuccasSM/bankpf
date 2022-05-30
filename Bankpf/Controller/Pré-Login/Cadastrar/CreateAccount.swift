//
//  createAccount.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 18/05/22.
//

import UIKit
import Firebase
import JGProgressHUD

class CreateAccount: UIViewController {
    
    private let progress = JGProgressHUD(style: .dark)

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
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(scrollViewContainer)
        self.view.addSubview(titleLabel)
        self.scrollViewContainer.addArrangedSubview(tfNome)
        self.scrollViewContainer.addArrangedSubview(tfEmail)
        self.scrollViewContainer.addArrangedSubview(tfCPF)
        self.scrollViewContainer.addArrangedSubview(tfSenha)
        self.tfSenha.addSubview(olhoImageSenha)
        self.scrollViewContainer.addArrangedSubview(tfConfirmarSenha)
        self.tfConfirmarSenha.addSubview(olhoImageConfirmarSenha)
        self.scrollViewContainer.addArrangedSubview(buttonAvancar)
        self.scrollViewContainer.addArrangedSubview(porqueDados)
        
        NSLayoutConstraint.activate([
            buttonLeft.widthAnchor.constraint(equalToConstant: 17),
            buttonLeft.heightAnchor.constraint(equalToConstant: 17),
            
            titleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: self.titleLabel.safeAreaLayoutGuide.bottomAnchor, constant: 30),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30),
            
            scrollViewContainer.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -2 * 30),
            scrollViewContainer.topAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.bottomAnchor),
            scrollViewContainer.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            tfNome.heightAnchor.constraint(equalToConstant: 60),
            
            tfEmail.heightAnchor.constraint(equalToConstant: 60),
            
            tfCPF.heightAnchor.constraint(equalToConstant: 60),
            
            tfSenha.heightAnchor.constraint(equalToConstant: 60),
            
            olhoImageSenha.widthAnchor.constraint(equalToConstant: 60),
            olhoImageSenha.heightAnchor.constraint(equalToConstant: 60),
            
            tfConfirmarSenha.heightAnchor.constraint(equalToConstant: 60),
            
            olhoImageConfirmarSenha.widthAnchor.constraint(equalToConstant: 60),
            olhoImageConfirmarSenha.heightAnchor.constraint(equalToConstant: 60),
            
            buttonAvancar.heightAnchor.constraint(equalToConstant: 60),
            
            porqueDados.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    // MARK: Views da tela
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var subScrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buttonLeft: UIButton = {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.adjustsImageWhenHighlighted = false
        button.setImage(UIImage(named: "close-white"), for: UIControl.State.normal)
        return button
    }()

    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Criar minha conta"
        lbl.textColor = .colorDefault
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        return lbl
    }()

    private lazy var tfNome: UITextField = {
        let tf = TextField().tf()
        tf.attributedPlaceholder = NSAttributedString(string: "Nome completo", attributes: [NSAttributedString.Key.foregroundColor: UIColor.colorDefault])
        return tf
    }()
    
    private lazy var tfEmail: UITextField = {
        let tf = TextField().tf()
        tf.attributedPlaceholder = NSAttributedString(string: "E-mail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.colorDefault])
        return tf
    }()

    private lazy var tfCPF: UITextField = {
        let tf = TextField().tf()
        tf.delegate = self
        tf.attributedPlaceholder = NSAttributedString(string: "CPF", attributes: [NSAttributedString.Key.foregroundColor: UIColor.colorDefault])
        tf.keyboardType = .asciiCapableNumberPad
        return tf
    }()

    private lazy var tfSenha: UITextField = {
        let tf = TextFieldSenhas().tf()
        tf.delegate = self
        tf.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.colorDefault])
        tf.rightView = olhoImageSenha
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

    private lazy var tfConfirmarSenha: UITextField = {
        let tf = TextFieldSenhas().tf()
        tf.delegate = self
        tf.attributedPlaceholder = NSAttributedString(string: "Confirmar senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.colorDefault])
        tf.rightView = olhoImageConfirmarSenha
        return tf
    }()
    
    private lazy var olhoImageConfirmarSenha: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "olho-aberto"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 18, left: 28, bottom: 18, right: 10)
        button.addTarget(self, action: #selector(mostrarOcultarConfirmarSenha), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonAvancar: UIButton = {
        let button = Buttons().button()
        button.backgroundColor = .colorDefault
        button.setTitle("Avançar", for: .normal)
        button.setTitleColor(.grayDefault, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(enviarAccount), for: .touchUpInside)
        return button
        
    }()

    private lazy var porqueDados: UILabel = {
        let lbl = UILabel()
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(porqueDadosPage))

        lbl.translatesAutoresizingMaskIntoConstraints = false
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.underlineStyle: 1,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium),
            NSAttributedString.Key.foregroundColor: UIColor.colorDefault
        ]
        let underlineAttributedString = NSAttributedString(string: "Porque devo fornecer meus dados?", attributes: attributes)
        lbl.attributedText = underlineAttributedString
        lbl.isUserInteractionEnabled = true
        lbl.textColor = .colorDefault
        lbl.textAlignment = .center
        lbl.backgroundColor = .grayDefault
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
    
    @objc func enviarAccount() {
        progress.show(in: view)
        self.progress.dismiss()
        
        guard let name = tfNome.text else { return }
        guard let email = tfEmail.text else { return }
        guard let cpf = tfCPF.text else { return }
        guard let password = tfSenha.text else { return }
        guard let confirmPassword = tfConfirmarSenha.text else { return }
        
        let credentials = AuthCredentials(name: name, email: email, cpf: cpf, password: password, confirmPassword: confirmPassword)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.6, execute: {
            if self.tfNome.validateName() && self.tfEmail.validateEmail() && self.tfCPF.validateCPF() && self.tfSenha.validatePassword() && self.tfConfirmarSenha.validateConfirmPassword() && self.tfSenha.text == self.tfConfirmarSenha.text {
                AuthService.shared.registerUser(credentials: credentials) { (error, ref) in
                    self.present(SuccessCreateAccount(), animated: true)
                }
            } else {
                self.present(ErrorAccount(), animated: true)
            }
        });
    }
    
    @objc func porqueDadosPage() {
        self.present(PorqueDados(), animated: true)
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
    
    @objc func mostrarOcultarConfirmarSenha() {
        if tfConfirmarSenha.isSecureTextEntry == false {
            olhoImageConfirmarSenha.setImage(UIImage(named: "olho-aberto"), for: .normal)
            tfConfirmarSenha.isSecureTextEntry = true
        } else {
            olhoImageConfirmarSenha.setImage(UIImage(named: "olho-fechado"), for: .normal)
            tfConfirmarSenha.isSecureTextEntry = false
        }
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
}

    // MARK: Travando o limite de caracteres para o UITextField

extension CreateAccount: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var appendString = ""
        var maxLength = 6
        
    // MARK: Máscara do CPF
        
        if textField.placeholder == "CPF" {
            guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
                return false
            }
            
            if range.length == 0 {
                switch range.location {
                case 3:
                    appendString = "."
                case 7:
                    appendString = "."
                case 11:
                    appendString = "-"
                default:
                    break
                }
            }
            
            textField.text?.append(appendString)
            
            if textField.placeholder == "CPF" {
                maxLength = 14
            }
        };
        
    // MARK: Máscara da Data de nascimento
        
        if textField.placeholder == "Data de nascimento" {
            guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
                return false
            }
            
            if range.length == 0 {
                switch range.location {
                case 2:
                    appendString = "/"
                case 5:
                    appendString = "/"
                default:
                    break
                }
            }
            
            textField.text?.append(appendString)
            
            if textField.placeholder == "Data de nascimento" {
                maxLength = 10
            }
        };
        
    // MARK: Máscara da Senha
        
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        return newString.count <= maxLength
    }
}
