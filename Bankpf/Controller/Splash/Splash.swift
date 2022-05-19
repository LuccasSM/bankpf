//
//  ViewController.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 16/05/22.
//

import UIKit

class Splash: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .colorDefault
        
        self.view.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 300),
            image.heightAnchor.constraint(equalToConstant: 100),
            image.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    // MARK: Views da tela
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        return image
    }()
    
    // MARK: Remover Orientação de tela
    
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    // MARK: Chamando a PréLogin
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
            self.animated()
        })
    }
            
    private func animated() {
        UIView.animate(withDuration: 0, animations: {
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                    let controller = PreLogin()
                    controller.modalPresentationStyle = .fullScreen
                    controller.modalTransitionStyle = .crossDissolve
                    self.present(controller, animated: false, completion: nil)
                    let transition = CATransition()
                    transition.duration = 0.5
                    self.view.window!.layer.add(transition, forKey: kCATransition)
                })
            }
        })
    }
}
