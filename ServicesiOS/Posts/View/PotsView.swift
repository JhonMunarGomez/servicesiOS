//
//  PotsView.swift
//  ServicesiOS
//
//  Created by Jhon Munar on 2/12/21.
//

import SwiftUI

struct PotsView: View {
    
    @State var userSeleted: User
    @ObservedObject var collection =  CollectionPostViewModel()
    
    init(user: User){
        self.userSeleted = user
        self.collection.idUser = self.userSeleted.id
        self.collection.fetchPosts()
    }
    
    
    var body: some View {
        let name: String = self.userSeleted.name
        let email: String = self.userSeleted.email
        let phone: String = self.userSeleted.phone
        ScrollView{
            
            VStack{
                Text("Nombre Usuario: "+name)
                    .foregroundColor(colorPrimary)
                    .fontWeight(.bold)
                Text("Correo electrónico: "+email)
                Text("Telefono: "+phone)
                ForEach(collection.collectionPosts, id: \.id) { result in
                            PostView(post: result)
                    }
                
            }
            
        }
    }
}

struct DetailsUser: View{
    var body: some View{
        Text("Hola")
    }
}

struct PostView: View{
    @State var post: Post
    var body: some View{
        ZStack{
            VStack(alignment:.leading,spacing: 10) {
                Text(post.title)
                    .foregroundColor(colorPrimary)
                    .fontWeight(.bold)
                Text(post.body)
                    .foregroundColor(.black)
                
            }.frame(width: screenWidth-20, height:.infinity, alignment: .leading)
        }.background(Color.white)
            .padding(10)
        .cornerRadius(1, corners: [.allCorners])
            .shadow(radius: 1)
    }
    
}


