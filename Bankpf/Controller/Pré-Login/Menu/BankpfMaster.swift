//
//  BankpfMaster.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 14/06/22.
//

import UIKit

class BankpfMaster: UIViewController {
    private let reuseIdentifier = "BankpfMasterOptionCell"
    
    var tableView: UITableView!
    var delegate: BankpfMaster?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .grayDefault
        title = "bankpf Master"
        
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
        
        // MARK: Ajustes de Layout de Elementos
        
        self.view.addSubview(cartao)
        self.view.addSubview(text)
        configureTableView()
            
        NSLayoutConstraint.activate([
            buttonLeft.widthAnchor.constraint(equalToConstant: 17),
            buttonLeft.heightAnchor.constraint(equalToConstant: 17),
            
            cartao.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100),
            cartao.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            cartao.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50),
            cartao.heightAnchor.constraint(equalToConstant: 142),
            
            text.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15),
            text.topAnchor.constraint(equalTo: self.cartao.bottomAnchor, constant: 50),
        ])
    }
    
    // MARK: Views da tela
    
    private lazy var buttonLeft: UIButton = {
        let button: UIButton = UIButton(type: UIButton.ButtonType.custom)
        button.adjustsImageWhenHighlighted = false
        button.setImage(UIImage(named: "close-white"), for: UIControl.State.normal)
        return button
    }()
    
    private lazy var cartao: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "card-visa-bankpfmaster-black")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var text: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Para ter uma conta Master com \nnós, você precisa ter os \nseguintes itens:"
        lbl.textColor = .colorDefault
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BankpfMasterOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 50
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .grayDefault
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 25),
        ])
    }
    
    // MARK: Navegacoes da tela
    
    @objc func returnButton() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

extension BankpfMaster: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! BankpfMasterOptionCell
        cell.selectionStyle = .none
        
        let menuOption = OpcoesBankpfMaster(rawValue: indexPath.row)
        cell.descriptionLabel.text = menuOption?.description
        
        return cell
    }
}
