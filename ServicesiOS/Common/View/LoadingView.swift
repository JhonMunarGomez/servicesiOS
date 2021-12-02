//
//  LoadingView.swift
//  ServicesiOS
//
//  Created by Jhon Munar on 2/12/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            VStack(alignment:.center,spacing: 10) {
                ProgressView()
                Text("Cargando.. por favor espere")
            }.padding(50)
        }.background(Color.white)
            .frame(width:300,height:300)
        .cornerRadius(10, corners: [.allCorners])
        .shadow(color: Color.black, radius: 4, x: 1, y: 1)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
