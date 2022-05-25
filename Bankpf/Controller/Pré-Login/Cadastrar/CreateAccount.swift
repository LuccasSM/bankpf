//
//  createAccount.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 18/05/22.
//

import UIKit

class CreateAccount: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .grayDefault
        let logo = UIImage(named: "logo")
        let image = UIImageView(image: logo)
        image.widthAnchor.constraint(equalToConstant: 135).isActive = true
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.navigationItem.titleView = image
        
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
        self.scrollViewContainer.addArrangedSubview(tfCPF)
        self.scrollViewContainer.addArrangedSubview(tfData)
        self.scrollViewContainer.addArrangedSubview(tfSenha)
        self.scrollViewContainer.addArrangedSubview(tfConfirmarSenha)
        self.scrollViewContainer.addArrangedSubview(tfConfirmarSenha)
        self.view.addSubview(porqueDados)
        
        NSLayoutConstraint.activate([
            buttonLeft.widthAnchor.constraint(equalToConstant: 17),
            buttonLeft.heightAnchor.constraint(equalToConstant: 17),
            
            titleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: self.titleLabel.safeAreaLayoutGuide.bottomAnchor, constant: 40),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30),
            
            scrollViewContainer.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -2 * 30),
            scrollViewContainer.topAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.bottomAnchor, constant: -60),
            scrollViewContainer.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            tfNome.heightAnchor.constraint(equalToConstant: 60),
            
            tfCPF.heightAnchor.constraint(equalToConstant: 60),
            
            tfData.heightAnchor.constraint(equalToConstant: 60),
            
            tfSenha.heightAnchor.constraint(equalToConstant: 60),
            
            tfConfirmarSenha.heightAnchor.constraint(equalToConstant: 60),
            
            porqueDados.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            porqueDados.heightAnchor.constraint(equalToConstant: 50),
            porqueDados.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            porqueDados.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
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

    private lazy var tfCPF: UITextField = {
        let tf = TextField().tf()
        tf.attributedPlaceholder = NSAttributedString(string: "CPF", attributes: [NSAttributedString.Key.foregroundColor: UIColor.colorDefault])
        tf.keyboardType = .asciiCapableNumberPad
        return tf
    }()

    private lazy var tfData: UITextField = {
        let tf = TextField().tf()
        tf.attributedPlaceholder = NSAttributedString(string: "Data de nascimento", attributes: [NSAttributedString.Key.foregroundColor: UIColor.colorDefault])
        tf.keyboardType = .asciiCapableNumberPad
        return tf
    }()

    private lazy var tfSenha: UITextField = {
        let tf = TextField().tf()
        tf.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.colorDefault])
        tf.keyboardType = .asciiCapableNumberPad
        return tf
    }()

    private lazy var tfConfirmarSenha: UITextField = {
        let tf = TextField().tf()
        tf.attributedPlaceholder = NSAttributedString(string: "Confirmar senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.colorDefault])
        tf.keyboardType = .asciiCapableNumberPad
        return tf
    }()

    private lazy var porqueDados: UILabel = {
        let lbl = UILabel()
//        let tapAction = UITapGestureRecognizer(target: self, action: #selector(senhaEsqueci))

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
//        lbl.addGestureRecognizer(tapAction)
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
}
