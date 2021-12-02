//
//  DataStorage.swift
//  ServicesiOS
//
//  Created by Jhon Munar on 1/12/21.
//

import Foundation


protocol DataStorageDelegate{
    func saveData(data:[User],enumData: DataStoraLocalEnum)
}

class DataStorageLocal: DataStorageDelegate {
    
    let userDefault: UserDefaults
    
    init(){
        userDefault = UserDefaults.init()
    }
    func saveData(data:[User],enumData: DataStoraLocalEnum){
        guard let data = try? JSONEncoder().encode(data),
              let jsonString = String(data: data, encoding: .utf8) else { return }
        userDefault.set(jsonString, forKey: enumData.rawValue)
    }
    
    
    func getData(enumData: DataStoraLocalEnum) -> [User]?{
        guard let jsonString = userDefault.string(forKey: enumData.rawValue) else{
            return nil
        }
        do{
            let data = Data(jsonString.utf8)
            let response =  try JSONDecoder().decode([User].self, from: data)
            
            return response
        }catch{
            return nil
        }
  
    }
    
}
