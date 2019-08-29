import UIKit

//access control, static properties, and laziness

//Initializers
struct User {
    var username: String
    
    init() {
        username = "Anonimus"
        print("Creat DefaulUser")
    }
}

var user = User()
user.username = "Felarmir"

//Referring to the current instance
struct Person {
    var name: String
    
    init(name: String) {
        print("\(name) was borm!")
        self.name = name
    }
}

let person = Person(name: "Felarmir")

//Lazy properties

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct PersonData {
    var name: String
    lazy var famTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var den = PersonData(name: "Denis")

//Static properties and methods
struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let denis = Student(name: "Denis")
let marg = Student(name: "Margarita")
let amy = Student(name: "Amy")
print(Student.classSize)

//Access control
struct Account {
    private var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func getID() -> String {
        return "My ID: \(self.id)"
    }
}

let acc = Account(id: 12)
print("\(acc.getID())")

