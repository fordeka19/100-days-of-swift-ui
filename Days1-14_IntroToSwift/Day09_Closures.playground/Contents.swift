import Cocoa

/*** Closures *
 
 One of the most common reasons for closures in Swift is to store functionality – to be able to say “here’s some work I want you to do at some point, but not necessarily now.” Some examples:

 Running some code after a delay.
 Running some code after an animation has finished.
 Running some code when a download has finished.
 Running some code when a user has selected an option from your menu.
 Closures let us wrap up some functionality in a single variable, then store that somewhere. We can also return it from a function, and store the closure somewhere else.
 
 
 **/

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser // assign function to variable
greetCopy()


// The part in brackets is a closure

let sayHello = {
    print("Hi there!")
}

sayHello()

// If we want the closure to accept parameters we need to put the information inside the braces

let sayHello2 = { (name: String) -> String in
    "Hi \(name)!"
}

sayHello2("Taylor")


/**
 That starts off easily enough: it’s a function that accepts an integer and returns a string. But when we take a copy of the function the type of function doesn’t include the for external parameter name, so when the copy is called we use data(1989) rather than data(for: 1989).

 Cunningly this same rule applies to all closures. Remember sayHello("Taylor"), it doesn't use the parameter name
 */
func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

// TRAILING CLOSURE SYNTAX, rather than passing full function as parameter,
// like let captainFirstTeam = team.sorted(by: { name1, name2 in ///) , pass closure as :
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

// Swift also provides parameter names automatically in shorthand
let reverseTeam = team.sorted {
    return $0 > $1
}

// one line
let reverseTeamOneLine = team.sorted { $0 > $1 }

/**
 There are no fixed rules about when to use shorthand syntax and when not to, but in case it’s helpful I use shorthand syntax unless any of the following are true:

 The closure’s code is long.
 $0 and friends are used more than once each.
 You get three or more parameters (e.g. $2, $3, etc).
 */

// EXAMPLES OF CLOSURES

// Filter
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

// Map
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

/**
 you’re going to be using closures a lot with SwiftUI:

 - When you create a list of data on the screen, SwiftUI will ask you to provide a function that accepts one item from the list and converts it something it can display on-screen.
 - When you create a button, SwiftUI will ask you to provide one function to execute when the button is pressed, and another to generate the contents of the button – a picture, or some text, and so on.
 - Even just putting stacking pieces of text vertically is done using a closure.
 */


// HOW TO TAKE A FUNCTION AS A PARAMETER

// (using here is the external parameter name)
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

// example usage 1
let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)


// example usage 1
func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)


func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

// Syntax with trailing closures:
doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}
