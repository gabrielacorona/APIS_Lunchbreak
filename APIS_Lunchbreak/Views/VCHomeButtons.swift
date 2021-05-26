
//
//  VCHomeButtons.swift
//  APIS_Lunchbreak
//
//  Created by Gaby Corona on 5/25/21.
//

import UIKit

class VCHomeButtons: UIViewController {
    var currUser = User()
    var usersDB = [User]()
    
    @IBOutlet weak var viewFriendsLunchbreaks: UIButton!
    @IBOutlet weak var viewProfile: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        userFname.text = currUser.fName
        // Do any additional setup after loading the view.
        getInfo()
    }

    func getInfo(){
        DatabaseManager.shared.getUsuarios{ (users) in
            self.usersDB = users
        }
    }



    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let vistaProfile = segue.destination as? ViewControllerProfile {
            vistaProfile.currUser = currUser
        }

        if let getLunches = segue.destination as? TVCViewLunchbreaks{
            getLunches.currUser = currUser
        }
//        if let vistaFriends = segue.destination as! ViewControllerMyFriends{
//            vistaFriends.currUser = currUser
//        }

    }


}
