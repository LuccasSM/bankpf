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
        tl.font = UIFont(name: "AssociateSans-Light", size: 14)
        tl.textColor = .colorDefault
        tl.numberOfLines = 0
        return tl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(img)
        contentView.addSubview(title)
        
        img.widthAnchor.constraint(equalToConstant: 25).isActive = true
        img.heightAnchor.constraint(equalToConstant: 25).isActive = true
        img.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        img.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20).isActive = true
        
        title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17).isActive = true
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
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
