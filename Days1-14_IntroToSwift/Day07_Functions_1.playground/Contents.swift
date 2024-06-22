import Cocoa

// Functions

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

// isMultiple(of:) is a function that belongs to integers

let number = 139

if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}

// random() is a function, and the (in: 1...20) part marks configuration options

let roll = Int.random(in: 1...20)


// in Swift we have to label parameters
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

func printTimesTables(number: Int, end: Int) { // parameters passed in (remember as PP for parameters passed)
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

// order matters, has to be same as defined

printTimesTables(number: 5, end: 20) // the actual values passed in are arguments


// Returning values from functions

import Cocoa

let root = sqrt(169) // sqrt returns a value, just an example of existing function with return value
print(root)

///

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)


///
func areLettersIdentical(string1: String, string2: String) -> Bool {
    string1.sorted() == string2.sorted() // don't need return keyword when function has one line of code
}

let test = areLettersIdentical(string1: "abc", string2: "bca")
print(test)

// same for rollDice

func rollDice2() -> Int {
    Int.random(in: 1...6)
}

let c = pythagoras(a: 3, b: 4)
print(c)

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

// Returning multiple values from function
// Could use array but that's problematic
// Could use dictionary but it can be messy, can't know ahead of time if keys are present

// Swift has tuples

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

// don't actually have to repeat the names in the return value
func getUser1() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

// alternatively can do this but it's not as nice as names
func getUser2() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}
let user2 = getUser()
print("Name: \(user.0) \(user.1)")

// Can pull the tuple into individual values if you want
let (firstName, lastName) = getUser() // this is called destructuring

let (firstName1, _) = getUser() // just the first name



// Customise parameter names


func rollDice(sides: Int, count: Int) -> [Int] {
    // Start with an empty array
    var rolls = [Int]()

    // Roll as many dice as needed
    for _ in 1...count {
        // Add each result to our array
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }

    // Send back all the rolls
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)


/*
 This method of naming parameters for external use is so important to Swift that it actually uses the names when it comes to figuring out which method to call. This is quite unlike many other languages, but this is perfect valid in Swift:
 */
func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

// these aren't always helpful, we don't always need an external label

let lyric = "I see a red door and I want it painted black"
print(lyric.hasPrefix("I see")) // we don't need  hasPrefix(string:) or hasPrefix(prefix:)

//We can use the same technique in our own functions, if you think it reads better. For example, previously we had this function:

func isUppercase(_ string: String) -> Bool { // the underscore removes need for label
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result2 = isUppercase(string)


// you can add a second external name such as for
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

/*this is not allowed because of the for keyword hence using the above instead
 
 func printTimesTables(for: Int) {
     for i in 1...12 {
         print("\(i) x \(for) is \(i * for)")
     }
 }

 */

printTimesTables(for: 5)
