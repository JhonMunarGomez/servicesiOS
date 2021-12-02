//
//  UserView.swift
//  ServicesiOS
//
//  Created by Jhon Munar on 1/12/21.
//

import SwiftUI

let colorPrimary = Color(red: 56/255, green: 94/255, blue:53/255, opacity: 1.0)

struct UserColllectionView: View {
    
    @State private  var searchText: String = ""
    @ObservedObject var collectionUser  = CollectionViewModel()
    /*let formaGrid = [
        GridItem(.flexible),
        GridItem(.flexible)
    ]*/
 
    init(){
        UINavigationBar.appearance().backgroundColor = .green //UIColor.init(red: 56, green: 94, blue: 53, alpha: 1)
    }
    var body: some View {
        let binding = Binding<String>(get: {
            self.searchText
               }, set: { Value in
                   self.searchText = Value
                   self.collectionUser.filterCollection(filter: Value)
                   // do whatever you want here
               })
        NavigationView{
            ScrollView{
                VStack(alignment: .leading){
                        Text("Buscar usuario")
                    TextField("",text:binding)
                    if collectionUser.collections.count > 0 {
                        ForEach(collectionUser.collections, id: \.id) { result in
                                    UserView(userData: result)
                            }
                    }else{
                        Text("List is Empty")
                    }

                      //  TextField("",text:$searchText
                }.frame(maxWidth:.infinity)
                }
                .navigationTitle("Prueba de ingreso")
        }
        
    }
}

struct UserView: View{
    @State var userData: User
    var body: some View{
        VStack(alignment:.leading) {
            Text(userData.name)
                .foregroundColor(colorPrimary)
                .fontWeight(.bold)
            HStack{
                Text(userData.phone)
            }
            HStack{
                Text(userData.email)
            }
            Button("Ver publicaciones", action: {
                
            })
        }
       //     .shadow(color: Color.black, radius: 5, x: 1, y: 1)
            .background(Color.white)
    }
}

struct UserColllectionView_Previews: PreviewProvider {
    static var previews: some View {
        UserColllectionView()
    }
}
