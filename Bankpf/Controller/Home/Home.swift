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
                self.labelName.text = "Olá, \(self.nome ?? "")"
            }
        }
    }
    var userDefault = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
    // MARK: Inserindo cores de fundo por baixo do Scroll
        
        let colorView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        colorView.addColors(colors: [.colorDefault, .grayDefault])
        view.addSubview(colorView)
        
        let logo = UIImage(named: "logo")
        let image = UIImageView(image: logo)
        
        let barButtonRight = UIBarButtonItem(customView: buttonRight)
        self.navigationItem.rightBarButtonItem = barButtonRight
        buttonRight.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        let barButtonLeft = UIBarButtonItem(customView: image)
        self.navigationItem.leftBarButtonItem = barButtonLeft
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(scrollViewContainer)
        self.view.addSubview(buttonRight)
        
        self.view.addSubview(viewUser)
        
        self.scrollViewContainer.addArrangedSubview(viewUserTwo)
        self.scrollViewContainer.addArrangedSubview(viewUserThree)
        self.scrollViewContainer.addArrangedSubview(viewUserFour)
        self.scrollViewContainer.addArrangedSubview(viewUserFive)
        self.scrollViewContainer.addArrangedSubview(viewUserSix)
        
        self.viewUser.addSubview(labelName)
            
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 135),
            image.heightAnchor.constraint(equalToConstant: 150),
            
            buttonRight.widthAnchor.constraint(equalToConstant: 70),
            buttonRight.heightAnchor.constraint(equalToConstant: 40),
            
            viewUser.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            viewUser.heightAnchor.constraint(equalToConstant: 0.001),
            viewUser.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            viewUser.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: self.viewUser.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            scrollViewContainer.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.bottomAnchor),
            scrollViewContainer.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            
            labelName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            labelName.centerYAnchor.constraint(equalTo: self.viewUserTwo.centerYAnchor),
            
            viewUserTwo.heightAnchor.constraint(equalToConstant: 120),
            
            viewUserThree.heightAnchor.constraint(equalToConstant: 150),
            
            viewUserFour.heightAnchor.constraint(equalToConstant: 150),
            
            viewUserFive.heightAnchor.constraint(equalToConstant: 150),
            
            viewUserSix.heightAnchor.constraint(equalToConstant: 150),
        ])
        
        fetchUser()
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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var subScrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private lazy var buttonRight: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "sign-out"), for: .normal)
        button.setTitle("Sair", for: .normal)
        button.titleLabel?.font = UIFont(name: "AssociateSans-Light", size: 18)
        button.imageEdgeInsets = UIEdgeInsets(top: 11, left: 9, bottom: 11, right: 41)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        button.adjustsImageWhenHighlighted = false
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return button
    }()
    
    private lazy var viewUser: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .colorDefault
        return view
    }()
    
    private lazy var viewUserTwo: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()
    
    private lazy var viewUserThree: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    private lazy var viewUserFour: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        return view
    }()
    
    private lazy var viewUserFive: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemCyan
        return view
    }()
    
    private lazy var viewUserSix: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Olá, "
        label.textColor = .grayDefault
        label.font = .systemFont(ofSize: 16)
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
        guard let id = Auth.auth().currentUser?.uid else { return }
        
        if let userName = getUser() {
            self.nome = userName
        } else {
            Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
                if let dictionary = snapshot.value as? [String: AnyObject], snapshot.key == id {
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

    // MARK: Extensao da Cor de fundo

extension UIView {
    func addColors(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds

        var colorsArray: [CGColor] = []
        var locationsArray: [NSNumber] = []
        for (index, color) in colors.enumerated() {
            colorsArray.append(color.cgColor)
            colorsArray.append(color.cgColor)
            locationsArray.append(NSNumber(value: (1.0 / Double(colors.count)) * Double(index)))
            locationsArray.append(NSNumber(value: (1.0 / Double(colors.count)) * Double(index + 1)))
        }

        gradientLayer.colors = colorsArray
        gradientLayer.locations = locationsArray

        self.backgroundColor = .clear
        self.layer.addSublayer(gradientLayer)
        self.layer.masksToBounds = true
    }
}
