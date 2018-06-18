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
    
    private var imageChecked: UIImage?
    private var imageUncheck: UIImage?
    
    //// Public box and text for customing view
    public let box = UIImageView()
    public let text = UILabel()
    
    var delegate: ((_ state: Bool) -> Void)? {
        get { return callback }
        set (callback) { self.callback = callback }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        custom()
    }
    
    func custom() {
        //// init default image
        let bundle = Bundle(for: type(of: self))
        imageChecked = UIImage(named: "CheckedBox", in: bundle, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        imageUncheck = UIImage(named: "UncheckBox", in: bundle, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
        
        box.tintColor = UIColor.black
        box.image = imageUncheck
        box.translatesAutoresizingMaskIntoConstraints = false
        addSubview(box)
        NSLayoutConstraint.activate([
            box.heightAnchor.constraint(equalToConstant: 20),
            box.widthAnchor.constraint(equalToConstant: 20),
            box.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            box.leftAnchor.constraint(equalTo: self.leftAnchor),
            ])
        
        text.text = "Content"
        text.translatesAutoresizingMaskIntoConstraints = false
        addSubview(text)
        NSLayoutConstraint.activate([
            text.leftAnchor.constraint(equalTo: box.rightAnchor),
            text.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            text.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            text.rightAnchor.constraint(equalTo: self.rightAnchor)
            ])
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(click(checkbox:))))
    }
    
    @objc private func click(checkbox: MCheckbox) {
        if check {
            box.image = imageUncheck
        } else {
            box.image = imageChecked
        }
        check = !check
        callback?(check)
    }
    
//    var boxColor: UIColor {
//        get { return box.tintColor }
//        set (color) {box.tintColor = color }
//    }
    
    override func prepareForInterfaceBuilder() {
        custom()
        super.prepareForInterfaceBuilder()
        
    }
}
