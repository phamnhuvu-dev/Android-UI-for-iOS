//
//  DrawerNavigation.swift
//  MaterialUI
//
//  Created by Phạm Như Vũ on 6/19/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import UIKit

class DrawerNavigation: UIView {
    
    private var mIsOpen: Bool! = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func open(_ bool: Bool) {
        if bool {
            UIView.animate(withDuration: 1, animations: {
                self.frame.origin.x += self.frame.width
            })
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.frame.origin.x -= self.frame.width
            })
        }
    }
}
