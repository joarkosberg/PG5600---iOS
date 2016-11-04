//
//  Person+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Admin  on 11/4/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import Foundation
import CoreData

extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person");
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var adress: String?
    @NSManaged public var school: School?

}
