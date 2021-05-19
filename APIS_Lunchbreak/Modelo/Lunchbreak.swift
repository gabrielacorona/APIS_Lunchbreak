//
//  Lunchbreak.swift
//  APIS_Lunchbreak
//
//  Created by Gaby Corona on 5/18/21.
//

import Foundation
import UIKit

class Lunchbreak:Codable{
    var id:String = ""
    var host:String = ""
    var time: String = ""
    var  whatToEat: String = ""
    var placeName: String = ""
    var location: String = ""
    
    var joinedBy: [String] = []
}

