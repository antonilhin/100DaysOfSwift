import UIKit

//OPTIONALS


//=== Handling missing data ===
var age: Int?
age = 38

//=== Unwrapping optionals ===
var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name")
}


//=== Unwrapping with guard ===
func greet(_ name: String?) {
    guard let unwrap = name else {
        print("Name is nil!")
        return
    }
    
    print("Hello \(unwrap)")
}

greet(nil)
greet("Denis")


//=== Force unwrapping ===
let str = "10"
let n = Int(str)
let num = Int(str)!
print(num)


//=== Implicitly unwrapped optionals ===
var x: Int! = nil

x = 5

print(x)


//=== Nil coalescing ===

func userName(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = userName(for: 1) ?? "Anonimus"
let user2 = userName(for: 2) ?? "Anonimus"


//=== Optional chaining ===
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()

//=== Optional try ===
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

// may be crash
try! checkPassword("Secret")
print("Ok!")

//=== Failable initializers ==

let str1 = "5"
let num1 = Int(str)

struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 4 {
            self.id = id
        } else {
            return nil
        }
    }
}

let p1 = Person(id: "2")
let p2 = Person(id: "2222")

//=== Typecasting ===

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}


let pets = [Dog(), Fish(), Dog(), Fish()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}


