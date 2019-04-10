//
//  ProfileViewTableViewController.swift
//  Wonder Chat
//
//  Created by jake on 4/7/19.
//  Copyright © 2019 Yurii Kozlov. All rights reserved.
//

import UIKit

class ProfileViewTableViewController: UITableViewController {
    
        @IBOutlet weak var fullNamelabel: UILabel!
        @IBOutlet weak var phoneNumberLabel: UILabel!
    
        @IBOutlet weak var messageButtonOutlet: UIButton!
        @IBOutlet weak var callButtonOutlet: UIButton!
        @IBOutlet weak var blockButtonOutlet: UIButton!
        @IBOutlet weak var avatarImageView: UIImageView!
    
    var user : FUser?
    
        override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    //MARK: IBActions
    
    @IBAction func callButtonPressed(_ sender: Any) {
        print("call user \(String(describing: user?.fullname))")
    }
    
    @IBAction func chatButtonPressed(_ sender: Any) {
        print("chat with user \(String(describing: user?.fullname))")
    }
    
    @IBAction func blockUserButtonPressed(_ sender: Any) {
        
        var currentBlockedIDs = FUser.currentUser()!.blockedUsers
        
        if currentBlockedIDs.contains(user!.objectId) {
            currentBlockedIDs.remove(at: currentBlockedIDs.index(of: user!.objectId)!)
        } else {
            currentBlockedIDs.append(user!.objectId)
        }
        
        updateCurrentUserInFirestore(withValues: [kBLOCKEDUSERID:currentBlockedIDs]) { (error) in
            
            
            if error != nil {
                print("error updating user \(error?.localizedDescription)")
                return
            }
            
            self.updateBlockStatus()
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 30
    }
    
    func setupUI() {
        
        if user != nil {
            self.title = "Profile"
            
            print(user!.fullname)
            
            fullNamelabel.text = user!.fullname
            phoneNumberLabel.text = user!.phoneNumber
            
            updateBlockStatus()
            
            imageFromData(pictureData: user!.avatar) { (avatarImage) in
                
                if avatarImage != nil {
                    self.avatarImageView.image = avatarImage!.circleMasked
                }
            }
        }
    }
    
    func updateBlockStatus() {
        
        if user!.objectId != FUser.currentId() {
            blockButtonOutlet.isHidden = false
            messageButtonOutlet.isHidden = false
            callButtonOutlet.isHidden = false
        } else {
            blockButtonOutlet.isHidden = true
            messageButtonOutlet.isHidden = true
            callButtonOutlet.isHidden = true
        }
        
        if FUser.currentUser()!.blockedUsers.contains(user!.objectId) {
            
            blockButtonOutlet.setTitle("Unblock User", for: .normal)
            
        } else {
            
            blockButtonOutlet.setTitle("Block User", for: .normal)
        }
    }
}
