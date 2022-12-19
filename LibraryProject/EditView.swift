//
//  ContentView.swift
//  LibraryProject
//
//  Created by Hanjaya Putra Wijangga on 18/12/22.
//

import SwiftUI

struct EditView: View {
    @StateObject var eddCustomer = DataController()
    @State private var NamaBuku = ""
    @State private var NamaMember: String = ""
    @State private var TanggalPengambillan: Date = Date.now
    @State private var TanggalPengembalian: Date = Date.now
    @Binding var showingSheet1: Bool
    @State var userPick = User()
    @State var bookPick = Catalog()
    @Binding var isUpdate:Bool
    var body: some View {
        VStack {
            HStack{
                Text("Nama buku = ")
                Picker("Please choose a User", selection: $bookPick) {
                    ForEach(eddCustomer.buku, id: \.self) { i in
                        Text(i.judul_buku!)
                            .tag(i)
                        
                    }
                }
            }
            HStack{
                Text("Nama Member = ")
                TextField("Masukan nama member", text: $NamaMember)
                Picker("Please choose a User", selection: $userPick) {
                    ForEach(eddCustomer.member, id: \.self) { i in
                        Text(i.nama_user!)
                            .tag(i)

                        
                    }
                }
                .pickerStyle(.menu)
            }

            .pickerStyle(.wheel)

            Button("add User"){
                if NamaMember != "" {
                    eddCustomer.addUser(nama: NamaMember)
                    eddCustomer.getUser()
                    userPick = eddCustomer.member.last!
                }
                eddCustomer.addPeminjaman(user: userPick, catalog: bookPick)
                eddCustomer.getStatusPinjam()
                showingSheet1 = false
                isUpdate.toggle()
            }
        }
        .padding()
    }
}

