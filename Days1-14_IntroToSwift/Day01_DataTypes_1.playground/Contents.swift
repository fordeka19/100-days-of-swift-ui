import Cocoa

/** VARIABLES AND CONSTANTS */
var greeting = "Hello, playground"

var name = "Ted"
name = "Rebecca"
name = "Keeley"

// constant
let character = "Daphne"

let character2 = "Daphne"
//character2 = "Eloise" // will not work, cannot change constants
//character2 = "Francesca" // will not work, cannot change constants


// When you’re learning Swift, you can ask Xcode to print out the value of any variable.

var playerName = "Roy"
print(playerName)

/* If you can, prefer to use constants rather than variables – not only does it give Swift the chance to optimize your code a little better, but it also allows Swift to make sure you never change a constant’s value by accident.*/
playerName = "Dani"
print(playerName)

// camel case is convention for Swift
playerName = "Sam"
print(playerName)

/** STRINGS */
let actor = "Denzel Washington"

// You can use punctuation, emoji, quotes and other characters:
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"
let quote = "Then he tapped a sign saying \"Believe\" and walked away."

// Strings across multiple lines
let movie = """
A day in
the life of an
Apple engineer
"""

// USEFUL STRING FUNCTIONS/PROPERTIES

print(actor.count) // Length of string

print(result.uppercased()) // Make every letter uppercase

print(movie.hasPrefix("A day"))

print(filename.hasSuffix(".jpg"))

/** Strings are case-sensitive in Swift, which means using filename.hasSuffix(".JPG") will return false because the letters in the string are lowercase. */

/**WHOLE NUMBERS */
let score = 10

let reallyBig = 100000000

let reallyBig2 = 100_000_000 // easier to read

// Can create integers from other integers using arithmetic operators
let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2
print(score)

var counter = 10
counter += 5 // shorthand for counter = counter + 5
print(counter)

// similarly to above
counter *= 2
print(counter)
counter -= 10
print(counter)
counter /= 2
print(counter)

let number = 120
print(number.isMultiple(of: 3)) // useful function for integers

print(120.isMultiple(of: 3)) // can call it on number directly

/** DECIMAL / FLOATING POINT NUMBERS */

//When this runs it won’t print 0.3. Instead, it will print 0.30000000000000004
let decimal = 0.1 + 0.2
print(decimal)


let a = 1
let b = 2.0
// let c = a + b // will produce error

// need to do either of the following
let c = a + Int(b)
let c2 = Double(a) + b

/**
 Third, Swift decides whether you wanted to create a Double or an Int based on the number you provide – if there’s a dot in there, you have a Double, otherwise it’s an Int. Yes, even if the numbers after the dot are 0.
 */
let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

/**Combined with type safety, this means that once Swift has decided what data type a constant or variable holds, it must always hold that same data type.**/

// This code is fine
var name2 = "Nicolas Cage"
name2 = "John Travolta"

// This code is not
var name3 = "Nicolas Cage"
//name3 = 57 // cannot do this

// Decimal numbers have the same range of operators and compound assignment operators as integers:
var rating = 5.0
rating *= 2
