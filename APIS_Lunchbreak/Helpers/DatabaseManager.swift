//
//  DatabaseManager.swift
//  APIS_Lunchbreak
//
//  Created by Gaby Corona on 5/17/21.
//

import Foundation
import Firebase
import FirebaseFirestore

class DatabaseManager{
    init(){
        
    }
    let firestore = Firestore.firestore()
    let decoder = JSONDecoder()
    
    static let shared = DatabaseManager()
    
    // MARK: - Get All DB records
    func getUsuarios(completion:@escaping([User])-> Void){
        firestore.collection("User").getDocuments{( snapshot,error ) in
            if( error == nil){
                var usuarios : [User] = []
                for document in snapshot?.documents ?? []{
                    var dict = document.data()
                    dict["id"] = document.documentID
                    guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []) else {return}
                    
                    let usuario = try? self.decoder.decode(User.self, from: data)
                    usuarios.append(usuario ?? User())
                }
                completion(usuarios)
                
            }
            else{
                completion([])
            }
        }
    }
    
    //MARK: - Create DB Records

    func createUser(fName:String, lName:String, email:String, password:String){
        firestore.collection("User").addDocument(data:["fName":fName, "lName":lName,  "email":email, "password": password ])
    }
    
    //MARK: - Edit DB Records
    func editUser(id:String,fName:String, lName:String, email:String, password:String){
        firestore.collection("User").document(id).updateData(["fName":fName, "lName":lName,  "email":email, "password": password] )
    }
    
    
    //MARK: - Delete DB Records
    func deleteUser(id:String){
        firestore.collection("User").document(id).delete()
    }
    
    
}
