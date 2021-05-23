//
//  User.swift
//  APIS_Lunchbreak
//
//  Created by Gaby Corona on 5/17/21.
//

import Foundation
import UIKit

class User:Codable{
    var id:String = ""
    var fName: String = ""
    var lName : String = ""
    var email: String = ""
    var password: String = ""
    var description: String = ""
    var phoneNum:String = ""
    
    var favFoods:[Bool] = []
    var friends : [String] = []
    
}
