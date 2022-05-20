//
//  CollectionViewCell.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 20/05/22.
//

import UIKit

    //MARK: Itens da UICollectionView

class MyCustomCell: UICollectionViewCell {
    private lazy var img: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var title: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.textAlignment = .center
        tl.font = .systemFont(ofSize: 15, weight: .medium)
        tl.textColor = .colorDefault
        tl.numberOfLines = 0
        return tl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(img)
        contentView.addSubview(title)
        
        img.widthAnchor.constraint(equalToConstant: 30).isActive = true
        img.heightAnchor.constraint(equalToConstant: 30).isActive = true
        img.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        img.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20).isActive = true
        
        title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) não foi implementado")
    }
    
    var data: MyCustomData? {
        didSet {
            guard let data = data else { return }
            img.image = data.image
            title.text = data.title
        }
    }
}
