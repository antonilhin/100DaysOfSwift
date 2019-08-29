import UIKit

// LOOPS

// for loop
let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

for _ in 1...4 {
    print("counting")
}

//while
var number = 1

while number <= 12 {
    print("Number is \(number)")
    number += 1
}

// repeat

var n = 1

repeat {
    print(n)
    n += 1
} while n <= 12

repeat {
    print("once work")
} while false

// exit from loop

var countDown = 20

while countDown >= 0 {
    print(countDown)
    if countDown == 5 {
        print("I'm bored!")
        break
    }
    countDown -= 1
}

print("End loop")

// exit multiple loop
outerLoop: for i in 1...10 {
    for j in 1..<10 {
        let product = i*j
        print("\(i) * \(j) = \(product)")
        if product == 50 {
            break outerLoop
        }
    }
}

/// skip items

for i in 0...10 {
    if i % 3 == 1 {
        continue
    }
    print(i)
}

/// infinite loops

var counter = 0
while true {
    print("checking...")
    counter += 1
    
    if counter == 255 {
        break
    }
}

for i in 1...100 {
    if i == 4 {
        print("Day 4 – loops, loops, and more loops")
        break
    }
}
