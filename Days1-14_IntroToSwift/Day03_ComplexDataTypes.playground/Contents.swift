import Cocoa

// ARRAYS

var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

// Reading values
print(beatles[0])
print(numbers[1])
print(temperatures[2])

// if array is variable you can add items, and there's nothing stopping you adding items more than once
beatles.append("Adrian")
beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

// Can only add data of the same TYPE as what the array was initialised with, this isn't allowed
// temperatures.append("Chris")

let firstBeatle = beatles[0]
let firstNumber = numbers[0]
//let notAllowed = firstBeatle + firstNumber // not allowed because of type safety

// Arrays can be initialised as follows:
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

// exact same as before, just with special syntax
var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

// providing initial values
var albums2 = ["Folklore"]
albums2.append("Fearless")
albums2.append("Red")

// USEFUL ARRAY FUNCTIONS

// count
print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

// remove
characters.remove(at: 2)
print(characters.count)

// removeAll
characters.removeAll()
print(characters.count)

// contains
let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

// sorted
let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

// reversed
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

/**Tip: When you reverse an array, Swift is very clever – it doesn’t actually do the work of rearranging all the items, but instead just remembers to itself that you want the items to be reversed. So, when you print out reversedPresidents, don’t be surprised to see it’s not just a simple array any more!**/


// DICTIONARIES
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

/**
 Swift provides an alternative to crashing when indexing and a value isn't there like in arrays: when you access data inside a dictionary, it will tell us “you might get a value back, but you might get back nothing at all.” Swift calls these optionals because the existence of data is optional - it might be there or it might not.
 */

print(employee2["name"]) // will print Optional("Taylor Swift")
print(employee2["job"])
print(employee2["location"])

print(employee2["name", default: "Unknown"]) // avoids the Optional part
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])

// can use other data types than strings
let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false,
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

// Can create an empty dictionary and set the keys one by one
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

/**
 if you set a value for a key that already exists, Swift will overwrite whatever was the previous value.
 */

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"

archEnemies["Batman"] = "Penguin" // rewrites the "Batman" key

/** count and removeAll() both exist for dictionaries, and work just like they do for arrays. */

// SETS

/** Sets  are similar to arrays, except you can’t add duplicate items, and they don’t store their items in a particular order.**/
let people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])

/**Notice how that actually creates an array first, then puts that array into the set? That’s intentional, and it’s the standard way of creating a set from fixed data.**/

/**You might see the names in the original order, but you might also get a completely different order – the set just doesn’t care what order its items come in.*/
print(people)

/**
 Insert instead of appends, because we're not adding to the end of the set.
 Set stores items in whatever order it wants!
 */
var people2 = Set<String>()
people2.insert("Denzel Washington")
people2.insert("Tom Cruise")
people2.insert("Nicolas Cage")
people2.insert("Samuel L Jackson")

/**
 REASONS TO USE SET INSTEAD OF ARRAY SOMETIMES:
 
 Not storing duplicates is sometimes exactly what you want.
 
 Instead of storing your items in the exact order you specify, sets instead store them in a highly optimized order that makes it very fast to locate items. And the difference isn’t small: if you have an array of 1000 movie names and use something like contains() to check whether it contains “The Dark Knight” Swift needs to go through every item until it finds one that matches – that might mean checking all 1000 movie names before returning false, because The Dark Knight wasn’t in the array.

 In comparison, calling contains() on a set runs so fast you’d struggle to measure it meaningfully.
 */



/** ENUMS 
 
 An enum – short for enumeration – is a set of named values we can create and use in our code.
 */

// can only have its specific values, avoids mistakenly setting other values to variables of the enum type later
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday // example: Can't accidentally set to "Friday " with extra space

// Alternative syntax; write case once and seperate each case with comma
enum Weekday2 {
    case monday, tuesday, wednesday, thursday, friday
}

// after the first assignment, don't need the enum name
var day2 = Weekday.monday
day2 = .tuesday
day2 = .friday

/**
 Although it isn’t visible here, one major benefit of enums is that Swift stores them in an optimized form – when we say Weekday.monday Swift is likely to store that using a single integer such as 0, which is much more efficient to store and check than the letters M, o, n, d, a, y.
 */
