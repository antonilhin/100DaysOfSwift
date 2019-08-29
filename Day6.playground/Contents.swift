import UIKit

//Day 6 – closures part one

//Creating basic closures
let refreshData = {
    print("Refreshed")
}
refreshData()

let searchig = {
    print("Not found")
}
searchig()

//Accepting parameters in a closure
let walking = { (place: String) in
    print("I am wolking in the \(place)")
}

walking("Street")
walking("Apartment")

// Returning values from a closure
let sayHello = { (name: String) -> String in
    return "Hello, \(name)"
}

let helloDenis = sayHello("Denis")
print(helloDenis)

//Closures as parameters
let driving = {
    print("Driving to home")
}

func travel(act: () -> Void) {
    print("Stage 1")
    act()
    print("Done")
}

travel(act: driving)

//Trailing closure syntax
func travelHome(act: () -> Void) {
    print("Stage 1")
    act()
    print("Done")
}

travelHome {
    print("Fast speed to home")
}

travelHome() {
    print("Slow speed to home")
}

// Day six

let dayShower = { (day: Int) -> String in
    switch day {
    case 1:
        return "variables, simple data types, and string interpolation"
    case 2:
        return "arrays, dictionaries, sets, and enums"
    case 3:
        return "operators and conditions"
    case 4:
        return "loops, loops, and more loops"
    case 5:
        return "functions, parameters, and errors"
    case 6:
        return "Day 6 – closures part one"
    default:
        return "unknown"
    }
}
print(dayShower(6))

