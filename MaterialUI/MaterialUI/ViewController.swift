//
//  ViewController.swift
//  MaterialUI
//
//  Created by Phạm Như Vũ on 6/18/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dr: DrawerNavigation!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
            self.dr.layer.removeAllAnimations()
            
        }   
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.dr.open(false)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.dr.open(true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

