//
//  AdminView.swift
//  LibraryProject
//
//  Created by Hanjaya Putra Wijangga on 18/12/22.
//

import Foundation
import SwiftUI
import CoreData

struct AdminView: View {
    @State private var showingSheet = false
    @State private var showingSheet1 = false
    @State private var showingSheet2 = false
    @State private var isUpdate = false
    @State var bukuDipinjam: [StatusPeminjaman] = []
    @State var umpanData = []
    @State var simpanROw: Int = 0
    @State var row = 0
    let formatter1 = DateFormatter()
    @StateObject var isiStatPinjam = DataController()
    @State private var refreshID = UUID()

    var body: some View {
        VStack{
            HStack{
                Button("Add buku") {
                           showingSheet.toggle()
                       }
                       .sheet(isPresented: $showingSheet) {
                           TambahBuku()
                       }
                Spacer()
                    Text("Daftar Pinjaman")
                        .font(.title)
                Spacer()
                Button("Add Pinjam") {
                           showingSheet1.toggle()
                       }
                       .sheet(isPresented: $showingSheet1) {
                           EditView( showingSheet1: $showingSheet1, isUpdate: $isUpdate)
                       }
            }
            List{
                VStack{
                    ForEach(0 ..< bukuDipinjam.count, id: \.self){ i in
                        Button(action: {
                            simpanROw = i
                            print(i)
                            showingSheet2.toggle()
                        }) {
                            HStack{
                                Image(uiImage: bukuDipinjam[i].catalog?.content ?? UIImage())
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                Spacer()
                                Text(bukuDipinjam[i].catalog?.judul_buku ?? "x")
                                Spacer()
                                VStack {
                                    Text(formatter1.string(from: bukuDipinjam[i].tanggal_peminjaman ?? Date.distantPast))
                                        .font(.headline)
                                    Text(formatter1.string(from: bukuDipinjam[i].tanggal_delete ?? Date.distantPast))
                                        .font(.headline)
                                    Text(bukuDipinjam[i].user?.nama_user ?? "x")
                                        .font(.headline)
                                }
                            }
                        }.buttonStyle(PlainButtonStyle())
                            .sheet(isPresented: $showingSheet2) {
                                EditMember(updateData: $isUpdate, ind: $simpanROw, showingSheet2: $showingSheet2)
                            }
                    }
                    .id(refreshID)
                }
            }.accentColor(isUpdate ? .white:.black)
        }
        .onAppear {
            isiStatPinjam.getStatusPinjam()
            bukuDipinjam = isiStatPinjam.statPinjam
            formatter1.dateStyle = .short
        }
        .onChange(of: isUpdate) { newValue in
            bukuDipinjam = []
            row = bukuDipinjam.count
            isiStatPinjam.getStatusPinjam()
            bukuDipinjam = isiStatPinjam.statPinjam
            formatter1.dateStyle = .short
            row = bukuDipinjam.count
            self.refreshID = UUID()
        }
        .padding()
    }
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}
