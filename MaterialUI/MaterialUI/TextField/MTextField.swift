//
//  MTextField.swift
//  MaterialUI
//
//  Created by Phạm Như Vũ on 6/18/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import UIKit

@IBDesignable
class MTextField: UITextField, UITextFieldDelegate {
    
    private var mEditing: Bool = false
    private let mUnderline = UIView()
    private var mUnderlineColor: UIColor! = UIColor.black
    private var mUnderlineColorHighLight: UIColor!
    private var mUnderlineSize: CGFloat! = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        custom()
    }
    
    func custom () {
        delegate = self
        borderStyle = .none
        mUnderline.translatesAutoresizingMaskIntoConstraints = false
        mUnderline.backgroundColor = mUnderlineColor
        addSubview(mUnderline)
        NSLayoutConstraint.activate([
            mUnderline.leftAnchor.constraint(equalTo: self.leftAnchor),
            mUnderline.rightAnchor.constraint(equalTo: self.rightAnchor),
            mUnderline.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mUnderline.heightAnchor.constraint(equalToConstant: mUnderlineSize)
            ])
    }
    
    @IBInspectable var underlineColor: UIColor? {
        get { return mUnderlineColor }
        set (color) {
            self.mUnderlineColor = color
            mUnderline.backgroundColor = color
        }
    }
    
    @IBInspectable var underlineColorHighLight: UIColor? {
        get { return mUnderlineColorHighLight }
        set (color) { self.mUnderlineColorHighLight = color }
    }
    
    @IBInspectable var underlineSize: CGFloat {
        get { return mUnderlineSize }
        set (size) {
            self.mUnderlineSize = size
            mUnderline.heightAnchor.constraint(equalToConstant: size).isActive = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        changeUnderlineColor()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        changeUnderlineColor()
    }

    private func changeUnderlineColor() {
        if mEditing == isEditing { return }
        if (isEditing) {
            mUnderline.backgroundColor = mUnderlineColorHighLight
        } else {
            mUnderline.backgroundColor = mUnderlineColor
        }
        mEditing = isEditing
    }

    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        custom()
    }
}
