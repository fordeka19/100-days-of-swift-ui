import Cocoa

// BOOLEANS
let goodDogs = true
let goodDogs2 = false

/**You can also assign a Boolean’s initial value from some other code, as long as ultimately it’s either true or false*/
let isMultiple = 120.isMultiple(of: 3)

/**Booleans have one special operator, !, which means “not”. This flips a Boolean’s value from true to false, or false to true.**/
var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// toggle is same as !, less code and very useful
var gameOver = false
print(gameOver)

gameOver.toggle()
print(gameOver)

// JOINING STRINGS TOGETHER
let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

/** This is wasteful. Swift can’t join all those strings in one go. Instead, it will join the first two to make “12”, then join “12” and “3” to make “123”, then join “123” and “4” to make “1234”, and finally join “1234” and “5” to make “12345” – it makes temporary strings to hold “12”, “123”, and “1234” even though they aren’t ultimately used when the code finishes. */
let luggageCode = "1" + "2" + "3" + "4" + "5"

/** Better to use string interpolation. String interpolation is much more efficient than using + to join strings one by one, but there’s another important benefit too: you can pull in integers, decimals, and more with no extra work.*/
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

// can put calculations inside interpolation
print("5 x 5 is \(5 * 5)")
