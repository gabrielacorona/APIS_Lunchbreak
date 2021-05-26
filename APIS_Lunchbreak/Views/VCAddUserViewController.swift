//
//  VCAddUserViewController.swift
//  APIS_Lunchbreak
//
//  Created by Gaby Corona on 5/17/21.
//

import UIKit

class VCAddUserViewController: UIViewController {

    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var lName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var confirmPass: UITextField!
    @IBOutlet weak var createUser: UIButton!
    @IBOutlet weak var tfDescription: UITextField!
    @IBOutlet weak var btnMexican: SelectionButton!
    @IBOutlet weak var btnItalian: SelectionButton!
    @IBOutlet weak var btnVegan: SelectionButton!
    @IBOutlet weak var btnAsian: SelectionButton!
    @IBOutlet weak var btnOther: SelectionButton!
    @IBOutlet weak var btnHealthy: SelectionButton!
    var btnArray : [SelectionButton] = []
    var favFoods: [Bool] = [false,false,false,false,false,false]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create User"
        btnArray = [btnMexican, btnItalian, btnVegan, btnAsian,btnHealthy,btnOther]
        assignBtnIds()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addUser(_ sender: UIButton) {
    
//        if pass.text == confirmPass.text {
//            DatabaseManager.shared.createUser(fName:fName.text!,lName:lName.text!, email:email.text!, password:pass.text!, description:tfDescription.text!,phoneNum:"888-888-8888", favFoods:[false,false,false,false,false,false])
//        }else{
//            let alert = UIAlertController(title: "Passwords Don't Match", message: "Passwords Don't Match, Please Verify", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
//            }))
//            self.present(alert, animated: true, completion: nil)
//        }
//
        let alert = UIAlertController(title: "User Created", message: "User Created Successfully.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        }))
//        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func selectFavFood(_ sender: SelectionButton) {
        print(sender.id)
        favFoods[sender.id] = favFoods[sender.id] ? false : true
        print("fav foods", favFoods)
    }
    
    func assignBtnIds(){
        var cont = 0
        for i in btnArray {
            i.id = cont
            print(cont)
            cont += 1
        }
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
