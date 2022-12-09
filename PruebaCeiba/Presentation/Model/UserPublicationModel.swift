//
//  UserPublication.swift
//  PruebaCeiba
//
//  Created by Sergio Josue Rodriguez Taborda on 7/12/22.
//

import Foundation

struct UserPublicationModel: Identifiable {
    let userID, id: Int
    let title, body: String
}

let userPublicationTest : UserPublicationModel = UserPublicationModel(userID: 1, id: 11, title: "Mi publicacion", body: "estoy haciendo mi publicacion")


let userPublicationsTest : [UserPublicationModel] = [UserPublicationModel(userID: 1, id: 11, title: "Mi publicacion", body: "estoy haciendo mi publicacion"),UserPublicationModel(userID: 1, id: 11, title: "Mi publicacion", body: "estoy haciendo mi publicacion")]
