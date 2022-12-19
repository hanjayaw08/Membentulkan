//
//  DataController.swift
//  LibraryProject
//
//  Created by Hanjaya Putra Wijangga on 18/12/22.
//
import CoreData
import SwiftUI
import Foundation

class DataController: ObservableObject{
    //variable array coreData
    let container = NSPersistentContainer(name: "Library")
    var buku: [Catalog] = []
    var statPinjam: [StatusPeminjaman] = []
    var member: [User] = []

    //moc
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load : \(error.localizedDescription)")
            }
        }
        getBuku()
        getUser()
        getStatusPinjam()
    }
    //fetch data
    func getBuku() {
        let request = NSFetchRequest<Catalog>(entityName: "Catalog")
        do{
            buku = try container.viewContext.fetch(request)
        } catch let error {
            print("error fetch data \(error)")
        }
    }
    
    func getStatusPinjam() {
        let request = NSFetchRequest<StatusPeminjaman>(entityName: "StatusPeminjaman")
        do{
            statPinjam = try container.viewContext.fetch(request)
            statPinjam = statPinjam.filter({ $0.buku_dipinjam == false })
        } catch let error {
            print("error fetch data \(error)")
        }
    }
    
    func getUser(){
        let request = NSFetchRequest<User>(entityName: "User")
        do{
            member = try container.viewContext.fetch(request)
        } catch let error {
            print("error fetch data \(error)")
        }
    }
    
    func addUser(nama: String){
        let newUser = User(context: container.viewContext)
        newUser.nama_user = nama
        saveData()
    }
    
    func addBuku(judulBuku: String, image: UIImage){
        let newBook = Catalog(context: container.viewContext)
        newBook.judul_buku = judulBuku
        newBook.content = image
        saveData()
    }
    
    func addPeminjaman(user: User, catalog: Catalog){
        let newPinjam = StatusPeminjaman(context: container.viewContext)
        newPinjam.user = user
        newPinjam.catalog = catalog
        newPinjam.buku_dipinjam = false
        newPinjam.tanggal_peminjaman = Date.now
        newPinjam.tanggal_delete = Date.now.addingTimeInterval(604800)
        
        saveData()
    }
    
    func editUser(data: User, nama: String){
        data.setValue(nama, forKey: "nama_user")
        saveData()
    }
    
    func deletePeminjaman(data: StatusPeminjaman){
        data.setValue(true, forKey: "buku_dipinjam")
        saveData()
    }
    
    func saveData() {
        do{
            try container.viewContext.save()
        } catch let error {
            print("error fetch data \(error)")
        }
        
    }
    
}
