//
//  Transferencias.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 16/05/22.
//

import UIKit


    // MARK: Inserindo Itens da Collection

struct MyCustomData {
    var title: String
    var image: UIImage
}

class Transferencias: UIViewController {
    private lazy var itensPerRow: CGFloat = 2
    private lazy var sectionItens = UIEdgeInsets(top: 32, left: 16, bottom: 32, right: 16)
    
    private lazy var data = [
        MyCustomData(title: "Pix", image: Image.pix),
        MyCustomData(title: "Saldo", image: Image.saldo),
        MyCustomData(title: "Receber", image: Image.receber),
        MyCustomData(title: "DOC", image: Image.doc),
        MyCustomData(title: "TED", image: Image.ted),
        MyCustomData(title: "TEF", image: Image.tef),
        MyCustomData(title: "Poupança", image: Image.poupanca),
        MyCustomData(title: "Pagar: QrCode / \nCódigo de barras", image: Image.qrCode),
        MyCustomData(title: "Cheque especial", image: Image.cheque),
        MyCustomData(title: "Comprovantes", image: Image.comprovantes),
        MyCustomData(title: "Movimentações \nda bolsa", image: Image.bolsa),
        MyCustomData(title: "Transferir para \noutras instituições", image: Image.outras),
    ]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MyCustomCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = .grayTransferencias
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Transferências"
        setupView()
        
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
    
    func setupView() {
        view.addSubview(collectionView)
        setupConstraint()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupConstraint() {
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: Navegacoes da tela

    @objc func returnButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension Transferencias: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCustomCell
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 6
        cell.data = data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - (3 * 16)) / 2
        return CGSize(width: width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionItens
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
