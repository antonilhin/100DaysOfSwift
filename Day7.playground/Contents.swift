import UIKit

//CLOSURES, PART TWO
func travel(action: (String) -> Void) {
    print("I'm getting ready to go!")
    action("London")
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}


//Using closures as parameters when they return values
func travel2(action: (String) -> String) {
    print("I am ready to go")
    let description = action("London")
    print(description)
    print("Well done!")
}

travel2 { (name: String) -> String in
    return "I'm going to \(name) in my car"
}

// Shorthand parameter names
travel2 { name -> String in
    return "I'm going to \(name) in my car"
}
travel2 { name in
    "I'm going to \(name) in my car"
}

travel2 {
    "I'm going to \($0) in my car"
}

//Closures with multiple parameters
func drivingACar(action: (String, Int) -> String) {
    print("Start engine")
    let direction = action("Toronto", 200)
    print(direction)
    print("Stop engine")
}

drivingACar {
    "I go to the \($0) at \($1) miles per hour."
}

//Returning closures from functions
func loadStarShip() -> (String) -> Void {
    return {
        print("The \($0) loaded")
    }
}

let result = loadStarShip()
result("Dragon")

loadStarShip()("Dragon 2")


// Capturing values
func loadShip() -> (String) -> Void {
    var i = 0
    return {
        print("The \($0) loaded")
        i += 1
    }
}

let res = loadShip()
res("Dragon")
res("Dragon2")
res("Dragon3")
res("Dragon4")
