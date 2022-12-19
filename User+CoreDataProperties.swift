//
//  User+CoreDataProperties.swift
//  LibraryProject
//
//  Created by Hanjaya Putra Wijangga on 18/12/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var nama_user: String?
    @NSManaged public var statuspeminjaman: NSSet?

}

// MARK: Generated accessors for statuspeminjaman
extension User {

    @objc(addStatuspeminjamanObject:)
    @NSManaged public func addToStatuspeminjaman(_ value: StatusPeminjaman)

    @objc(removeStatuspeminjamanObject:)
    @NSManaged public func removeFromStatuspeminjaman(_ value: StatusPeminjaman)

    @objc(addStatuspeminjaman:)
    @NSManaged public func addToStatuspeminjaman(_ values: NSSet)

    @objc(removeStatuspeminjaman:)
    @NSManaged public func removeFromStatuspeminjaman(_ values: NSSet)

}

extension User : Identifiable {

}
