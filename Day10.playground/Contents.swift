import UIKit

// Day 10 - CLASSES

//=== Creating your own classes ===
class Animal {
    var type: String
    init(type: String) {
        self.type = type
    }
}

let cat = Animal(type: "Cat")

//=== Class inheritance ===
class Dog: Animal {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
        
        super.init(type: "Dog")
    }
    
    func makeNoise() {
        print("Woof!")
    }
}

let dog = Dog(name: "Jack", breed: "Poodle")
print(dog.type)

//=== Overriding methods ===

class Poodle: Dog {
    override func makeNoise() {
        print("Yip!")
    }
}

let pd = Poodle(name: "Jack", breed: "Poodle")
pd.makeNoise()

//=== Final classes ===
final class User {
    var id: Int
    var name: String
    var email: String
    
    init(id: Int = 0, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}

//=== Copying objects ===
//class Singer {
//    var name = "Taylor Swift"
//}

struct Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var copySinger = singer
copySinger.name = "Jared"

print(singer.name)


//=== Deinitializers ===
class Person {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive")
    }
    
    func printGreating() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreating()
}

//=== Mutability ===
class SingerT {
    var name = "Taylor Swift"
}

let taylor = SingerT()
taylor.name = "Ed Sheeran"

