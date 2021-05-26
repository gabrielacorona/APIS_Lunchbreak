//
//  ViewControllerFavoritePlaces.swift
//  APIS_Lunchbreak
//
//  Created by Andres Genda on 22/05/21.
//

import UIKit

protocol protocolAddPlace {
    func addPlace(place: Lugar)
}

class ViewControllerFavoritePlaces: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var currUser = User()


    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var tfLocation: UITextField!
    @IBOutlet weak var btnDone: UIButton!
    
    var categorySelected: String!
    
    var delegate: protocolAddPlace!
    
    var categoryList = ["Mexican", "Italian", "Vegan", "Asian", "Healthy", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.dataSource = self
        pickerView.delegate = self
        btnDone.layer.cornerRadius = 20
    }
    

    @IBAction func cancelAdd(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selected = pickerView.selectedRow(inComponent: 0)
        categorySelected = categoryList[selected]
    }
    
    @IBAction func addPlace(_ sender: UIButton) {
        if (tfName.text != nil) && (tfLocation.text != nil)  {
            let pl = Lugar(nombre: tfName.text!, categoria: categorySelected, ubicacion: tfLocation.text!)
//            delegate.addPlace(place: pl)
//            dismiss(animated: true, completion: nil)
            addFavs()
        }
        
        
    }
    func addFavs(){
        let temp = [
            "name":tfName.text,
            "typeFood":categorySelected,
            "description":tfLocation.text
         ]
        DatabaseManager.shared.editFavPlace(id:currUser.id,favPlaces:temp)
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
