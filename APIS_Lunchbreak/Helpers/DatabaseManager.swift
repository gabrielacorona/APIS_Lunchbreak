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
    
    func getLunchbreaks(completion:@escaping([Lunchbreak])-> Void){
        firestore.collection("Lunchbreak").getDocuments{( snapshot,error ) in
            if( error == nil){
                var lunchbreaks : [Lunchbreak] = []
                for document in snapshot?.documents ?? []{
                    var dict = document.data()
                    dict["id"] = document.documentID
                    guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []) else {return}
                    
                    let lunchbreak = try? self.decoder.decode(Lunchbreak.self, from: data)
                    lunchbreaks.append(lunchbreak ?? Lunchbreak())
                }
                completion(lunchbreaks)
            }
            else{
                completion([])
            }
        }
    }    
    
    //MARK: - Create DB Records

    func createUser(fName:String, lName:String, email:String, password:String,description:String){
        firestore.collection("User").addDocument(data:["fName":fName, "lName":lName,  "email":email, "password": password, "description":description ])
    }
    
    func createLunchbreak(host:String, joinedBy:[String], location:String,placeName:String,time:String, whatToEat:String){
        firestore.collection("Lunchbreak").addDocument(data:["host":host, "joinedBy":joinedBy, "location":location,"time":time, "whatToEat":whatToEat])
    }


    
    //MARK: - Edit DB Records
    func editUser(id:String,fName:String, lName:String, email:String, password:String,description:String){
        firestore.collection("User").document(id).updateData(["fName":fName, "lName":lName,  "email":email, "password": password,"descripton":description] )
    }
    
    
    //MARK: - Delete DB Records
    func deleteUser(id:String){
        firestore.collection("User").document(id).delete()
    }
    
    func deleteLunchbreak(id:String){
        firestore.collection("Lunchbreak").document(id).delete()
    }
    
    
}
