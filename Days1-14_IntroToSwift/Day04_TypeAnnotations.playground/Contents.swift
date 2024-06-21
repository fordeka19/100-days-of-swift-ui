import Cocoa

// This uses type inference
let surname = "Lasso"
var score = 0

// This uses type annotations to be explicit
let surname2: String = "Lasso"
var score2: Int = 0

// Important incase we wanted the score to be a decimal instead of inferred type Int
var scoreDecimal: Double = 0

// Some types worth knowing the names of if you need them for type annotations in Swift
let playerName: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isAuthenticated: Bool = true
var albums: [String] = ["Red", "Fearless"] // array
var user: [String: String] = ["id": "@twostraws"] // dictionary
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"]) // set

// if creating empty array, need the type, this can be done multiple ways:
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]() // author prefers type inference as much as possible so likely to use this

// Enums

// Values of an enum have the same type as the enum itself
enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light

// future assignments can be written as follows:
style = .dark

/**
To prefer type inference, instead of having to do let score: Double = 0 , you can do var score = 0.0
 */

/**
 The most common exception to this is with constants I don’t have a value for yet. You see, Swift is really clever: you can create a constant that doesn’t have a value just yet, later on provide that value, and Swift will ensure we don’t accidentally use it until a value is present. It will also ensure that you only ever set the value once, so that it remains constant.
 */

// this REQUIRES a type annotation so that Swift will know what type of value will be assigned later
let username: String
// lots of complex logic
username = "@twostraws"
// lots more complex logic
print(username)

/** Regardless of whether you use type inference or type annotation, there is one golden rule: Swift must at all times know what data types your constants and variables contain.
 This is at the core of being a type-safe language, and stops us doing nonsense things like 5 + true or similar.
 */

/** Important: Although type annotation can let us override Swift’s type inference to a degree, our finished code must still be possible. For example, this is not allowed */
// let score: Int = "Zero" // THIS IS NOT ALLOWED!
