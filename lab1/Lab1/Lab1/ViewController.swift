//
//  ViewController.swift
//  Lab1
//
//  Created by jake on 3/26/19.
//  Copyright © 2019 KhrystynaNestor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func sayHelloButton(_ sender: UIButton) {
        
        print("sayHelloButton was tapped")
        
        if helloLabel.isHidden == false {
            helloLabel.isHidden = true
            print ("Label was hidden")
        } else {
            helloLabel.isHidden = false
            sender.isEnabled = true
            print ("Label was shown")
        }
    }
    
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloLabel.isHidden = true
        print ("Label is hidden by default")
    }
    
    func square(_ num : inout Int) {
        num *= num
    }
}

