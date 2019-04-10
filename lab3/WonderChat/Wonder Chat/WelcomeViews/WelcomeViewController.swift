//
//  WelcomeViewController.swift
//  Wonder Chat
//
//

import UIKit
import ProgressHUD

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordtextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK: IBActions
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        dismissKeyboard()
        
        if emailTextField.text != "" && passwordtextField.text != "" {
            
            loginUser()
        } else {
            
            ProgressHUD.showError("Email and Password are missing!")
        }
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        
        if emailTextField.text != "" && passwordtextField.text != "" && repeatPasswordTextField.text != "" {
            
            
            if passwordtextField.text == repeatPasswordTextField.text {
                
                registerUser()

            } else {
                ProgressHUD.showError("Passwords don't match!")
            }
            
        } else {
            
            ProgressHUD.showError("All fields are required!")
        }
        
        dismissKeyboard()
    }
    
    @IBAction func backgroundTap(_ sender: Any) {
        dismissKeyboard()
    }
    
    //MARK: HelpedFunctions
    
    func loginUser() {
        
        ProgressHUD.show("Login...")
        
        FUser.loginUserWith(email: emailTextField.text!, password: passwordtextField.text!) { (error) in
            
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            
            self.goToApp()
            
        }
    }
    
    func registerUser() {
        
        performSegue(withIdentifier: "welcomeToFinishReg", sender: self)
        
        cleanTextFields()
        dismissKeyboard()
        
    }
    
    func dismissKeyboard() {
        
        self.view.endEditing(false)
    }
    
    func cleanTextFields() {
        emailTextField.text = ""
        passwordtextField.text = ""
        repeatPasswordTextField.text = ""
    }
    //MARK: GoToApp
    
    func goToApp() {
        
        ProgressHUD.dismiss()
        
        cleanTextFields()
        dismissKeyboard()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: USER_DID_LOGIN_NOTIFICATION), object: nil, userInfo: [kUSERID:FUser.currentId()])

        
        let mainView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainApplication") as! UITabBarController
        
        self.present(mainView,animated: true,completion: nil)
        
    }
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "welcomeToFinishReg" {
            
            let vc = segue.destination as! FinishRegistrationViewController
            
            vc.email = emailTextField.text!
            vc.password = passwordtextField.text!
            
        }
        
    }
    
}
