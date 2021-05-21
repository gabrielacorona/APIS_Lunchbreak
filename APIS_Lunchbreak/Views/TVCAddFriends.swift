//
//  TVCAddFriends.swift
//  APIS_Lunchbreak
//
//  Created by Gaby Corona on 5/18/21.
//

import UIKit
class customTableViewCell:UITableViewCell{
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var descriptionlbl: UILabel!
    @IBOutlet weak var favFoodslbl: UILabel!
    @IBOutlet weak var addFriendBtn: UIButton!
    
    @IBAction func addFriendOnClick(_ sender: UIButton) {
        
    }
}

class TVCAddFriends: UITableViewController {
    var usersDB = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Friends"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        getInfo()
    }

    func getInfo(){
        DatabaseManager.shared.getUsuarios{ (users) in
            self.usersDB = users
            self.tableView.reloadData()
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usersDB.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! customTableViewCell
        celda.namelbl?.text = usersDB[indexPath.row].fName + " " + usersDB[indexPath.row].lName
        celda.descriptionlbl?.text = usersDB[indexPath.row].description
//        celda.favFoodslbl?.text = usersDB[indexPath.row].favFoods


        return celda
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
