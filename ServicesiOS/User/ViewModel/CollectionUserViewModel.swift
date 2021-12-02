//
//  CollectionUserViewModel.swift
//  ServicesiOS
//
//  Created by Jhon Munar on 1/12/21.
//

import Foundation

class CollectionViewModel: ObservableObject{
    let DataStorage : DataStorageLocal
    @Published var isLoading: Bool = false
    @Published var collections:[User]
    
    init(){
        self.collections = []
        self.DataStorage = DataStorageLocal()
        self.fetchCollection()
    }
    func fetchCollection() -> Void {
        
        guard let dataCollection = self.DataStorage.getData(enumData: .collectionUser) else{
            DispatchQueue.main.async {
                self.isLoading = true
            }
            let services: ServicesManager = ServicesManager()
            services.getUsers { response in
                guard let dataUsers = response else{
                    return
                }
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.collections.append(contentsOf: dataUsers)
                    self.DataStorage.saveData(data: self.collections, enumData: .collectionUser)
                }
                
            }
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
