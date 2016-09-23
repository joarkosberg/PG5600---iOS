import Foundation

func hello(name: String, age: Int) -> (String, Int){
    return ("hello \(name), age: \(age)", age)
}

hello(name: "Joar", age: 22)

let date = Date()



func start(closure: () -> ()){
    
}
start{
    
}


let aClosure: () -> Void = {
    print("Inside closure")
}

aClosure()



func optionalHello(name: String?){
    if let actualName = name {
        print(actualName)
    } else {
        print("no value")
    }
}

optionalHello(name: "Ola")
optionalHello(name: "231")


let numbers = [123, 12, 4234, 9123, 312222, 5]
let sortedNumbers = numbers.sorted { (x, y) -> Bool in
    return x < y
}
let sortedNumbers2 = numbers.sorted{ $0 > $1 }


print(sortedNumbers)



enum AccessLevel {
    case all
    case firstFloor
}

var accessLevel = AccessLevel.all





