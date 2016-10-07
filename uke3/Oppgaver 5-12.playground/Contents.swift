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

/*
 class Address {
 var street: String?
 
 func printStreet() {
 print("Hello")
 }
 
 func buildFullStreetName() -> String? {
 return street
 }
 }
 
 class Student {
 var address: Address?
 }
 
 class School {
 var students: [Student]?
 }
 
 let westerdals = School()
 let student = Student()
 let address = Address()
 address.street = "Hello Street"
 
 let otherAddress = Address()
 address.street = "Hello Street"
 student.address = address
 westerdals.students = [Student]()
 westerdals.students?.append(student)
 
 if let street = westerdals.students?.first?.address?.street {
 print("Studenten bor i \(street).")
 } else {
 print("Kunne ikke hente gatenavn")
 }
 
 if westerdals.students?.first?.address?.printStreet() != nil {
 print("Det gikk bra å kalle print funksjonen")
 } else {
 print("Jeg kunne ikke kalle metoden")
 }
 
 if (westerdals.students?.first?.address = otherAddress) != nil {
 print("Du satt en ny addresse")
 } else {
 print("Det var ikke mulig å sette en ny addresse")
 }
 
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
 
 */

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
/*
 extension String {
 
 subscript(index: Int) -> Character? {
 for (charIndex, character) in characters.enumerate() {
 if charIndex == index {
 return character
 }
 }
 return nil
 }
 
 var length : Int  {
 return self.characters.count
 }
 
 func reverse() -> String {
 var finalString = ""
 for var i = self.length - 1; i >= 0 ; i-- {
 finalString = "\(finalString)\(self[i]!)"
 }
 return finalString
 }
 
 func contains(string: String) -> Bool {
 if (self as String).rangeOfString(string).location == NSNotFound {
 return false
 }
 return true
 }
 
 }
 
 "AB".length
 
 "AB".reverse()
 
 "Abba".contains("AbA")
 "Abba".contains("Abb")
 
 */


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
/*
 extension Array {
 
 func thirdElementInArray() -> Generator.Element? {
 
 for (index,object) in self.enumerate() {
 if index == 2 {
 return object
 }
 }
 
 return nil
 }
 
 }
 
 let anArray = [3,4,24,33]
 let anotherArray = ["hello", "world", "!"]
 let thirdArray = [23.3]
 
 anArray.thirdElementInArray()
 anotherArray.thirdElementInArray()
 thirdArray.thirdElementInArray()
 */
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


/**
 
 Fasiten her viser bare hvordan det gjøres med guard
 
 */
/*
 enum State {
 case Ready
 }
 
 let isOnline = false   // gjør denne om til true for å teste om det gikk
 let hasTakenBackup = true
 let readyState = State.Ready
 let name : String? = "User login screen"
 
 func createUser() {
 guard isOnline else {
 return
 }
 
 guard hasTakenBackup else {
 return
 }
 
 guard readyState == State.Ready else {
 return
 }
 
 guard let actualName = name else {
 return
 }
 
 print("we created user with name: \(actualName)")
 
 }
 
 createUser()
 */
/*:
 
 # Oppgave 13
 
 Få klassen Car til å implementere hashable
 
 implementer funksjonalitet slik at hvis man har to car objekter og plusser de sammen så får man et dictionary hvor key er modelName
 
 car1 + car2    // ["Tesla" : car1 ... ]
 
 2b:
 car1 + nil     // ["Tesla" : car1]
 
 
 */
/*
 public class Car : Hashable {
 
 let modelName : String
 
 init(modelName: String) {
 self.modelName = modelName
 }
 
 public var hashValue : Int {
 return modelName.hash
 }
 
 }
 
 
 public func ==(lhs: Car, rhs: Car) -> Bool {
 if lhs.hashValue == rhs.hashValue {
 return true
 }
 return false
 }
 
 public func +(lhs: Car, rhs: Car) -> [String : Car] {
 return [lhs.modelName : lhs, rhs.modelName : rhs]
 }
 
 let car1 = Car(modelName: "Tesla")
 let car2 = Car(modelName: "Prius")
 
 let dict = car1 + car2
 */


/*:
 
 #Oppgave 14
 
 Lag en [AnyObject] med 5 forskjellige objekter, løp gjennom arrayet og bruk switch for å printe de forskjellige objektene hvor du skriver ut klassens navn og hvor mange av dem du har funnet til nå.
 
 */
/*
 let arrayOfAnyObjects : [AnyObject] = [Car(modelName: "Troll"), "Hello", ["strings"], Student(), [34], Student()]
 
 
 extension Dictionary where Key: Comparable, Value: IntegerType {
 
 mutating func addFinding(key : Key) {
 if self[key] != nil {
 self[key] = self[key]! + 1
 } else {
 self[key] = 1
 }
 }
 
 func numberOfItemsFound(key : Key) -> Int {
 if self[key] == nil {
 return 0
 } else {
 return self[key] as! Int
 }
 }
 }
 
 var dictionaryOfFoundItems = [String : Int]()
 
 for object in arrayOfAnyObjects {
 switch object {
 case is Car:
 dictionaryOfFoundItems.addFinding("car")
 let numberOfFoundItems = dictionaryOfFoundItems.numberOfItemsFound("car")
 print("number of cars \(numberOfFoundItems)")
 case is String:
 dictionaryOfFoundItems.addFinding("string")
 let numberOfFoundItems = dictionaryOfFoundItems.numberOfItemsFound("string")
 print("number of strings \(numberOfFoundItems)")
 case is [String]:
 dictionaryOfFoundItems.addFinding("string array")
 let numberOfFoundItems = dictionaryOfFoundItems.numberOfItemsFound("string array")
 print("number of string arrays \(numberOfFoundItems)")
 case is [Int]:
 dictionaryOfFoundItems.addFinding("int array")
 let numberOfFoundItems = dictionaryOfFoundItems.numberOfItemsFound("int array")
 print("number of int arrays \(numberOfFoundItems)")
 case is Student:
 dictionaryOfFoundItems.addFinding("student")
 let numberOfFoundItems = dictionaryOfFoundItems.numberOfItemsFound("student")
 print("number of students: \(numberOfFoundItems)")
 default:
 break
 }
 }
 */
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

