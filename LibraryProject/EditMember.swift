//
//  EditMembet.swift
//  LibraryProject
//
//  Created by Hanjaya Putra Wijangga on 18/12/22.
//

import Foundation
import SwiftUI

struct EditMember: View {
    @State private var Username: String = ""
    @Binding var updateData: Bool
    @Binding var ind: Int
    @Binding var showingSheet2: Bool
    @StateObject var eddCustomer = DataController()
    @State var deletePinjam: StatusPeminjaman = StatusPeminjaman()
    var body: some View {
        VStack {
           Text("Edit")
            Spacer()
            HStack{
                Text("username = ")
                TextField("enter your usernam", text: $Username)
            }
            Spacer()
            HStack{
                Button("Update") {
                    eddCustomer.editUser(data: deletePinjam.user!, nama: Username)
                    eddCustomer.getStatusPinjam()
                    showingSheet2 = false
                    updateData.toggle()
                }
                Button("delete"){
                    eddCustomer.deletePeminjaman(data: deletePinjam)
                    eddCustomer.getStatusPinjam()
                    showingSheet2 = false
                    updateData.toggle()
                }
            }
        }
        .onAppear{
            deletePinjam = eddCustomer.statPinjam[ind]
            let updateNamaMember = deletePinjam.user!
            Username = updateNamaMember.nama_user ?? "a"
        }
        .padding()
    }
}

