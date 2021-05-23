//
//  VCLogin.swift
//  APIS_Lunchbreak
//
//  Created by Caro Obregon on 18/05/21.
//

import UIKit

class VCLogin: UIViewController {

    @IBOutlet weak var signin: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    var usersDB = [User]()
    var currUser = User()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        getInfo()
//        emailF?.layer.cornerRadius = 15.0
//        passF?.layer.cornerRadius = 20.0

        // Do any additional setup after loading the view.
    }
    
    func getInfo(){
        DatabaseManager.shared.getUsuarios{ (users) in
            self.usersDB = users
        }
    }
    

    @IBAction func signInPressed(_ sender: UIButton) {
        let emailtext = email.text
        let passtext = password.text
        if emailtext!.isEmpty && passtext!.isEmpty {
            let alert = UIAlertController(title: "Fill out form", message: "Please enter email and password before continuing", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            }))
            self.present(alert, animated: true, completion: nil)
           
        }else{
            var found = false
            for u in usersDB{
                if(u.email == email.text && u.password == password.text){
                    found = true
                    currUser = u
                }
            }
            if found == false{
                let alert = UIAlertController(title: "User not found", message: "Incorrect credentials, try again or sign up", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vistaHome = segue.destination as! ViewControllerProfile
//        vistaHome.currUser = currUser
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
