//
//  CollectionUserViewModel.swift
//  ServicesiOS
//
//  Created by Jhon Munar on 1/12/21.
//

import Foundation

class CollectionViewModel: ObservableObject{
    let DataStorage : DataStorageLocal
    /*public private(set) var collections: [User] {
        willSet{
            self.objectWillChange.send()
        }
    }*/
    
    @Published var collections:[User]
    
    init(){
        self.collections = []
        self.DataStorage = DataStorageLocal()
        self.fetchCollection()
    }
        //https://jsonplaceholder.typicode.com/
    func fetchCollection() -> Void {
        
        guard let dataCollection = self.DataStorage.getData(enumData: .collectionUser) else{
           
            let services: ServicesManager = ServicesManager()
            services.getUsers { response in
                guard let dataUsers = response else{
                    return
                }
                DispatchQueue.main.async {
                    self.collections.append(contentsOf: dataUsers)
                    self.DataStorage.saveData(data: self.collections, enumData: .collectionUser)
                }
                
            }
           /* guard let url = URL(string:"https://jsonplaceholder.typicode.com/users") else{
                return
            }
            var request = URLRequest(url:url)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request) { data, response, errorApi in
                if errorApi != nil {
                    return
                }else{
                    do{
                      if let jsonData = data {
                            let decodeData = try JSONDecoder().decode([User].self, from: jsonData)
                            
                            DispatchQueue.main.async {
                                self.collections.append(contentsOf: decodeData)
                                self.DataStorage.saveData(data: self.collections, enumData: .collectionUser)
                            }
                        }
                    }catch let error{
                        print(error)
                    }
                }*/
           // }.resume()
            return
        }
      
        self.collections = dataCollection
        
    }
    
    func filterCollection(filter:String) {
        
        guard let dataCollection: [User] = self.DataStorage.getData(enumData: .collectionUser) else{
            return
        }
        self.collections.removeAll()
        if filter.isEmpty {
            self.collections.append(contentsOf: dataCollection)
        }else{
            let dataFinally =  dataCollection.filter { user in
                (user.name.uppercased().contains(filter.uppercased()))
             }
            self.collections.append(contentsOf: dataFinally)
        }

    }
   

}
