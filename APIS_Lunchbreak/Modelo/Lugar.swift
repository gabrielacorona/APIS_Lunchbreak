//
//  Lugar.swift
//  APIS_Lunchbreak
//
//  Created by Andres Genda on 22/05/21.
//

import UIKit

class Lugar: Codable {
    var nombre : String!
    var categoria : String!
    var ubicacion : String!
    
    init(nombre : String!, categoria: String!, ubicacion : String!) {
        self.nombre = nombre
        self.categoria = categoria
        self.ubicacion = ubicacion
    }
}
