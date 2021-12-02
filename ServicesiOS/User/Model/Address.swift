//
//  Address.swift
//  ServicesiOS
//
//  Created by Jhon Munar on 1/12/21.
//

import Foundation


class Address: Codable{
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: Geo?
    
   /* required public init(from decoder: Decoder) throws {
        let value = try? decoder.container(keyedBy: CodingKeys.self)
        self.suite = try? value?.decode(String.self,forKey:.suite)
        self.city = try? value?.decode(String.self,forKey:.city)
        self.zipcode = try? value?.decode(String.self,forKey:.zipcode)
        self.street = try? value?.decode(String.self,forKey:.street)
        self.geo = nil
    }*/
}

class Geo: Codable{
    let lat: String
    let lng: String
}
