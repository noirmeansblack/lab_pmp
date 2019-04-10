//
//  UserTableViewCell.swift
//  Wonder Chat
//
//  Created by jake on 4/6/19.
//  Copyright © 2019 Yurii Kozlov. All rights reserved.
//

import UIKit

protocol UserTableViewCellDelegate {
    func didtapAvatarImage(indexPath: IndexPath)
}

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    var indexPath: IndexPath!
    var delegate : UserTableViewCellDelegate?
    
    let tapGestureRecognizer = UITapGestureRecognizer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tapGestureRecognizer.addTarget(self, action: #selector(self.avatarTap))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGestureRecognizer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func generateCellWith(FUser: FUser, indexPath: IndexPath) {
        
        self.indexPath = indexPath
        
        self.fullNameLabel.text = FUser.fullname
        
        if FUser.avatar != "" {
            imageFromData(pictureData: FUser.avatar) { (avatarImage) in
                
                
                if avatarImage != nil {
                    self.avatarImageView.image = avatarImage!.circleMasked
                }
            }
        }

    }
    
    
    @objc func avatarTap() {
        
        delegate!.didtapAvatarImage(indexPath: indexPath)
        
    }

}
