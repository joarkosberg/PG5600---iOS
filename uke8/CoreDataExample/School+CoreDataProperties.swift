//
//  School+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Admin  on 11/4/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import Foundation
import CoreData

extension School {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<School> {
        return NSFetchRequest<School>(entityName: "School");
    }

    @NSManaged public var name: String?
    @NSManaged public var persons: NSSet?

}

// MARK: Generated accessors for persons
extension School {

    @objc(addPersonsObject:)
    @NSManaged public func addToPersons(_ value: Person)

    @objc(removePersonsObject:)
    @NSManaged public func removeFromPersons(_ value: Person)

    @objc(addPersons:)
    @NSManaged public func addToPersons(_ values: NSSet)

    @objc(removePersons:)
    @NSManaged public func removeFromPersons(_ values: NSSet)

}
