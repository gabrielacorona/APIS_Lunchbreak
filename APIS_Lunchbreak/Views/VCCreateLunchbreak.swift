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
    
    @IBOutlet weak var btnItalian: SelectionButton!
    @IBOutlet weak var btnMexican: SelectionButton!
    @IBOutlet weak var btnVegan: SelectionButton!
    @IBOutlet weak var btnOther: SelectionButton!
    @IBOutlet weak var btnHealthy: SelectionButton!
    @IBOutlet weak var btnAsian: SelectionButton!
    
    var foodType: [String: Bool] = [:]

    
    var joinedBy :[String] = ["ana"]
    var timeToString : String = ""
    var typeFood : String = ""
    
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
        DatabaseManager.shared.createLunchbreak(host: host.text!, joinedBy: joinedBy, location: location.text!, placeName: "na", time: timeToString, whatToEat: getListFood())
      
        getListFood()
        let alert = UIAlertController(title: "Lunchbreak Created", message: "Lunchbreak Created Successfully.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func addMexicanBtn(_ sender: Any) {
        addFood(type: "Mexican", btn: btnMexican)
    }
    
    @IBAction func addVeganBtn(_ sender: Any) {
        addFood(type: "Vegan", btn: btnVegan)
    }
    
    @IBAction func addOtherBtn(_ sender: Any) {
        addFood(type: "Other", btn: btnOther)
    }
    
    @IBAction func addItalian(_ sender: Any) {
        addFood(type: "Italian", btn: btnItalian)
    }
    
    @IBAction func addHealthy(_ sender: Any) {
        addFood(type: "Healthy", btn: btnHealthy)
    }
    
    @IBAction func addAsian(_ sender: Any) {
        addFood(type: "Asian", btn: btnAsian)
    }
    
    func addFood(type: String, btn: SelectionButton){
        if btn.isSelected == true {
            print(type, "des")
            foodType[type] = false
            btn.isSelected = false
        } else{
            print(type, "sel")
            foodType[type] = true
            btn.isSelected = true
        }
        print("dict", foodType)
    }
    
    func getListFood() -> String {
        for i in foodType{
            if(i.value == true){
                typeFood += i.key
                typeFood +=  ", "
            }
        }
        return typeFood
    }
    // todo delete last comma
}
