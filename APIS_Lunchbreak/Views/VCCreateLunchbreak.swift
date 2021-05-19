//
//  VCCreateLunchbreak.swift
//  APIS_Lunchbreak
//
//  Created by Gaby Corona on 5/18/21.
//

import UIKit

class VCCreateLunchbreak: UIViewController {

    @IBOutlet weak var tableViewJoin: UITableView!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var typeOfFood: UITextField!
    @IBOutlet weak var time: UIDatePicker!
    @IBOutlet weak var createLunchbreak: UIButton!
    @IBOutlet weak var host: UITextField!
    
    var joinedBy :[String] = []
    var timeToString : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create Lunchbreak"


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
    func donePick(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        timeToString = dateFormatter.string(from: time.date)
    }

    @IBAction func createNewLunchbreak(_ sender: Any) {
        DatabaseManager.shared.createLunchbreak(host: host.text!, joinedBy: joinedBy, location: location.text!, placeName: "na", time: timeToString, whatToEat: typeOfFood.text!)
      
       
        let alert = UIAlertController(title: "Lunchbreak Created", message: "Lunchbreak Created Successfully.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
}
