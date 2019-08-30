import UIKit

func favoriteAlbum() {
    print("Open door")
}

favoriteAlbum()

func favoriteAlbum(by name: String) {
    print("My favorite album is \(name)")
}
favoriteAlbum(by: "Colifornication")


func prinAlbum(name: String, year: Int) {
    print("\(name) was released in \(year)")
}

prinAlbum(name: "Open door", year: 2006)


func albumIsTaylor(name: String) -> Bool {
    if name == "Talor Swift" { return true }
    if name == "Red" { return true }
    if name == "1989" { return true }
    return false
}

if albumIsTaylor(name: "Red") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}


// optionals

func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}


var status: String?
status = getHaterStatus(weather: "snow")

if let unwrappedStatus = status {
    // unwrapped status
} else {
    // in case you want an else block
}

func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}


if let haterStatus = getHaterStatus(weather: "snow") {
    takeHaterAction(status: haterStatus)
}

//===

func yearAlbumReleased(name: String) -> Int? {
    if name == "Red" { return 2012 }
    if name == "Green" { return 2013 }
    return nil
}

var items = ["James", "John", "Sally"]

func position(of string: String, in array:[String]) -> Int? {
    for i in 0..<array.count {
        if array[i] == string {
            return i
        }
    }
    return nil
}

let johnPosition = position(of: "John", in: items)
let bobPosition = position(of: "Bob", in: items)

//==
var year = yearAlbumReleased(name: "Red")

if year == nil {
    print("Error")
} else {
    print("album released: \(year!)")
}
//===

var name:String = "Denis"
var name2: String? = "Bob"
var name3: String! = "Sophie"


// optionals chaining

func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
    }
}

let album = albumReleased(year: 2006) ?? "unknown"
print("The album is \(album)")


//==== enums

enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getMoodStatus(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .wind, .cloud:
        return "Dislike"
    case .rain:
        return "Like"
    default:
        return nil
    }
}

getMoodStatus(weather: .wind(speed: 11))


// structs

struct Person {
    var clothes: String
    var shoes: String
    
    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

print(taylor.clothes)
print(other.clothes)

var copyTaylor = taylor

copyTaylor.shoes = "flip flop"
print(taylor.shoes)
print(copyTaylor.shoes)

taylor.describe()
copyTaylor.describe()


//classes
class Singer {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sing(){
        print("La lal ala la ala la ala a")
    }
}

@objcMembers class HavyMetalSinger:Singer {
    var noiseLevele:Int
    
    init(name: String, age: Int, noiseLevele: Int) {
        self.noiseLevele = noiseLevele
        super.init(name: name, age: age)
    }
    
    @objc override func sing() {
        print("Helo!!!! Hello!! ")
    }
}

let hvm = HavyMetalSinger(name: "Denis", age: 31, noiseLevele: 99)

