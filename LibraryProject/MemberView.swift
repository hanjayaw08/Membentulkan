//
//  MemberView.swift
//  LibraryProject
//
//  Created by Hanjaya Putra Wijangga on 18/12/22.
//

import Foundation
import SwiftUI
struct MemberView: View {
    @StateObject var catalogBuku = DataController()

    var body: some View {
        VStack{
            HStack{
                    Text("Catalog")
                        .font(.title)
                Spacer()
            }
            List(catalogBuku.buku) { catalogs in
                    HStack{
                        Image(uiImage: catalogs.content!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        Spacer()
                        Spacer()
                        VStack {
                            Text(catalogs.judul_buku ?? "")
                                .font(.headline)
                        }
                    }
            }
        }

        .padding()
    }
}

struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        MemberView()
    }
}
