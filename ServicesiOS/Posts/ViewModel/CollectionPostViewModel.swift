//
//  CollectionPostViewModel.swift
//  ServicesiOS
//
//  Created by Jhon Munar on 2/12/21.
//

import Foundation


class CollectionPostViewModel:ObservableObject{
    
    @Published var collectionPosts : [Post]
    @Published var isLoading: Bool = false
    var idUser : Int
    
    init(){
        self.collectionPosts = []
        self.idUser = 0
    }
    
    func fetchPosts(){
        DispatchQueue.main.async {
            self.isLoading = true
        }
        let services: ServicesManager = ServicesManager()
        services.getPosts(id: self.idUser){ response in
            guard let dataPots = response else{
                return
            }
            DispatchQueue.main.async {
                self.isLoading = false
                self.collectionPosts.append(contentsOf: dataPots)
            }
        }
        return
    }
}
