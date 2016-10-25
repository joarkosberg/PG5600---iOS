import UIKit

print("Test")

/*:
 ## Oppgave 5
 
 1. Lag en protocol LivingBeing som har attributtene isAlive, birthDate og deathDate
 2. Lag en procotol extension som lager standard implmentasjon av isAlive
 3. Lag en klasse Frog som følger protokollen LivingBeing
 4. Skriv klassen slik at dette er mulig:
 
 var frog = Frog(birthDate: Date())
 
 frog.isAlive     // true
 
 frog.deathDate = Date()
 
 frog.isAlive     // false
 
 */

protocol LivingBeing {
    var isAlive: Bool { get }
    var birthDate: Date { get set }
    var deathDate: Date? { get set }
}

extension LivingBeing {
    var isAlive: Bool{
        if deathDate != nil {
            return false
        } else {
            return true
        }
    }
}

class Frog: LivingBeing {
    var birthDate: Date
    var deathDate: Date?
    
    init(birthDate: Date){
        self.birthDate = birthDate
    }
}

var frog = Frog(birthDate: Date())
 
frog.isAlive     // true
frog.deathDate
frog.deathDate = Date()
frog.deathDate
frog.isAlive     // false



/*:
 ## Oppgave 6
 
 1. Lag det som er nødvendig for at denne if statementen fungerer
 2. Lag et eksempel på begge utfall av if
 
 
 if let street = westerdals.students?.first?.address?.street {
 println("Studenten bor i \(street).")
 } else {
 println("Kunne ikke hente gatenavn")
 }
 
 */

class School{
    var name: String
    var students: Array<Student>?
    
    init(name: String){
        self.name = name
    }
}

class Student {
    var address: Address?
    
    init(){}
    
    convenience init(address: Address){
        self.init()
        self.address = address
    }
}

class Address {
    var street: String
    
    init(street: String){
        self.street = street
    }
    
    func buildFullStreetName() -> String{
        return street
    }
}


let westerdals = School(name: "Westerdals")
westerdals.students = [Student(), Student(address: Address(street: "Kosegaten 1b"))]
if let street = westerdals.students?.first?.address?.street {
    print("Studenten bor i \(street).")
} else {
    print("Kunne ikke hente gatenavn")
}

/*:
 ## Oppgave 7
 
 1. Lag det som er nødvendig for at denne if statementen fungerer
 
 ```swift
 if (westerdals.students?.first?.address = otherAddress) != nil {
 println("Du satt en ny addresse")
 } else {
 println("Det var ikke mulig å sette en ny addresse")
 }
 ```
 */


var otherAddress = Address(street: "Cozy Street 5a")
if (westerdals.students?.first?.address = otherAddress) != nil {
    print("Du satt en ny addresse")
} else {
    print("Det var ikke mulig å sette en ny addresse")
}


/*:
 ## Oppgave 8
 
 1. Bytt ut first? og bruk subscript i stedet
 
 ```swift
 if let fullStreetName = westerdals.students?.first?.address?.buildFullStreetName() {
 println("Fullstendig gatenavn er \(fullStreetName)")
 } else {
 println("Kunne ikke hente fullstendig gatenavn")
 }
 ```
 */


if let fullStreetName = westerdals.students?.first?.address?.buildFullStreetName() {
    print("Fullstendig gatenavn er \(fullStreetName)")
} else {
    print("Kunne ikke hente fullstendig gatenavn")
}

if let fullStreetName = westerdals.students?[0].address?.buildFullStreetName() {
    print("Fullstendig gatenavn er \(fullStreetName)")
} else {
    print("Kunne ikke hente fullstendig gatenavn")
}


/*:
 
 ## Oppgave 9
 
 1. Lag extention på String, slik at følgende kode vil fungere
 
 ```swift
 "AB".length // 2
 "AB".reverse() // Skal printe ut BA
 "Abba".contains("AbA") // Skal printe ut false
 "Abba".contains("Abb") // SKal printe ut true
 ```
 */


extension String {
    var length: Int {
        return self.characters.count
    }
    
    func reverse() -> String {
        return String(self.characters.reversed())
    }
}

"AB".length // 2
"AB".reverse() // Skal printe ut BA
"Abba".contains("AbA") // Skal printe ut false
"Abba".contains("Abb") // SKal printe ut true



/*:
 
 ## Oppgave 10
 
 1. Lag en extention på Array med en metode thirdElementInArray
 
 ```swift
 let anArray = [3,4,24,33]
 let anotherArray = ["hello", "world", "!"]
 let thirdArray = [23.3]
 
 anArray.thirdElementInArray()    // 24
 anotherArray.thirdElementInArray()    // !
 thirdArray.thirdElementInArray()    // nil
 
 ```
 */


extension Array {
    func thirdElementInArray() -> Element? {
        let length = self.count
        if length > 2 {
            return self[2]
        }
        return nil
    }
}

let anArray = [3,4,24,33]
let anotherArray = ["hello", "world", "!"]
let thirdArray = [23.3]

anArray.thirdElementInArray()    // 24
anotherArray.thirdElementInArray()    // !
thirdArray.thirdElementInArray()    // nil


/*:
 # Oppgave 12
 
 du har fått følgende state satt (enumen må du definere selv):
 
 let isOnline = false
 let hasTakenBackup = true
 let readyState = .Ready
 let name : String? = "User login screen"
 
 func createUser() {
 
 }
 
 12a : Fyll ut metoden createUser med control flow uten å bruke guard - sjekk om alle bool er true, state er ready, og name har en verdi
 
 12b : lag en ny implementasjon av metoden der du bruker så mange guard statements som mulig
 
 
 */


enum State{
    case notReady
    case ready
}

let isOnline = false
let hasTakenBackup = true
let readyState = State.ready
let name : String? = "User login screen"

func createUser() {
    if isOnline && hasTakenBackup && readyState == .ready{
        if name != nil {
            print("Valid!")
        } else {
            print("Name empty")
        }
    } else {
        print("Bools wrong")
    }
}

func createUserWihGuard(){
    guard isOnline else {
        print("Not online")
        return
    }
    
    guard hasTakenBackup else {
        print("No backup taken")
        return
    }
    
    guard readyState == .ready else {
        print("Not ready")
        return
    }
    
    guard name != nil else {
        print("No name set")
        return
    }
    
    print("Valid!")
}



createUser()
createUserWihGuard()




/*:
 
 # Oppgave 13
 
 Få klassen Car til å implementere hashable
 
 implementer funksjonalitet slik at hvis man har to car objekter og plusser de sammen så får man et dictionary hvor key er modelName
 
 car1 + car2    // ["Tesla" : car1 ... ]
 
 2b:
 car1 + nil     // ["Tesla" : car1]
 
 
 */


class Car : Hashable{
    var modelName: String
    var year: Int?
    
    init (modelName: String){
        self.modelName = modelName
    }
    
    var hashValue : Int {
        return modelName.hash
    }
    
    static func ==(c1: Car, c2: Car) -> Bool {
        if c1.hashValue == c2.hashValue {
            return true
        }
        return false
    }
    
    static func +(c1: Car, c2: Car?) -> [String : Car]? {
        if c1 == c2 {
            return nil
        } else {
            if let actualC2 = c2 {
                return [c1.modelName : c1, actualC2.modelName : actualC2]
            } else {
                return [c1.modelName : c1]
            }
        }
    }
}



let car1 = Car(modelName: "Tesla")
let car2 = Car(modelName: "Prius")
let car3 = Car(modelName: "Prius")

let dict1 = car1 + car3
let dict2 = car2 + car3
let dict3 = car1 + nil





/*:
 
 #Oppgave 14
 
 Lag en [AnyObject] med 5 forskjellige objekter, løp gjennom arrayet og bruk switch for å printe de forskjellige objektene hvor du skriver ut klassens navn og hvor mange av dem du har funnet til nå.
 
 */


let theAmazingArray : [Any?] = [Car(modelName: "Audi"),
                                     34,
                                     "Normal String",
                                     Frog(birthDate: Date()),
                                     324.23,
                                     nil,
                                     21312]

var counter = [String:Int]()
func notifyCounter (type: String){
    if let value = counter[type]{
        counter[type] = value + 1
    } else {
        counter[type] = 1
    }
}

print()
for thing in theAmazingArray{
    switch thing {
    case let someInt as Int:
        print("Int: \(someInt)")
        notifyCounter(type: "Int")
    case let someString as String:
        print("Strng \(someString)")
        notifyCounter(type: "String")
    case let someDouble as Double:
        print("Double: \(someDouble)")
        notifyCounter(type: "Double")
    case let someBool as Bool:
        print("Boolean: \(someBool)")
        notifyCounter(type: "Bool")
    case let someCar as Car:
        print("Car: \(someCar.modelName)")
        notifyCounter(type: "Car")
    default:
        print("Ukjent")
        notifyCounter(type: "Ukjent")
    }
}

print(counter)





/*:
 
 #Oppgave 15
 
 Lag en generisk metode printAllStrings som er generic på CollectionType, som går gjennom og printer alle stringer den finner til console. Den skal ikke printe ut andre objekter eller typer enn strenger
 
 let intArray = [ 234, 34 ,33]
 let stringArray = [ "hello", "world" ]
 let anyObjectArray : [AnyObject] = ["Omg", 234, 342.3]
 
 printAllStrings(intArray)
 printAllStrings(stringArray)         // printer: Hello   world
 printAllStrings(anyObjectArray)      // printer: Omg
 
 
 */











/*
 func printAllStrings<T: CollectionType>(elements: T) {
 for element in elements {
 if element is String {
 print(element)
 }
 }
 }
 
 let intArray = [ 234, 34 ,33]
 let stringArray = [ "hello", "world" ]
 let anyObjectArray : [AnyObject] = ["Omg", 234, 342.3]
 
 
 printAllStrings(intArray)
 printAllStrings(stringArray)         // printer: Hello   world
 printAllStrings(anyObjectArray)      // printer: Omg
 */

