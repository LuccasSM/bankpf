//
//  Transferencias.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 16/05/22.
//

import UIKit

class Transferencias: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .grayDefault
        title = "Transferências"
        
    // MARK: Cores do navigatorBar
        
        if let navigationBar = navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .colorDefault
            appearance.titleTextAttributes = [.foregroundColor: UIColor.grayDefault]
            navigationBar.scrollEdgeAppearance = appearance
        }
        
    // MARK: Botoes do navigatorBar
        
        let barButtonRight = UIBarButtonItem(customView: buttonRight)
        self.navigationItem.leftBarButtonItem = barButtonRight
        buttonRight.addTarget(self, action: #selector(returnButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonLeft.widthAnchor.constraint(equalToConstant: 135),
            buttonLeft.heightAnchor.constraint(equalToConstant: 50),
            
            buttonRight.widthAnchor.constraint(equalToConstant: 17),
            buttonRight.heightAnchor.constraint(equalToConstant: 17),
        ])
    }
    
    // MARK: Views da tela
    
    private lazy var buttonLeft: UIButton = {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.adjustsImageWhenHighlighted = false
        button.setImage(UIImage(named: "logo"), for: UIControl.State.normal)
        return button
    }()
    
    private lazy var buttonRight: UIButton = {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.adjustsImageWhenHighlighted = false
        button.setImage(UIImage(named: "close-white"), for: UIControl.State.normal)
        return button
    }()
    
    // MARK: Navegacoes da tela
    
    @objc func returnButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
