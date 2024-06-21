import Cocoa

let score = 85

if (score > 80) {
    print("Great job")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going we don't need roads")
}

if percentage < 85
{
    print("Sorry, you failed the test")
}

if age >= 18 {
    print("You're eligible to vote")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"
    
if (ourName < friendName) {
    print("It's \(ourName) va \(ourName)")
}

var numbers = [1, 2, 3]

if (numbers.count > 3) {
    numbers.remove(at: 0)
}

print(numbers)

let country = "Canada"

if country == "Australia" {
    print("G'day")
}

let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)")
}
    
var username = "taylorswift13"

if username == "" { // better than username.count == 0 because Swift counts all the characters
    username = "Anonymous"
}

print("Welcome, \(username)")

if username.isEmpty { // better again
    username = "Anonymous"
}

print("Welcome, \(username)")

// comparing types of data
let firstName = "Paul"
let secondName = "Sophie"

let firstAge = 40
let secondAge = 10

print(firstName == secondName)
print(firstName != secondName)
print(firstName < secondName)
print(firstName >= secondName)

print(firstAge == secondAge)
print(firstAge != secondAge)
print(firstAge < secondAge)
print(firstAge >= secondAge)

// we can make enums comparable
enum Sizes: Comparable {
    case small
    case medium
    case large
}

let first = Sizes.small
let second = Sizes.large
print(first < second) // That will print “true”, because small comes before large in the enum case list.



// Check multiple conditions

let age1 = 16

if age1 >= 18 {
    print("You can vote in the next election")
} else {
    print("Sorry you're too young to vote")
}

// else if
if age1 >= 18 {
    print("You are 18 or over")
} else if (age1 < 16){
    print("You're under 16")
} else {
    print("Something else")
}

// logical AND
let temp = 25

if temp > 20 && temp < 30 {
    print("It's a nice day")
}

// logical OR
let userAge = 14
let hasParentalConsent = true

if age >= 18 || hasParentalConsent{
    print("You can buy the game!")
}


// Detailed example

enum TransportOption {
    case airplane, helicoptor, bicycle, car, escooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicoptor {
    print("Let's fly!")
} else if (transport == .bicycle) {
    print("I hope there's a bike path")
} else if transport == .car {
    print("Time to get stuck in traffic")
} else {
    print("I'm going to hire a scooter now!")
}


// SWITCH STATEMENTS

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun


// without switch
if forecast == .sun {
    print("It should be a nice day")
} else if forecast == .rain {
    print("Pack an umbrella")
} else if forecast == .wind {
    print("It's windy")
} else if forecast == .rain { // this second rain check could be added accidentally without a switch
    print("This should have been a show check")
} else {
    print("Our forecase generator is broken")
}

// Switch
switch forecast {
case .sun:
    print("It should be a nice day")
case .rain:
    print("Pack an umbrella")
case .wind:
    print("It's windy")
case .snow: // cannot put rain here again as can't have duplicates, also must be exhaustive
    print("This should have been a show check")
case .unknown:
    print("Our forecase generator is broken")
}


// default
let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default: // if no cases match
    print("Who are you?")
}

// fallthrough

/**
 This prints the following if given day  = 5 because it "falls through" all cases. It isn't commonly used but good to know about
 
 My true love gave to me...
 5 golden rings
 4 calling birds
 3 French hens
 2 turtle doves
 A partridge in a pear tree
 */
let day = 5
print("My true love gave to me...")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}


// TERNARY CONDITIONAL OPERATOR
let age2 = 18
// WTF - WHAT / TRUE / FALSE (what are we checking (age2 >= 18), true or false)
let canVote = age2 >= 18 ? "Yes" : "No"
print(canVote)

let hour = 23

print(hour < 12 ? "It's before noon" : "It's after noon") // cannot do this with if/else unless you move the if/else outside and have two print statements

let names = ["Jayne", "Kaylee", "Mal"]

let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)

