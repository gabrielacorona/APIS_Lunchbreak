//
//  ViewControllerProfile.swift
//  APIS_Lunchbreak
//
//  Created by Andres Genda on 18/05/21.
//

import UIKit

class ViewControllerProfile: UIViewController {

    @IBOutlet weak var lbOcupacion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbOcupacion.textColor = UIColor(red: 250/255, green: 79/255, blue: 59/255, alpha: 0.9)
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
