//
//  ViewControllerMyFriends.swift
//  APIS_Lunchbreak
//
//  Created by Andres Genda on 18/05/21.
//

import UIKit

class ViewControllerMyFriends: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var currUser = User()
    var listaAmigos = ["Caro", "Gaba", "Andres", "Pau", "Cati"]
    var coloresDisponibles = [
        UIColor(red: 30/255, green: 205/255, blue: 140/255, alpha: 1),
        UIColor(red: 254/255, green: 205/255, blue: 86/255, alpha: 1),
        UIColor(red: 250/255, green: 79/255, blue: 59/255, alpha: 1),
        UIColor(red: 82/255, green: 74/255, blue: 255/255, alpha: 1),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAdd: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        print("curr user myfriends")
        print(currUser.fName)
        
        
        btnAdd.layer.cornerRadius = 20
        btnAdd.layer.borderColor = CGColor(red: 250/255, green: 79/255, blue: 59/255, alpha: 1)
        btnAdd.backgroundColor = UIColor(red: 250/255, green: 79/255, blue: 59/255, alpha: 1)
        btnAdd.tintColor = .white
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Métodos de Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currUser.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaLunchB") as! TableViewCellLunchB
        
        cell.lbLuncherName.text = currUser.friends[indexPath.row]
        cell.leftBar.backgroundColor = coloresDisponibles[indexPath.row]
        cell.lbLuncherName.textColor = coloresDisponibles[indexPath.row]
        
        coloresDisponibles.append(coloresDisponibles[indexPath.row])
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
