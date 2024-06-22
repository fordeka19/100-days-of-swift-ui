import Cocoa

// STRUCTS


/** Swift’s structs let us create our own custom, complex data types, complete with their own variables and their own functions. **/
struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

/** Note: When you’re referring to a data type, we use camel case where the first letter is uppercased, but when you’re referring to something inside the type, such as a variable or function, we use camel case where the first letter is lowercased */

/** At this point, Album is just like String or Int – we can make them, assign values, copy them, and so on. For example, we could make a couple of albums, then print some of their values and call their functions: */
let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

/**
 Where things get more interesting is when you want to have values that can change. For example, we could create an Employee struct that can take vacation as needed:
 
 However, that won’t actually work – Swift will refuse to build the code.
 
 You see, if we create an employee as a constant using let, Swift makes the employee and all its data constant – we can call functions just fine, but those functions shouldn’t be allowed to change the struct’s data because we made it constant.*/

/* struct Employee {
    let name: String
    var vacationRemaining: Int

    func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}
*/


/** MUTATING
 
 As a result, Swift makes us take an extra step: any functions that only read data are fine as they are, but any that change data belonging to the struct must be marked with a special mutating keyword, like this: */

struct Employee {
    let name: String
    var vacationRemaining: Int

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

// this is allowed
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

// this is not - Cannot use mutating member on immutable value: 'archer2' is a 'let' constant
/*let archer2 = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer2.takeVacation(days: 5)
print(archer.vacationRemaining)*/

/**
 Naming:

 - Variables and constants that belong to structs are called properties.
 - Functions that belong to structs are called methods.
 - When we create a constant or variable out of a struct, we call that an instance – you might create a dozen unique instances of the Album struct, for example.
 - When we create instances of structs we do so using an initializer like this: Album(title: "Wings", artist: "BTS", year: 2016).
 
 That last one is a bit of syntactic sugar – Swift silently creates a special function inside the struct called init(), using all the properties of the struct as its parameters. It then automatically treats these two pieces of code as being the same: 
 
 var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
 var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)
 */

/* Swift is intelligent in the way it generates its initializer, even inserting default values if we assign them to our properties. */

// say we have these two properties, name and vacationRemaining with  default value

struct Employee2 {
    let name: String
    var vacationRemaining = 14

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

/** Then Swift will silently generate an initializer with a default value of 14 for vacationRemaining, making both of these valid: */
let kane = Employee2(name: "Lana Kane")
let poovey = Employee2(name: "Pam Poovey", vacationRemaining: 35)

/** 
 
 Tip: If you assign a default value to a constant property, that will be removed from the initializer entirely. To assign a default but leave open the possibility of overriding it when needed, use a variable property.
*/

/** HOW TO COMPUTE PROPERTY VALUES DIRECTLY */

/** 
 
 Structs can have two kinds of property: a stored property is a variable or constant that holds a piece of data inside an instance of the struct, and a computed property calculates the value of the property dynamically every time it’s accessed.
 
 This means computed properties are a blend of both stored properties and functions: they are accessed like stored properties, but work like functions.
 */

// If we're tracking vacation trivially we could use
struct Employee3 {
    let name: String
    var vacationRemaining: Int
}

var archer3 = Employee3(name: "Sterling Archer", vacationRemaining: 14)
archer3.vacationRemaining -= 5
print(archer3.vacationRemaining)
archer3.vacationRemaining -= 3
print(archer3.vacationRemaining)

// We could adjust this to use a computed property:
struct Employee4 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int { // now it's calculated instead of assigned directly
        vacationAllocated - vacationTaken
    }
}

/** When we’re reading from vacationRemaining, it looks like a regular stored property.
 We’re reading what looks like a property, but behind the scenes Swift is running some code to calculate its value every time.*/
var archer4 = Employee4(name: "Sterling Archer", vacationAllocated: 14)
archer4.vacationTaken += 4
print(archer4.vacationRemaining)
archer4.vacationTaken += 4
print(archer4.vacationRemaining)

// To write to it, we need to provide both a getter and a setter
struct Employee5 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }

        set {
            vacationAllocated = vacationTaken + newValue // newValue is provided by Swift automatically and stores whatever value the user was trying to assign to the property
        }
    }
}

var archer5 = Employee5(name: "Sterling Archer", vacationAllocated: 14)
archer5.vacationTaken += 4
archer5.vacationRemaining = 5
print(archer5.vacationRemaining) // 5 is printed
print(archer5.vacationAllocated) // 9 is printed (see setter)

/**
 How to take action when a property changes
 
 Swift lets us create PROPERTY OBSERVERS which are special pieces of code that run when properties change. 
 
 - a didSet observer to run when the property just changed
 - a willSet observer to run before the property changed
 */

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

/**
 Swift automatically provides the constant oldValue inside didSet, in case you need to have custom functionality based on what you were changing from. There’s also a willSet variant that runs some code before the property changes, which in turn provides the newValue that will be assigned in case you want to take different action based on that.
 */

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

/**
 didSet is more commonly used.
 
 The most common time willSet is used is when you need to know the state of your program before a change is made. For example, SwiftUI uses willSet in some places to handle animations so that it can take a snapshot of the user interface before a change. When it has both the “before” and “after” snapshot, it can compare the two to see all the parts of the user interface that need to be updated.
 
 Swift’s property observers let us attach functionality to be run before or after a property is changed, using willSet and didSet respectively. Most of the time property observers aren’t required, just nice to have – we could just update a property normally then call a function ourselves in code. So why bother? When would you actually use property observers?

 The most important reason is convenience: using a property observer means your functionality will be executed whenever the property changes.
 
 There is one place where using a property observer is a bad idea, and that’s if you put slow work in there. If you had a User struct with an age integer, you would expect that changing age would take place virtually instantly – it’s just a number, after all. If you attach a didSet property observer that does all sorts of slow work, then suddenly changing a single integer could take way longer than you expected, and it could cause all sorts of problems for you. So, avoid putting too much work into property observers.
 */

/** CUSTOM INITIALISERS
 
 Initializers are specialized methods that are designed to prepare a new struct instance to be used.
 */

// Let’s start by looking again at Swift’s default initializer for structs:
struct Player {
    let name: String
    let number: Int
}

// memberwise initialiser
let player = Player(name: "Megan R", number: 15)

struct Player2 {
    let name: String
    let number: Int

    // Swift silently generates an initialiser like this
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

/**
 - There is no func keyword. Yes, this looks like a function in terms of its syntax, but Swift treats initializers specially.
 - Even though this creates a new Player instance, initializers never explicitly have a return type – they always return the type of data they belong to.
 - I’ve used self to assign parameters to properties to clarify we mean “assign the name parameter to my name property”.
 */

/**
 Custom initializers don’t need to work like the default memberwise initializer Swift provides us with
 
Golden rule: all properties must have a value by the time the initializer ends
 */

struct Player3 {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player3(name: "Megan R")
print(player.number)

/**
 Important: Although you can call other methods of your struct inside your initializer, you can’t do so before assigning values to all your properties – Swift needs to be sure everything is safe before doing anything else.

 You can add multiple initializers to your structs if you want, as well as leveraging features such as external parameter names and default values.
 
 As soon as you implement your own custom initializers you’ll lose access to Swift’s generated memberwise initializer unless you take extra steps to retain it.
 */

// To keep the Swift initialiser, move your custom initializer to an extension, like this:
struct Employee6 {
    var name: String
    var yearsActive = 0
}

extension Employee6 {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}

// creating a named employee now works
let roslin = Employee6(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = Employee6()
