import UIKit

// Type of data
var latitude: Double = 322222222226.166667
var longitude: Float = -128614.783333

let (ddx, ddy) = (3, 4)
print(ddx)

var age = 31
var lat = 45.34343
var name = "User"
var isValid = true

//=
var u_age: Int = 31
var u_pos: Double = 34.003
var u_name: String = "Denis"
var u_isValid: Bool = true

"Your name is \(u_name) and you are \(u_age) years old"

//=========
var a = 10

a = a + 1
a = a - 1
a = a * 10
a = a / 5

var b = 4
b += 4
b -= 4
b *= 5
b /= 2

var x = 3.0
var y = 4.2
var z = x + y

var st = "User1"
var st1 = "User2"

var summ = st + " and " + st1

z < 7
z < 8
z > 8
z > 7
z <= 7
z >= 7


var name1 = "Denis"
name1 == "Denis"
name1 != "Jon"

var stayOut = true
!stayOut

var bit_a = 3
bit_a << 1
bit_a >> 1

bit_a & 6
///==============================
var songs = ["Hello", "My December", "Boys and girls"]
songs[0]
songs[1]
songs[2]

type(of: songs)

var songs2 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]
var both = songs + songs2

// Dictionarys
let user = [
    "name": "Denis",
    "age": "31",
    "website": "felarmir.com"
]

user["name"]
user["age"]


var action: String = ""
var stayOutTooLate = true
var nothingInBrain = true

if !stayOutTooLate && !nothingInBrain {
    action = "cruise"
}


/// loops review

for i in 1...10 {
    print("\(i) * 10 is \(i * 10)")
}

var str = "Fakers gonna"

for _ in 1...5 {
    str += " fake"
}

print(str)

var songs_2 = ["Hello", "My December", "Boys and girls"]


for song in songs_2 {
    print("My favorite song is \(song)")
}

var people = ["player", "haters", "hart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0...3 {
    print("\(people[i]) act \(actions[i])")
}

//correct
for i in 0..<people.count {
    var str = "\(people[i])  gonna"
    
    for _ in 1...5 {
        str += " \(actions[i])"
    }
    
    print(str)
}

//while

for song in songs_2 {
    if song == "Hello" {
        continue
    }
    
    print("-> \(song)")
}


let studioAlbums = 1

switch studioAlbums {
case 0...1:
    print("You're just starting out")
    
case 2...3:
    print("You're a rising star")
    
case 4...5:
    print("You're world famous!")
    
default:
    print("Have you done something new?")
}
