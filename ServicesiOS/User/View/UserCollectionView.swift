//
//  UserView.swift
//  ServicesiOS
//
//  Created by Jhon Munar on 1/12/21.
//

import SwiftUI

let colorPrimary = Color(red: 56/255, green: 94/255, blue:53/255, opacity: 1.0)
let screenRect = UIScreen.main.bounds
let screenWidth = screenRect.size.width
struct UserColllectionView: View {
    
    @State private  var searchText: String = ""
    @ObservedObject var collectionUser  = CollectionViewModel()
    /*let formaGrid = [
        GridItem(.flexible),
        GridItem(.flexible)
    ]*/
 
    init(){
       UINavigationBar.appearance().backgroundColor =  UIColor.init(red: 56/255, green: 94/255, blue: 53/255, alpha: 1.0)
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
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
                if collectionUser.isLoading {
                        LoadingView()
                }else{
                    VStack(alignment: .leading){
                        Text("Buscar usuario")
                            .padding(.top,10)
                       
                        ZStack(alignment: .leading){
                            if searchText.isEmpty { Text("Escriba aquí para buscar").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                            
                            TextField("",text:binding).foregroundColor(.black)
                        }
                        Divider()
                            .frame(height: 1)
                            .background(.black).padding(.bottom)
                        if collectionUser.collections.count > 0 {
                            ForEach(collectionUser.collections, id: \.id) { result in
                                        UserView(userData: result)
                                }
                        }else{
                            Text("List is Empty")
                                .frame(width:screenWidth-40,height: 40)
                        }

                          //  TextField("",text:$searchText
                    }
                        .padding(.init(top: 0, leading: 40, bottom: 0, trailing: 40))
                }
              
                }
                .navigationTitle("Prueba de ingreso")

        }
        
    }
}

struct UserView: View{
    @State var userData: User
   
    var body: some View{

        ZStack{
            VStack(alignment:.leading, spacing: 5) {
                Text(userData.name)
                    .foregroundColor(colorPrimary)
                    .fontWeight(.bold)
                
                HStack{
                    Image(systemName: "phone.fill")
                    Text(userData.phone)
                        .foregroundColor(.black)
                }
                HStack{
                    Image(systemName: "square.and.pencil")
                    Text(userData.email)
                        .foregroundColor(.black)
                }
                VStack(alignment:.trailing){
                    NavigationLink("VER PUBLICACIONES", destination: PotsView(user: self.userData))
                        .foregroundColor(colorPrimary)
                      
                }.padding(
                    .init(top: 15, leading: 150, bottom: 15, trailing: 10)
                )
            }.frame(width: screenWidth-30)
                .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
        }.background(Color.white)
        .cornerRadius(1, corners: [.allCorners])
            .shadow(radius: 1)
     
       
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct UserColllectionView_Previews: PreviewProvider {
    static var previews: some View {
        UserColllectionView()
    }
}
