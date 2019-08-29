import UIKit

//structs, properties, and methods
struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn tennis"

//Computed properties
struct Device {
    var name: String
    var isMobile: Bool
    
    var mobileStatus: String {
        if isMobile {
            return "This is mobyle phone"
        } else {
            return "This is computer"
        }
    }
}

let iPhone = Device(name: "iPhone X", isMobile: true)
print(iPhone.mobileStatus)

//Property observers
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var videoDownload = Progress(task: "Video dawnloading", amount: 0)
videoDownload.amount = 10
videoDownload.amount = 20
videoDownload.amount = 80
videoDownload.amount = 100

//Methods
struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let ny = City(population: 30_000_000)
print("Taxes: \(ny.collectTaxes())")

//Mutating methods
struct Person {
    var name: String
    
    mutating func makeAnonimus() {
        name = "Anonimus"
    }
}

var person = Person(name: "Den")
person.makeAnonimus()

//Properties and methods of strings
let string = "Do or do not, there is no try"
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

//Properties and methods of arrays
var toys = ["Woody"]
print(toys.count)

toys.append("Buzz")
toys.firstIndex(of: "Buzz")

print(toys.sorted())

toys.remove(at: 0)


struct Learning {
    var day: Int
    var message: String
    
    func printMessage() {
        print("Day \(day) - \(message)")
    }
}

let learningDay = Learning(day: 8, message: "structs, properties, and methods")
learningDay.printMessage()

