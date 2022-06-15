//
//  BankpfMasterOptionalCell.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 14/06/22.
//

import UIKit

class BankpfMasterOptionCell: UITableViewCell {
    
    // MARK: Propriedades da Table View
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "AssociateSans-Light", size: 16)
        return label
    }()
    
    // MARK: Layout da Table View
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .grayDefault
        addSubview(descriptionLabel)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) não foi implementado")
    }
}
