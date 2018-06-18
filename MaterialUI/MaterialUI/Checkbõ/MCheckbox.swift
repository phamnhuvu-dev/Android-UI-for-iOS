//
//  MCheckbox.swift
//  MaterialUI
//
//  Created by Phạm Như Vũ on 6/18/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import UIKit

@IBDesignable
class MCheckbox: UIView {
    
    private var callback: ((_ state: Bool) -> Void)?
    private var check: Bool = false
    
    let title = UILabel()
    let imageChecked = UIImage(named: "CheckedBox")
    let imageUncheck = UIImage(named: "UncheckBox")
    let box = UIImageView()
    
    var delegate: ((_ state: Bool) -> Void)? {
        get { return callback }
        set (callback) { self.callback = callback }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        custom()
    }
    
    func custom() {
        box.image = imageUncheck
        box.translatesAutoresizingMaskIntoConstraints = false
        addSubview(box)
        NSLayoutConstraint.activate([
            box.heightAnchor.constraint(equalToConstant: 20),
            box.widthAnchor.constraint(equalToConstant: 20),
            box.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            box.leftAnchor.constraint(equalTo: self.leftAnchor),
            ])
        
        title.text = "Content"
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        NSLayoutConstraint.activate([
            title.leftAnchor.constraint(equalTo: box.rightAnchor),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.rightAnchor.constraint(equalTo: self.rightAnchor)
            ])
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(click)))
    }
    
    @objc func click() {
        if check {
            box.image = imageUncheck
        } else {
            box.image = imageChecked
        }
        check = !check
        callback?(check)
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        custom()
        box.prepareForInterfaceBuilder()
        title.prepareForInterfaceBuilder()
    }
}
