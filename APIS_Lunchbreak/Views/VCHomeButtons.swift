//
//  VCHomeButtons.swift
//  APIS_Lunchbreak
//
//  Created by Gaby Corona on 5/25/21.
//

import UIKit

class VCHomeButtons: UIViewController {
    var currUser = User()

    @IBOutlet weak var viewFriendsLunchbreaks: UIButton!
    @IBOutlet weak var viewProfile: UIButton!
    @IBOutlet weak var userFname: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        userFname.text = currUser.fName
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if var vistaProfile = segue.destination as? ViewControllerProfile {
            vistaProfile.currUser = currUser
        }else{
            var vistaFriends = segue.destination as! ViewControllerMyFriends
            vistaFriends.currUser = currUser
        }
       
    }
    

}
