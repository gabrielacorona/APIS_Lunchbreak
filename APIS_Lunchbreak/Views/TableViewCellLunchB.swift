//
//  TableViewCellLunchB.swift
//  APIS_Lunchbreak
//
//  Created by Andres Genda on 18/05/21.
//

import UIKit

class TableViewCellLunchB: UITableViewCell {
    
    @IBOutlet weak var lbLuncherName: UILabel!
    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var leftBar: UIView!
    @IBOutlet weak var btnJoin: UIButton!
    
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbToEat: UILabel!
    @IBOutlet weak var lbLocation: UILabel!
    @IBOutlet weak var lbJoined: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Profile Image Customization
        imgProfilePic.layer.borderWidth = 0
        imgProfilePic.layer.masksToBounds = false
        imgProfilePic.layer.cornerRadius = imgProfilePic.frame.height/2
        imgProfilePic.clipsToBounds = true
        
        //Join Button Customization
        btnJoin.layer.masksToBounds = false
        btnJoin.layer.cornerRadius = btnJoin.frame.height/2
        btnJoin.clipsToBounds = true
        btnJoin.layer.borderColor = CGColor(red: 250/255, green: 79/255, blue: 59/255, alpha: 1)
        btnJoin.layer.borderWidth = 2
        btnJoin.backgroundColor = .none
        btnJoin.tintColor = UIColor(red: 250/255, green: 79/255, blue: 59/255, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
