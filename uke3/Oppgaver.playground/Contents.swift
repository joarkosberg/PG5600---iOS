
import Foundation
/*:
# Oppgave 1
Lag en extension på String som gjør at du kan subscripte String og få ut en Character.
Den skal oppfylle dette:

"Hei"[0]     // H
"Hei"[1]     // e
"Hei"[4]     // nil

// observer hva som skjer om du bruker emojis og subscripter dem med samme metode:

"😸👻🙆🏽"[1]

"LOL😸👻🙆🏽"[5]

*/

extension String {
    subscript (index: Int) -> Character?{
        if(index < self.characters.count){
            return self[self.index(self.startIndex, offsetBy: index)]
        } else {
            return nil
        }
    }
}

"Hei"
"Hei"[0]
"Hei"[1]
"Hei"[4]

"😸👻🙆🏽"[1]
"LOL😸👻🙆🏽"[5]


/*:

## Oppgave 2
lag en klasse MadScientist som er subklasse av Scientist som er subklasse av Person som er subklasse av LivingBeing

følgende attributter skal lages:

Madscientist skal ha madnessfactor
Scientist skal ha IQ
Person skal ha name
livingBeing skal ha birthDate og birthPlace , disse skal det ikke gå ann å override

Dette skal gå kompilere:

let madScientist = MadScientist(madnessfactor: 41, IQ: 32, name: "John Doe")

let madScientist2 = MadScientist(IQ: 32)       // HINT: bruk convenience init og sett default-verdier på attributtene som ikke blir gitt

*/

class LivingBeing {
    final var birthPlace: String?
    final var birthDate: Date = Date()
}

class Person : LivingBeing{
    var name: String?
}

class Scientist : Person {
    var IQ: Int = 0
}
/* TODO
class MadScientist : Scientist {
    var madnessFactor: Int = 0
    
    init (IQ: Int){
        self.IQ = IQ
    }
    
    convenience init(madnessFactor: Int, IQ: Int, name: String) {
        self.init(IQ: IQ)
        self.madnessFactor = madnessFactor
        self.name = name
    }
}


let madScientist = MadScientist(madnessFactor: 41, IQ: 32, name: "John Doe")
let madScientist2 = MadScientist(IQ: 32)
*/




/*:

## Oppgave 3

1. Svar på hvorfor kompilatoren feiler når du limer inn klassen uten kontruktør
2. Lag en designated konstruktør og en convenience kontruktør for denne klassen
3. Lag nye instanser av klassen ved hjelp av de to kontruktørene du lagde i oppgave 2.2

class Timer {
var hour: Int
var minute: Int
var second: Int

var running: Bool = false
var startedAt: Date?
var stoppedAt: Date?
}

*/

/*
 Den feiler på grunn av at tre av de stored properties ikke blir initialized 
 eller har default/optional values
 */

class Timer {
    var hour: Int
    var minute: Int
    var second: Int
    
    var running: Bool = false
    var startedAt: Date?
    var stoppedAt: Date?
    
    init (hour: Int, minute: Int, second: Int){
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    
    convenience init (){
        self.init(hour: 0, minute: 0, second: 0)
    }
    
    convenience init (second: Int){
        self.init(hour: 0, minute: 0, second: second)
    }
    
    let normalInit = Timer(hour: 21, minute: 22, second: 23)
    let convenienceInit = Timer()
    let minuteConvenience = Timer(second: 43)
}



/*:
## Oppgave 4

1. Lag en base klasse Animal, der du finner måter å bruke final og required som beskrevet i slidene
2. Lag en metode for å sove, en metode for å returnere lyden dyret lager
3. Lag deretter en subclass, for eksempel Bird som arver av base klassen Animal
4. Bruk override for å skrive over base klassen funksjonaliteten
5. Lag en subclass til som arver av Animal base klassen
6. Lag en array med begge subklassene og foreach over dem,
7. Identifiser hva slags type det er og skriv det ut ved hjelp av println

*/

class Animal {
    final var sound: String
    var weight: Double
    var height: Double
    var tail: Bool = false
    var sleeping: Bool = false
    
    init(sound: String, weight: Double, height: Double){
        self.sound = sound
        self.weight = weight
        self.height = height
    }
    
    func Sleep (){
        sleeping = true
    }
    
    func GetSound() -> String{
        return sound
    }
    
    func PrintMyThing() -> String{
        return "Im an Animal"
    }
}

class Bird : Animal {
    var canFly: Bool = true
    
    required init (sound: String, weight: Double, height: Double, canFly: Bool){
        self.canFly = canFly
        super.init(sound: sound, weight: weight, height: height)
    }
    
    override func PrintMyThing() -> String {
        return "Im a Bird"
    }
}

class Cat : Animal {
    var color: String
    
    required init (sound: String, weight: Double, height: Double, color: String){
        self.color = color
        super.init(sound: sound, weight: weight, height: height)
        self.tail = true
    }
    
    override func PrintMyThing() -> String {
        return "Im a Cat"
    }
}

var animalArray = [Animal]()
let animal = Animal(sound: "Bært", weight: 22.123, height: 2.32)
let bird1 = Bird(sound: "Pip", weight: 22.123, height: 2.32, canFly: true)
let bird2 = Bird(sound: "PepPPEPE", weight: 22.123, height: 2.32, canFly: false)
let cat1 = Cat(sound: "Miaw", weight: 2.23, height: 2.32, color: "Green")
let cat2 = Cat(sound: "MÆÆÆ", weight: 2.123, height: 2.32, color: "Svart")
animalArray += [animal, bird1, bird2, cat1, cat2]

for a in animalArray{
    print(a.PrintMyThing())
    if let cat = a as? Cat {
       print("CAT IS HERE \(cat.color)")
    }
    print("\(a.GetSound())")
}



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
