//
//  Colors.swift
//  Bankpf
//
//  Created by Luccas Santana Marinho on 16/05/22.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static let colorDefault = UIColor.rgb(red: 55, green: 73, blue: 154)
    static let grayDefault = UIColor.rgb(red: 245, green: 245, blue: 245)
    static let grayTransferencias = UIColor.rgb(red: 233, green: 233, blue: 233)
}
