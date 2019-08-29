import UIKit

//PROTOCOLS AND EXTENSIONS

//=== Protocols ===
protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

let user = User(id: "001")
displayID(thing: user)


//=== Protocol inheritance ===
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation {}

//=== Extensions ===

extension Int {
    func squared() -> Int {
        return self * self
    }
}

var sallary = 10
print(sallary.squared())

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

let number = 2
number.isEven

let n = 3
n.isEven

//=== Protocol extensions ===
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print("-> \(name)")
        }
    }
}

pythons.summarize()
beatles.summarize()


//=== Protocol-oriented programming ===
protocol Ident {
    var id: String { get set }
    func identify()
}

extension Ident {
    func identify() {
        print("My id is \(id)")
    }
}

struct Person: Ident {
    var id: String
}

let person = Person(id: "007")
person.identify()

//==

protocol DayInfo {
    var day: Int { get set }
    func prinInfo()
}

extension DayInfo {
    func prinInfo() {
        print("Day \(day) - protocols, extensions, and protocol extensions")
    }
}

func printer(document: DayInfo) {
    document.prinInfo()
}

struct Day: DayInfo {
    var day: Int
}

let day = Day(day: 11)
printer(document: day)

