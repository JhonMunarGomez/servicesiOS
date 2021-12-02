//
//  DataStorage.swift
//  ServicesiOS
//
//  Created by Jhon Munar on 1/12/21.
//

import Foundation


protocol DataStorageDelegate{
    func saveData(data:[User],enumData: DataStorageLocalEnum)
}

class DataStorageLocal: DataStorageDelegate {
    
    let userDefault: UserDefaults
    lazy var jsonUtilities = JSONUtilities()
    
    init(){
        userDefault = UserDefaults.init()
    }
    func saveData(data:[User],enumData: DataStorageLocalEnum){
        guard let jsonString = jsonUtilities.getJSON(Model: [User].self, data: data) else{
            return
        }
        userDefault.set(jsonString, forKey: enumData.rawValue)
    }
    
    func deleteElement(enumData: DataStorageLocalEnum){
        userDefault.removeObject(forKey: enumData.rawValue)
    }
    func getData(enumData: DataStorageLocalEnum) -> [User]?{
        guard let jsonString = userDefault.string(forKey: enumData.rawValue) else{
            return nil
        }
        return jsonUtilities.getObject(Model: [User].self, jsonString: jsonString) ?? nil
    }
    
}
