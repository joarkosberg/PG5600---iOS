//: Playground - noun: a place where people can play

import UIKit



/*
 Example 1
 */

class LivingThing{
    let birthDate : Date
    
    init(birthDate: Date){
        self.birthDate = birthDate
    }
    
}

class Person : LivingThing{
}

class Student {
    let birthDate : Date = Date()
}

let person : Any = Person(birthDate: Date())

(person as! Person).birthDate   //Force
(person as? Person)?.birthDate  //Optional chaining
(person as? Student)?.birthDate //Annet object

person is Student
person is LivingThing
person is Person



/*
 Example 2
 */

var robotsReady = true
func buildRocket(rocketDictionary: [String : String]?){
    
    guard robotsReady, let actualDictionary = rocketDictionary,
        let actualRocketName = actualDictionary["rocketName"] else {
        print("Robots not ready")
        return
    }
    
    if robotsReady, let actualDictionary = rocketDictionary,
        let actualRocketName = actualDictionary["rocketName"] {
        print("Robots not ready")
        return
    } else {
        
    }
    
    print("built rocket \(actualRocketName)")
}

buildRocket(rocketDictionary: ["rocketName" : "Falcon 9"])








