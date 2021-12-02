//
//  CollectionUser.swift
//  ServicesiOS
//
//  Created by Jhon Munar on 1/12/21.
//

import Foundation


class CollectionUser: Codable{
    let collection: [User]
    
    init(_ collection: [User]){
        self.collection = collection
    }
}
