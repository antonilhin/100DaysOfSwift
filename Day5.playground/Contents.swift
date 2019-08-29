
import UIKit

//FUNCTIONS

func printErrorMessage() {
    let message = """
        Welcome to error screen!
           Error loading file!
        Please load correct file
    """
    print(message)
}

printErrorMessage()

// parametrs
func square(number: Int) {
    print(number * number)
}

square(number: 30)

// reurn

func square2(number: Int) -> Int {
    return number * number
}

let numSq = square2(number: 20)
print(numSq)

func writeData(number: Int) -> (Int, String) {
    return (number*number, "Write Error")
}

let res = writeData(number: 33)
print(res.1)
print(res.0)

// Parameter labels
func sayHellow(to name: String)  {
    print("Hello \(name)")
}

sayHellow(to: "Denis")

//Omitting parameter labels
func greet(_ name: String) {
    print("Hello \(name)!!!")
}

greet("Margarita")

// Default parameters

func helloUser(_ name: String, nicely: Bool = true) {
    if nicely {
        print("Hello, \(name)")
    } else {
        print("Oh no! It's \(name) again...")
    }
}

helloUser("Margarita")
helloUser("Margarita", nicely: false)

//Variadic functions
func sq(numbers: Int...) {
    for i in numbers {
        print("\(i) sqared is \(i*i)")
    }
}

sq(numbers: 1,2,3,4,5,6,7)


//Writing throwing functions
enum PasswordError: Error {
    case obvious
}

func passwordCheck(pass: String) throws -> Bool {
    if pass == "pass" {
        throw PasswordError.obvious
    }
    return true
}

do {
    try passwordCheck(pass: "pass")
    print("Password is Good")
} catch {
    print(error)
}

//inout parameters
func doubleNumber(number: inout Int) {
    number *= 2
}

var myNum = 10

doubleNumber(number: &myNum)
print(myNum)

func dayChecker(day: Int) {
    switch day {
    case 1:
        print("variables, simple data types, and string interpolation")
    case 2:
        print("arrays, dictionaries, sets, and enums")
    case 3:
        print("operators and conditions")
    case 4:
        print("loops, loops, and more loops")
    case 5:
        print("functions, parameters, and errors")
    default:
        print("unknown")
    }
}

dayChecker(day: 5)

