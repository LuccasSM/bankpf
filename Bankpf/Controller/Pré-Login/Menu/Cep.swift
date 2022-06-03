//
//  Cep.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 02/06/22.
//

import UIKit

class Cep: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .grayDefault
        title = "CEP"
        
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
        
    // MARK: Removendo Keyboard
                
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(scrollViewContainer)
        self.view.addSubview(titleLabel)
        self.scrollViewContainer.addArrangedSubview(tF)
        self.scrollViewContainer.addArrangedSubview(logradouro)
        self.scrollViewContainer.addArrangedSubview(bairro)
        self.scrollViewContainer.addArrangedSubview(localidade)
        self.scrollViewContainer.addArrangedSubview(ddd)
        self.scrollViewContainer.addArrangedSubview(statusFinal)
        self.scrollViewContainer.addArrangedSubview(button)
        
    // MARK: Ajustes de Layout de Elementos
        
        NSLayoutConstraint.activate([
            buttonLeft.widthAnchor.constraint(equalToConstant: 17),
            buttonLeft.heightAnchor.constraint(equalToConstant: 17),
        
            titleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
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
            
            tF.heightAnchor.constraint(equalToConstant: 60),
            
            logradouro.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            logradouro.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            
            bairro.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            bairro.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            
            localidade.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            localidade.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            
            ddd.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            ddd.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            
            statusFinal.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            statusFinal.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15),
            
            button.heightAnchor.constraint(equalToConstant: 60),
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
        lbl.text = "Pesquise logo abaixo:"
        lbl.textColor = .colorDefault
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    private lazy var tF: UITextField = {
        let tf = TextField().tf()
        tf.attributedPlaceholder = NSAttributedString(string: "Digite um CEP...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.colorDefault])
        tf.keyboardType = .numberPad
        tf.delegate = self
        return tf
    }()
    
    private lazy var logradouro: UILabel = {
        let logradouro = UILabel(frame: .zero)
        logradouro.translatesAutoresizingMaskIntoConstraints = false
        logradouro.text = "Logradouro:"
        logradouro.font = UIFont.boldSystemFont(ofSize: 18)
        logradouro.textColor = .colorDefault
        return logradouro
    }()
    
    private lazy var bairro: UILabel = {
        let bairro = UILabel(frame: .zero)
        bairro.translatesAutoresizingMaskIntoConstraints = false
        bairro.text = "Bairro:"
        bairro.font = UIFont.boldSystemFont(ofSize: 18)
        bairro.textColor = .colorDefault
        return bairro
    }()
    
    private lazy var localidade: UILabel = {
        let localidade = UILabel(frame: .zero)
        localidade.translatesAutoresizingMaskIntoConstraints = false
        localidade.text = "Localidade:"
        localidade.font = UIFont.boldSystemFont(ofSize: 18)
        localidade.textColor = .colorDefault
        return localidade
    }()
    
    private lazy var ddd: UILabel = {
        let ddd = UILabel(frame: .zero)
        ddd.translatesAutoresizingMaskIntoConstraints = false
        ddd.text = "DDD:"
        ddd.font = UIFont.boldSystemFont(ofSize: 18)
        ddd.textColor = .colorDefault
        return ddd
    }()
    
    private lazy var statusFinal: UILabel = {
        let statusFinal = UILabel(frame: .zero)
        statusFinal.translatesAutoresizingMaskIntoConstraints = false
        statusFinal.text = "Status do CEP:"
        statusFinal.font = UIFont.boldSystemFont(ofSize: 18)
        statusFinal.textColor = .colorDefault
        statusFinal.isHidden = true
        return statusFinal
    }()
    
    private lazy var button: UIButton = {
        let button = Buttons().button()
        button.backgroundColor = .colorDefault
        button.setTitle("Pesquisar", for: .normal)
        button.setTitleColor(.grayDefault, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pesquisarApi), for: .touchUpInside)
        return button
    }()
    
    // MARK: Navegacoes da tela
    
    @objc func returnButton() {
        let vc = PreLogin()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    // MARK: Funcao no botao de Pesquisar
    
    @objc func pesquisarApi() {
        APIViaCep.pesquisarCEP(tF.text!) { res in
            switch res {
                case .success(let cep):
                DispatchQueue.main.async {
                    self.logradouro.text = "Logradouro: \(cep.logradouro)"
                    self.bairro.text = "Bairro: \(cep.bairro)"
                    self.localidade.text = "Localidade: \(cep.localidade)-\(cep.uf)"
                    self.ddd.text = "DDD: \(cep.ddd)"
                    self.statusFinal.text = "Status do CEP: Válido"
                    self.statusFinal.textColor = .systemGreen
                    self.statusFinal.isHidden = false
                }
            case .failure:
                DispatchQueue.main.async {
                    self.logradouro.text = "Logradouro: ?"
                    self.bairro.text = "Bairro: ?"
                    self.localidade.text = "Localidade: ?"
                    self.ddd.text = "DDD: ?"
                    self.statusFinal.text = "Status do CEP: Inválido"
                    self.statusFinal.textColor = .systemRed
                    self.statusFinal.isHidden = false
                }
            }
        }
    }
}

extension Cep: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var appendString = ""
        var maxLength = 9
        
    // MARK: Máscara do CPF
        
        if textField.placeholder == "Digite um CEP..." {
            guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
                return false
            }
            
            if range.length == 0 {
                switch range.location {
                case 5:
                    appendString = "-"
                default:
                    break
                }
            }
            
            textField.text?.append(appendString)
            
            if textField.placeholder == "Digite um CEP..." {
                maxLength = 9
            }
        };
        
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        return newString.count <= maxLength
    }
}
