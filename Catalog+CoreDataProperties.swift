//
//  Catalog+CoreDataProperties.swift
//  LibraryProject
//
//  Created by Hanjaya Putra Wijangga on 18/12/22.
//
//

import Foundation
import CoreData
import SwiftUI


extension Catalog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Catalog> {
        return NSFetchRequest<Catalog>(entityName: "Catalog")
    }

    @NSManaged public var content: UIImage?
    @NSManaged public var image: String?
    @NSManaged public var judul_buku: String?
    @NSManaged public var statuspeminjaman: NSSet?

}

// MARK: Generated accessors for statuspeminjaman
extension Catalog {

    @objc(addStatuspeminjamanObject:)
    @NSManaged public func addToStatuspeminjaman(_ value: StatusPeminjaman)

    @objc(removeStatuspeminjamanObject:)
    @NSManaged public func removeFromStatuspeminjaman(_ value: StatusPeminjaman)

    @objc(addStatuspeminjaman:)
    @NSManaged public func addToStatuspeminjaman(_ values: NSSet)

    @objc(removeStatuspeminjaman:)
    @NSManaged public func removeFromStatuspeminjaman(_ values: NSSet)

}

extension Catalog : Identifiable {

}
