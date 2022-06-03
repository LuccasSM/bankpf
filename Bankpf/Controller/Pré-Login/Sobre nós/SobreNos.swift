//
//  SobreNos.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 16/05/22.
//

import UIKit

class SobreNos: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .grayDefault
        
    // MARK: Cores do navigatorBar
        
        if let navigationBar = navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            navigationBar.scrollEdgeAppearance = appearance
            appearance.backgroundColor = .colorDefault
            appearance.titleTextAttributes = [.foregroundColor: UIColor.grayDefault]
            navigationItem.standardAppearance = appearance
            navigationItem.scrollEdgeAppearance = appearance
        }
        
    // MARK: - Inserindo itens ao ScrollView
        
        self.view.addSubview(header)
        self.header.addSubview(logo)
        self.header.addSubview(close)
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(scrollViewContainer)
        self.scrollViewContainer.addArrangedSubview(text)
        self.scrollViewContainer.addArrangedSubview(versionApp)
        
        NSLayoutConstraint.activate([
            header.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            header.topAnchor.constraint(equalTo: self.view.topAnchor),
            header.heightAnchor.constraint(equalToConstant: 80),
            
            logo.widthAnchor.constraint(equalToConstant: 145),
            logo.heightAnchor.constraint(equalToConstant: 50),
            logo.centerXAnchor.constraint(equalTo: self.header.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: self.header.centerYAnchor),
            
            close.widthAnchor.constraint(equalToConstant: 17),
            close.heightAnchor.constraint(equalToConstant: 17),
            close.leadingAnchor.constraint(equalTo: self.header.leadingAnchor, constant: 20),
            close.centerYAnchor.constraint(equalTo: self.header.centerYAnchor),
                        
            scrollView.topAnchor.constraint(equalTo: self.header.bottomAnchor, constant: 30),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30),
            
            scrollViewContainer.topAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.bottomAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -2 * 30),
            scrollViewContainer.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            versionApp.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -10),
        ])
    }
    
    // MARK: Views da tela
    
    private lazy var header: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorDefault
        view.layer.zPosition = 2
        return view
    }()
    
    private lazy var logo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.adjustsImageWhenHighlighted = false
        button.setTitle("Sobre nós", for: .normal)
        button.setTitleColor(.grayDefault, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
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
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var text: UILabel = {
        let text = TermsPolicy().text()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var versionApp: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Versão do App: 4.6.46"
        lbl.font = UIFont(name: "AssociateSans-Light", size: 12)
        return lbl
    }()
    
    // MARK: Navegacoes da tela
    
    @objc func returnButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
