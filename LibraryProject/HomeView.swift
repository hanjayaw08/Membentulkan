//
//  ContentView.swift
//  LibraryProject
//
//  Created by Hanjaya Putra Wijangga on 18/12/22.
//

import SwiftUI

struct HomeView: View {
    @State private var Username: String = ""
    @State private var Password: String = ""
    var body: some View {
        VStack {
           Text("Library")
            Spacer()
            HStack{
                Text("username = ")
                TextField("enter your usernam", text: $Username)
            }
            HStack{
                Text("Password = ")
                TextField("enter your Password", text: $Password)
            }
            Spacer()
            Button("Log in") {
                print("Button tapped!")
            }
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
