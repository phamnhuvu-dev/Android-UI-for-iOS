//
//  MTextField.swift
//  MaterialUI
//
//  Created by Phạm Như Vũ on 6/18/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import UIKit

@IBDesignable
class MTextField: UITextField {
    
    let underline = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        custom()
    }
    
    func custom () {
        borderStyle = .none
        underline.translatesAutoresizingMaskIntoConstraints = false
        underline.backgroundColor = UIColor.black
        addSubview(underline)
        NSLayoutConstraint.activate([
            underline.leftAnchor.constraint(equalTo: self.leftAnchor),
            underline.rightAnchor.constraint(equalTo: self.rightAnchor),
            underline.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            underline.heightAnchor.constraint(equalToConstant: 1)
            ])
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        custom()
        underline.prepareForInterfaceBuilder()
    }

}
