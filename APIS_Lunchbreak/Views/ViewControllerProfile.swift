//
//  ViewControllerProfile.swift
//  APIS_Lunchbreak
//
//  Created by Andres Genda on 18/05/21.
//

import UIKit

class ViewControllerProfile: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, protocolAddPlace {
    
    var favPlaces = [Lugar]()
    let fvrPlaces = [
        [
            "name": "Lucy",
            "description": "Johnson",
            "typeFood": "Italiana"
        ],
        [
            "name": "Jane",
            "description": "Doe",
            "typeFood": "Mexican"
        ]
    ]
    @IBOutlet weak var lbNombre: UILabel!
    var currUser = User()
    @IBOutlet weak var lbOcupacion: UILabel!
    @IBOutlet weak var lbDescripcion: UILabel!
    
    @IBOutlet weak var btnMexican: SelectionButton!
    @IBOutlet weak var btnItalian: SelectionButton!
    @IBOutlet weak var btnVegan: SelectionButton!
    @IBOutlet weak var btnAsian: SelectionButton!
    @IBOutlet weak var btnHealthy: SelectionButton!
    @IBOutlet weak var btnOther: SelectionButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var arrayBtns : [SelectionButton] = []
    var boolFood : [Bool] = [true, true, false, false, true, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)

        
        print("curr user profile")
        print(currUser.fName)

        lbOcupacion.textColor = UIColor(red: 250/255, green: 79/255, blue: 59/255, alpha: 0.9)
        
        lbDescripcion.text = "My name is Dustin, I’m a young designer from New York. I usually have my lunchbreak at lunch time and always looking forward to trying new places"
        lbDescripcion.lineBreakMode = .byWordWrapping
        lbDescripcion.sizeToFit()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        arrayBtns = [btnMexican, btnItalian, btnVegan, btnAsian, btnHealthy, btnOther]
        setUpFavFoods()
    }
    
    func setUpFavFoods(){
        arrayBtns = [btnMexican, btnItalian, btnVegan, btnAsian, btnHealthy, btnOther]
        var cont = 0
        while(cont < arrayBtns.count){
            if(boolFood[cont]){
                arrayBtns[cont].setSelected()
            }else{
                arrayBtns[cont].setDeselected()
            }
            arrayBtns[cont].isEnabled = false
            cont += 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return favPlaces.count
        return fvrPlaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "col", for: indexPath) as! CollectionViewCellFavoritePlaces
        
        cell.lbName.text = fvrPlaces[indexPath.row]["name"]
        cell.lbCategory.text = fvrPlaces[indexPath.row]["typeFood"]
        cell.lbLocation.text = fvrPlaces[indexPath.row]["description"]
        
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "addFavPlace"{
            let favPlaces = segue.destination as! ViewControllerFavoritePlaces
//            favPlaces.currUser = currUser
        }
        if segue.identifier == "favFoods"{
            let editFood =  segue.destination as! VCEditFood
            //            editFood.currUser = currUser
        }
    }
    
    
    func addPlace(place: Lugar) {
        favPlaces.append(place)
        collectionView.reloadData()
    }

}
