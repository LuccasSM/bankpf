//
//  PreLogin.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 16/05/22.
//


import UIKit

class PreLogin: UIViewController {
    
    let tabBar = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .colorDefault
        
        self.view.addSubview(buttonLeft)
        self.view.addSubview(buttonRight)
        self.view.addSubview(text)
        self.view.addSubview(buttonLetsGo)
        self.view.addSubview(buttonClient)
        self.view.addSubview(one)
        self.view.addSubview(two)
        self.view.addSubview(three)
        self.one.addSubview(imgOne)
        self.two.addSubview(imgTwo)
        self.three.addSubview(imgThree)
        
        NSLayoutConstraint.activate([
            buttonLeft.widthAnchor.constraint(equalToConstant: 145),
            buttonLeft.heightAnchor.constraint(equalToConstant: 50),
            buttonLeft.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15),
            buttonLeft.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            
            buttonRight.widthAnchor.constraint(equalToConstant: 20),
            buttonRight.heightAnchor.constraint(equalToConstant: 20),
            buttonRight.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 25),
            buttonRight.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            
            text.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -70),
            text.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            
            buttonLetsGo.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            buttonLetsGo.heightAnchor.constraint(equalToConstant: 60),
            buttonLetsGo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonLetsGo.bottomAnchor.constraint(equalTo: self.buttonClient.safeAreaLayoutGuide.topAnchor, constant: -20),
            
            buttonClient.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            buttonClient.heightAnchor.constraint(equalToConstant: 60),
            buttonClient.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonClient.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -85),
            
            one.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            one.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.091),
            one.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            two.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            two.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.091),
            two.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            two.leadingAnchor.constraint(equalTo: self.one.trailingAnchor),
            
            three.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
            three.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.091),
            three.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            three.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            imgOne.widthAnchor.constraint(equalToConstant: 20),
            imgOne.heightAnchor.constraint(equalToConstant: 20),
            imgOne.centerXAnchor.constraint(equalTo: self.one.centerXAnchor),
            imgOne.centerYAnchor.constraint(equalTo: self.one.centerYAnchor, constant: -12),
            
            imgTwo.widthAnchor.constraint(equalToConstant: 20),
            imgTwo.heightAnchor.constraint(equalToConstant: 20),
            imgTwo.centerXAnchor.constraint(equalTo: self.two.centerXAnchor),
            imgTwo.centerYAnchor.constraint(equalTo: self.two.centerYAnchor, constant: -12),
            
            imgThree.widthAnchor.constraint(equalToConstant: 20),
            imgThree.heightAnchor.constraint(equalToConstant: 20),
            imgThree.centerXAnchor.constraint(equalTo: self.three.centerXAnchor),
            imgThree.centerYAnchor.constraint(equalTo: self.three.centerYAnchor, constant: -12),
        ])
    }
    
    // MARK: Views da tela
    
    private lazy var buttonLeft: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.adjustsImageWhenHighlighted = false
        button.setImage(UIImage(named: "logo"), for: UIControl.State.normal)
        return button
    }()
    
    private lazy var buttonRight: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.adjustsImageWhenHighlighted = false
        button.setImage(UIImage(named: "menu"), for: UIControl.State.normal)
        return button
    }()
    
    private lazy var text: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Que bom te encontrar \npor aqui :) \nAgora, vamos começar?"
        text.font = .systemFont(ofSize: 26)
        text.numberOfLines = 0
        text.textColor = .grayDefault
        return text
    }()
    
    private lazy var buttonLetsGo: UIButton = {
        let button = Buttons().button()
        button.backgroundColor = .grayDefault
        button.setTitle("Criar minha conta!", for: .normal)
        button.setTitleColor(.colorDefault, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonClient: UIButton = {
        let button = Buttons().button()
        button.backgroundColor = .colorDefault
        button.setTitle("Já sou cliente bankpf", for: .normal)
        button.setTitleColor(.grayDefault, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(clientBankpf), for: .touchUpInside)
        return button
    }()
    
    // MARK: TabBar inferior
    
    private lazy var one: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .colorDefault
        button.adjustsImageWhenHighlighted = false
        button.setTitle("Transferências", for: .normal)
        button.titleLabel?.font = UIFont(name: "AssociateSans-Light", size: 12)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -17, right: 0)
        button.addTarget(self, action: #selector(transferencias), for: .touchUpInside)
        return button
    }()
    
    private lazy var two: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .colorDefault
        button.adjustsImageWhenHighlighted = false
        button.setTitle("Sobre nós", for: .normal)
        button.titleLabel?.font = UIFont(name: "AssociateSans-Light", size: 12)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -17, right: 0)
        button.addTarget(self, action: #selector(sobreNos), for: .touchUpInside)
        return button
    }()
    
    private lazy var three: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .colorDefault
        button.adjustsImageWhenHighlighted = false
        button.setTitle("Agências", for: .normal)
        button.titleLabel?.font = UIFont(name: "AssociateSans-Light", size: 12)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -17, right: 0)
        button.addTarget(self, action: #selector(agencias), for: .touchUpInside)
        return button
    }()
    
    private lazy var imgOne: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "transferir")
        return image
    }()
    
    private lazy var imgTwo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "informacoes")
        return image
    }()
    
    private lazy var imgThree: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "location")
        return image
    }()
    
    // MARK: Navegacoes da tela
    
    @objc func createAccount() {
        let controller = CreateAccount()
        let navVC = UINavigationController(rootViewController: controller)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    @objc func clientBankpf() {
        let controller = ClientBankpf()
        let navVC = UINavigationController(rootViewController: controller)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    @objc func transferencias() {
        let controller = Transferencias()
        let navVC = UINavigationController(rootViewController: controller)
        navVC.modalPresentationStyle = .fullScreen
        navVC.modalTransitionStyle = .crossDissolve
        self.present(navVC, animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.2
        self.view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    @objc func sobreNos() {
        present(SobreNos(), animated: true)
    }
    
    @objc func agencias() {
        let controller = Agencias()
        let navVC = UINavigationController(rootViewController: controller)
        navVC.modalPresentationStyle = .fullScreen
        navVC.modalTransitionStyle = .crossDissolve
        self.present(navVC, animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.2
        self.view.window!.layer.add(transition, forKey: kCATransition)
    }
}
