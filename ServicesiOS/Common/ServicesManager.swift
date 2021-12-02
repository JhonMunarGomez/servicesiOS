//
//  ServicesManager.swift
//  ServicesiOS
//
//  Created by Jhon Munar on 1/12/21.
//

import Foundation

protocol servicesManagerDelegate{
    
}
typealias ServiceCompletion<T: Codable> = (T?) -> Void

enum httpMethod: String {
    case get = "GET"
    case post = "POST"
}
class ServicesManager{
    private let urlService: String = "https://jsonplaceholder.typicode.com"
    var methodAdd: String = ""
    var method: httpMethod = .get
    private func callService<T: Codable>(Model: T.Type,completion: @escaping ServiceCompletion<T>){
        guard let url = URL(string:urlService+methodAdd) else{
            return
        }
        var request = URLRequest(url:url)
        request.httpMethod = method.rawValue
        URLSession.shared.dataTask(with: request) { data, response, errorApi in
            if errorApi != nil {
                return
            }else{
                do{
                  if let jsonData = data {
                        let decodeData = try JSONDecoder().decode(T.self, from: jsonData)
                        completion(decodeData)
                    }
                }catch let error{
                    print(error)
                    completion(nil)
                }
            }
        }.resume()
    }
    
    
    func getUsers(completion: @escaping (_ response: [User]?) -> Void){
        methodAdd = "/users"
        callService(Model: [User].self){ result in
            guard let results = result else{
                completion(nil)
                return
            }
            completion(results)
        }
    }
    
    func getPosts(id: Int){
        
    }
    
    
}
