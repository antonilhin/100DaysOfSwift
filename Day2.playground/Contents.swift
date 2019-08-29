import UIKit

// Array Set Typles Dictionaries Enumerations

//array
let stive = "Stive Jobs"
let woz = "Sive Woz"
let me = "Denis"

let apple = [stive, woz, me]
apple[2]

// set
let colors = Set(["red", "green", "blue"])
let cl2 = Set(["red", "green", "blue", "red", "green"])

//typles
let name = (first: "Denis", last: "Andreev")
name.0
name.last

//Dictionaries
let permissions = [
    "Administator": "full",
    "user": "own files"
]

permissions["user"]

// dic default
permissions["denis", default: "Full access"]


//empty collection
var users = [String]()
var rooms = Array<String>()
var ints = [Int]()
ints.append(10)
ints.append(22)

var dc = [String: String]()
var dc1 = Dictionary<String, String>()

var st = Set<String>()
var numbers = Set<Int>()
numbers.insert(10)
numbers.insert(23)
numbers.insert(10)


// Enumerations
enum ResponseResult {
    case success
    case fail
}

let result = ResponseResult.success

// enum associate
enum ErrorStatus {
    case noError
    case critical(name: String)
    case middle(name: String)
}

let alarm = ErrorStatus.critical(name: "Loss all data")

//enum raw
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let planet = Planet(rawValue: 3)
let mars = Planet.mars
mars.rawValue
