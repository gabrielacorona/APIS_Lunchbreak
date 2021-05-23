//
//  VCJoinLunchB.swift
//  APIS_Lunchbreak
//
//  Created by Caro Obregon on 22/05/21.
//

import UIKit

class VCJoinLunchB: UIViewController {

    @IBOutlet weak var luncherName: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var attending: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attending?.layer.cornerRadius = 10
        attending?.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
