//
//  MRadioButton.swift
//  MaterialUI
//
//  Created by Phạm Như Vũ on 6/18/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import UIKit

class MRadioButton: UIView {

    private var callback: ((_ state: Bool) -> Void)?
    private var check: Bool = false
    
    let title = UILabel()
    let imageChecked = UIImage(named: "Doted")
    let imageUncheck = UIImage(named: "Undot")
    let dot = UIImageView()
    
    var delegate: ((_ state: Bool) -> Void)? {
        get { return callback }
        set (callback) { self.callback = callback }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        custom()
    }
    
    func custom() {
        dot.image = imageUncheck
        dot.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dot)
        NSLayoutConstraint.activate([
            dot.heightAnchor.constraint(equalToConstant: 20),
            dot.widthAnchor.constraint(equalToConstant: 20),
            dot.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dot.leftAnchor.constraint(equalTo: self.leftAnchor),
            ])
        
        title.text = "Content"
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        NSLayoutConstraint.activate([
            title.leftAnchor.constraint(equalTo: dot.rightAnchor),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.rightAnchor.constraint(equalTo: self.rightAnchor)
            ])
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(click)))
    }
    
    @objc func click() {
        if check {
            dot.image = imageUncheck
        } else {
            dot.image = imageChecked
        }
        check = !check
        callback?(check)
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        custom()
        dot.prepareForInterfaceBuilder()
        title.prepareForInterfaceBuilder()
    }
}
