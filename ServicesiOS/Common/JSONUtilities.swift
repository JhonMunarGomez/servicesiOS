//
//  JSONUtilities.swift
//  ServicesiOS
//
//  Created by Jhon Munar on 2/12/21.
//

import Foundation


class JSONUtilities{
    func getJSON<T:Codable>(Model:T.Type,data: T) -> String?{
        guard let data = try? JSONEncoder().encode(data),
              let jsonString = String(data: data, encoding: .utf8) else { return nil }
        return jsonString
    }
    
    func getObject<T: Codable>(Model: T.Type,jsonString: String) -> T?{
        let data = Data(jsonString.utf8)
        do{
            let response =  try JSONDecoder().decode(T.self, from: data)
            return response
        }catch{
            return nil
        }
    }
}
