//
//  VCEditFood.swift
//  APIS_Lunchbreak
//
//  Created by Caro Obregon on 22/05/21.
//

import UIKit

class VCEditFood: UIViewController {

    @IBOutlet weak var btnMexican: SelectionButton!
    @IBOutlet weak var btnItalian: SelectionButton!
    @IBOutlet weak var btnVegan: SelectionButton!
    @IBOutlet weak var btnAsian: SelectionButton!
    @IBOutlet weak var btnHealthy: SelectionButton!
    @IBOutlet weak var btnOther: SelectionButton!
    var btnArray : [SelectionButton] = []
    var boolFood : [Bool] = [true, false, false, true, false, false]
    override func viewDidLoad() {
        super.viewDidLoad()
        btnArray = [btnMexican, btnItalian, btnVegan, btnAsian, btnHealthy, btnOther]
        assignBtnIds()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    var ogTrues : [Int] = [0,0,0,0,0,0]
    
    func assignBtnIds(){
        var cont = 0
        for i in btnArray {
            i.id = cont
            if(!boolFood[cont]){
                i.layer.borderColor = .none
                i.layer.borderWidth = 0
                i.border.strokeColor = .none
                ogTrues[cont] = -999
            }else{
                i.setSelected()
            }
            cont += 1
        }
    }
    
    @IBAction func selectFavFood(_ sender: SelectionButton) {
        
        if ogTrues[sender.id] == -999{
            ogTrues[sender.id] = 0
        } else {
            print("entering", sender.id, boolFood[sender.id])
            boolFood[sender.id] = boolFood[sender.id] ? false : true
        }
    }

    @IBAction func saveFavFoods(_ sender: Any) {
        print("SAVING FOOD", boolFood)
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
