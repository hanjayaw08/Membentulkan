//
//  StatusPeminjaman+CoreDataProperties.swift
//  LibraryProject
//
//  Created by Hanjaya Putra Wijangga on 18/12/22.
//
//

import Foundation
import CoreData


extension StatusPeminjaman {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StatusPeminjaman> {
        return NSFetchRequest<StatusPeminjaman>(entityName: "StatusPeminjaman")
    }

    @NSManaged public var buku_dipinjam: Bool
    @NSManaged public var is_delete: Bool
    @NSManaged public var tanggal_delete: Date?
    @NSManaged public var tanggal_peminjaman: Date?
    @NSManaged public var catalog: Catalog?
    @NSManaged public var user: User?

}

extension StatusPeminjaman : Identifiable {

}
