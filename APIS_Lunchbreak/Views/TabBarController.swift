//
//  TabBarController.swift
//  APIS_Lunchbreak
//
//  Created by Gaby Corona on 5/23/21.
//

import UIKit

class TabBarController: UITabBarController {
    var currUser = User()

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.selectedIndex = 1
        let vistaProfile = tabBarController?.viewControllers![1] as! ViewControllerProfile
        let vistaFriends = tabBarController?.viewControllers![1] as! ViewControllerMyFriends
        
        vistaProfile.currUser = currUser
        vistaFriends.currUser = currUser

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vistaHome = segue.destination as! TabBarController
//        vistaHome.currUser = currUser
//    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        print("hola")
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
