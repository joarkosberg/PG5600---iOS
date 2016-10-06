
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

class MadScientist : Scientist {
    var madnessFactor: Int = 0
    
    init (IQ: Int){
        super.init()
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