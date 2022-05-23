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
        
        NSLayoutConstraint.activate([
            buttonLeft.widthAnchor.constraint(equalToConstant: 17),
            buttonLeft.heightAnchor.constraint(equalToConstant: 17),
        ])
    }
    
    // MARK: Views da tela
    
    private lazy var buttonLeft: UIButton = {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.adjustsImageWhenHighlighted = false
        button.setImage(UIImage(named: "close-white"), for: UIControl.State.normal)
        return button
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
