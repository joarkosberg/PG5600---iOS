//
//  PersonTests.swift
//  Oppgave1
//
//  Created by Admin  on 11/16/16.
//  Copyright © 2016 Admin . All rights reserved.
//

import XCTest
import UIKit

class PersonTests: XCTestCase {
    func testCreatePerson() {
        let person = Person(named: "John Doe")
        XCTAssertNotNil(person)
    }
    
    func testPersonWithName() {
        let person = Person(named: "John Doe")
        XCTAssertEqual(person.name, "John Doe")
    }
    
    func testPersonWithAge() {
        let person = Person(named: "John Doe")
        person.age = 28
        XCTAssertEqual(person.age, 28)
    }
    
    func testUpdatePersonName() {
        var person = Person(named: "John Doe")
        person.name = "Steve Jobs"
        XCTAssertEqual(person.name, "Steve Jobs")
    }
}
