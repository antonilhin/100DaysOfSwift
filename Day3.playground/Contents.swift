import UIKit

//OPERATORS AND CONDITIONS

let firstScore = 30
let secondScore = 5

// + and -
let total = firstScore + secondScore
let difference = firstScore - secondScore

// * and /
let multiply = firstScore * secondScore
let divided = firstScore / secondScore

// %
let reminder = firstScore % secondScore
let reminder2 = 33 % secondScore


// Operator overloading
let meaningOfLife = 42
let doubleMeaning = 42 + 42

// str
let name = "Denis"
let fullName = name + " Andreev"

//arr
let firstAnimals = ["fish", "frog"]
let secondAenimals = ["lizard", "dinosaurs"]
let olderPeripdAnimals = firstAnimals + secondAenimals

//Compound assignment operators
var score = 44
score -= 4
score *= 2
score /= 2
score += 6

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

// Comparison operators
firstScore == secondScore
firstScore != secondScore

firstScore < secondScore
firstScore >= secondScore

// comparison work with strings
"Blink 182" <= "Linkin Park"

// Conditions
let firstDay = 23
let secondDay = 27

if firstDay + secondDay == 50 {
    print("You do it!")
} else if firstDay + secondDay < 50 {
    print("You can do it! ")
} else {
    print("That's Great!")
}

//Combining conditions
let age1 = 21
let age2 = 18

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("One of them is over 18")
}

//The ternary operator
let firstCart = 11
let secondCard = 21

print(firstCart == secondCard ? "Cards are the same" : "Cards are different")

//Switch statements
let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
// fallthrough
default:
    print("Enjoy your day!")
}


//Range operators
let scoreCount = 55

switch scoreCount {
case 0..<50:
    print("You failed badly!")
case 50..<90:
    print("You did OK!")
default:
    print("You did it!")
}

let a = 10...22


let day = 3

if day == 3 {
    print("Day 3 out of 100 days of Swift!")
}

