//
//  VCMain.swift
//  APIS_Lunchbreak
//
//  Created by Gaby Corona on 5/17/21.
//

import UIKit

class VCMain: UIViewController {

    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var newAcc: UIButton!
    @IBOutlet weak var humilde: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInBtn?.layer.cornerRadius = 20
        signInBtn?.clipsToBounds = true

        let underlineAttriString = NSAttributedString(string: "New Account",
                                                  attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        newAcc?.titleLabel?.attributedText = underlineAttriString
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
