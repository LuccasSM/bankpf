//
//  ViewMenu.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 01/06/22.
//

import UIKit

class ViewMenu: UIViewController {
    private let reuseIdentifier = "MenuOptionCell"
    
    var tableView: UITableView!
    var delegate: PreLogin?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .grayDefault
        title = "Menu"
        
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
        
        self.view.addSubview(buttonLeft)
        configureTableView()
        
    // MARK: Ajustes de Layout de Elementos
        
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
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Ajustes de Layout relacionado a Table View
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuOpcionalCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = .grayTransferencias
        tableView.rowHeight = 70
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        tableView.separatorColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1.0)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
    }
}

    // MARK: Inserindo a Table View

extension ViewMenu: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOpcionalCell
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        let menuOption = OpcoesMenu(rawValue: indexPath.row)
        cell.iconImageView.image = menuOption?.image
        cell.descriptionLabel.text = menuOption?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 || indexPath.row == tableView.numberOfRows(inSection: indexPath.section) {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.bounds.width)
        }
    }
}
