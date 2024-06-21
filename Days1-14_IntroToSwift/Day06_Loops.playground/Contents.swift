import Cocoa

// LOOPS
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os)")
}

for i in 1...12 {
    print("The \(i) times tables:")
    
    for j in 1...12 {
        print("   \(j) x \(i) is \(j * i)")
    }
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting from 1 up to 5: \(i)")
}

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)

// RANGES
print(platforms[1...3])
print(platforms[1...]) // prints to the end of the array


// WHILE LOOP - useful when you want some custom condition

var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

print("Blast off!")


// Int.random and Double.random

let id = Int.random(in: 1...1000)

let amount = Double.random(in: 0...1)

// using .random

var roll = 0

while roll != 20 { // keep looping until a 20 is rolled (critical hit in Dungeons and Dragons)
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

print("Critical hit!")


// SKIPPING ITEMS IN LOOP; CONTINUE and BREAK


// Continue
let filenames = ["me.jpg", "work.text", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false { // only print jpgs
        continue
    }
    
    print("Found picture: \(filename)")
}

// Break

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)

        if multiples.count == 10 { // get the first 10 multiples
            break
        }
    }
}

print(multiples)

// LABELED STATEMENTS

let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}
