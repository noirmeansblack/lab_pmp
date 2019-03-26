//
//  FinishRegistrationViewController.swift
//  Wonder Chat
//
//

import UIKit

class FinishRegistrationViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnametextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var email : String!
    var password : String!
    var avatarImage : UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(email, password)
    }

    
    @IBAction func cancelButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
    }
    
}
