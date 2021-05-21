//
//  TVCViewLunchbreaks.swift
//  APIS_Lunchbreak
//
//  Created by Gaby Corona on 5/18/21.
//

import UIKit

class TVCViewLunchbreaks: UITableViewController {
    var lunchbreaksDB = [Lunchbreak]()
    var usersDB = [User]()
    
    var lbHosts : [String] = []
    var hostNames : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "All Lunchbreaks"
        getInfo()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func getInfo(){
        DatabaseManager.shared.getLunchbreaks{ (lunches) in
            self.lunchbreaksDB = lunches
            self.tableView.reloadData()
            for l in lunches{
                self.lbHosts.append(l.host)
            }
           
        }
        DatabaseManager.shared.getUsuarios{ (users) in
            self.usersDB = users
            for u in users{
                if(self.lbHosts.contains(u.id)){
                    let temp = u.fName + " " + u.lName
                    self.hostNames.append(temp)
                } 
            }
        }
    }
   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lunchbreaksDB.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        //celda.textLabel?.text = lunchbreaksDB[indexPath.row].host
        celda.detailTextLabel?.text = lunchbreaksDB[indexPath.row].location
        //celda.textLabel?.text = hostNames[indexPath.row]
        print(hostNames)
        

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
