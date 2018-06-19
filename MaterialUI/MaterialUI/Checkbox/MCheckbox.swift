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
    
    private var mDelegate: MCheckboxDelegate?
    private var mCheck: Bool = false
    
    //// Public box and text for customing view
    public let box = UIImageView()
    public let text = UILabel()
    
    private var imageChecked: UIImage?
    private var imageUncheck: UIImage?
    private var mBoxColor: UIColor! = UIColor.black
    private var mTextColor: UIColor! = UIColor.black
    
    
    @IBInspectable var boxColor: UIColor {
        get { return mBoxColor }
        set (color) {
            mBoxColor = color
            box.tintColor = color
        }
    }
    
    @IBInspectable var textColor: UIColor {
        get { return mTextColor }
        set (color) {
            mTextColor = color
            text.textColor = color
        }
    }
    
    @IBInspectable var check: Bool {
        get { return mCheck }
        set (check) {
            mCheck = check
            changeImage()
        }
    }
    
    var delegate: MCheckboxDelegate? {
        get { return mDelegate }
        set (delegate) { self.mDelegate = delegate }
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
        
        box.tintColor = mBoxColor
        changeImage()
        box.translatesAutoresizingMaskIntoConstraints = false
        addSubview(box)
        NSLayoutConstraint.activate([
            box.heightAnchor.constraint(equalToConstant: 20),
            box.widthAnchor.constraint(equalToConstant: 20),
            box.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            box.leftAnchor.constraint(equalTo: self.leftAnchor),
            ])
        
        text.textColor = mTextColor
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
    
    private func changeImage() {
        if mCheck {
            box.image = imageChecked
        } else {
            box.image = imageUncheck
        }
    }
    
    @objc private func click(checkbox: MCheckbox) {
        mCheck = !mCheck
        changeImage()
        mDelegate?.checkBox(checkbox: checkbox, isCheck: mCheck)
    }
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        custom()
    }
}
