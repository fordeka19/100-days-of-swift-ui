import Cocoa

/**
 Similar to structs. The main thing is they introduce inheritance.
 SwiftUI uses structs extensively for UI design, but it uses classes extensively for its data

 Similarities:
 - You can create and name them
 - Add properties, methods, property observers and access control
 - Create custom initialisers to configure new instances
 
 Differences (5 key points)
 - You can make one class build upon functionality in another class
 - Swift won't generate a memberwise initialiser for classes (too complicated)
 - If you copy an instance of a class, both copies share the same data
 - We can add a deinitialiser to run when the final copy is destroyed
 - Constant class instances can have their variable properties changed.
 
 However, SwiftUI uses classes extensively, mainly for point 3: all copies of a class share the same data. This means many parts of your app can share the same information, so that if the user changed their name in one screen all the other screens would automatically update to reflect that change.
 
 The other points matter, but are of varying use:

 Being able to build one class based on another is really important in Apple’s older UI framework, UIKit, but is much less common in SwiftUI apps. In UIKit it was common to have long class hierarchies, where class A was built on class B, which was built on class C, which was built on class D, etc.
 Lacking a memberwise initializer is annoying, but hopefully you can see why it would be tricky to implement given that one class can be based upon another – if class C added an extra property it would break all the initializers for C, B, and A.
 Being able to change a constant class’s variables links in to the multiple copy behavior of classes: a constant class means we can’t change what pot our copy points to, but if the properties are variable we can still change the data inside the pot. This is different from structs, where each copy of a struct is unique and holds its own data.
 Because one instance of a class can be referenced in several places, it becomes important to know when the final copy has been destroyed. That’s where the deinitializer comes in: it allows us to clean up any special resources we allocated when that last copy goes away.
*/


/**
 Yes, the only difference between the below and a struct is that it was created using class rather than struct – everything else is identical. That might make classes seem redundant, but all five of their differences are important.
 */

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


// INHERITANCE

/**
 When one class inherits functionality from another class (its “parent” or “super” class), Swift will give the new class access (the “child class” or “subclass”) to the properties and methods from that parent class, allowing us to make small additions or changes to customize the way the new class behaves.
 */

/**
 We could make two subclasses of Employee, each of which will gain the hours property and initializer:
 
 To make one class inherit from another, write a colon after the child class’s name, then add the parent class’s name. For example, here is an Employee class with one property and an initializer.
 
 Notice how those two child classes can refer directly to hours – it’s as if they added that property themselves, except we don’t have to keep repeating ourselves.

 Each of those classes inherit from Employee, but each then adds their own customization. So, if we create an instance of each and call work(), we’ll get a different result:
 */


class Employee {
    let hours: Int // shared property
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() { // shared method
        print("I work \(hours) hours a day.")
    }}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

/**
 Because Developer inherits from Employee,
 we can immediately start calling printSummary() on instances of Developer, like this:
 */
let novall = Developer(hours: 8)
novall.printSummary()

// Child classes can override parent methods
class Developer2: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

/**
 FINAL CLASSES
 Tip: If you know for sure that your class should not support inheritance, you can mark it as final. This means the class itself can inherit from other things, but can’t be used to inherit from – no child class can use a final class as its parent.
 
 Final classes are ones that cannot be inherited from, which means it’s not possible for users of your code to add functionality or change what they have. This is not the default: you must opt in to this behavior by adding the final keyword to your class.

 Remember, anyone who subclasses your class can override your properties and perhaps also your methods, which offers them incredible power. If you do something they don’t like, bam – they can just replace that. They might still call your original method as well as their replacement, but they might not.

 This can be problematic: perhaps your class does something really important that mustn’t be replaced, or perhaps you have clients on a support contract and you don’t want them breaking the way your code works.
 */


/** HOW TO ADD INITIALISERS FOR CLASSES */

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

/** If a child class has any custom initialisers, it must always call the parent's initialiser after it has finished setting its own properties, if it has any*/
class Car: Vehicle {
    let isConvertible: Bool

    // custom initialiser
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

// Now we can make a car instance like so:
let teslaX = Car(isElectric: true, isConvertible: false)

// Tip: If a subclass does not have any of its own initializers, it automatically inherits the initializers of its parent class.


/**
 In Swift, all copies of a class instance share the same data, meaning that any changes you make to one copy will automatically change the other copies. This happens because classes are reference types in Swift, which means all copies of a class all refer back to the same underlying pot of data.

 To see this in action, try this simple class:
 */

class User {
    var username = "Anonymous"
}

var user1 = User()
var user2 = user1
user2.username = "Taylor"
print(user1.username)
print(user2.username)
// Both now Taylor

/**
 This might seem like a bug, but it’s actually a feature – and a really important feature too, because it’s what allows us to share common data across all parts of our app. As you’ll see, SwiftUI relies very heavily on classes for its data, specifically because they can be shared so easily.
 */

/**
 In comparison, structs do not share their data amongst copies, meaning that if we change class User to struct User in our code we get a different result: it will print “Anonymous” then “Taylor”, because changing the copy didn’t also adjust the original.

 If you want to create a unique copy of a class instance – sometimes called a deep copy – you need to handle creating a new instance and copy across all your data safely.
 */

class User2 {
    var username = "Anonymous"

    func copy() -> User2 {
        let user = User2()
        user.username = username
        return user
    }
}

// Now we can safely call copy() to get an object with the same starting data, but any future changes won’t impact the original.


// The following sprints the same output twice because enterprise.maxWarp = 9.6 copies it to both references
class Starship {
    var maxWarp = 9.0
}
var voyager = Starship()
voyager.maxWarp = 9.975
var enterprise = voyager
enterprise.maxWarp = 9.6
print(voyager.maxWarp)
print(enterprise.maxWarp)


/** DEINITIALISERS
 
 Swift’s classes can optionally be given a deinitializer, which is a bit like the opposite of an initializer in that it gets called when the object is destroyed rather than when it’s created.

 This comes with a few small provisos:

 Just like initializers, you don’t use func with deinitializers – they are special.
 Deinitializers can never take parameters or return data, and as a result aren’t even written with parentheses.
 Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
 We never call deinitializers directly; they are handled automatically by the system.
 Structs don’t have deinitializers, because you can’t copy them.
 
 
 The job of deinitializers is to tell us when a class instance was destroyed. For structs this is fairly simple: the struct is destroyed when whatever owns it no longer exists. So, if we create a struct inside a method and the methods ends, the struct is destroyed.

 However, classes have complex copying behavior that means several copies of the class can exist in various parts of your program. All the copies point to the same underlying data, and so it’s now much harder to tell when the actual class instance is destroyed – when the final variable pointing to it has gone away.
 
 So, the simple reason for why structs don’t have deinitializers is because they don’t need them: each struct has its own copy of its data, so nothing special needs to happen when it is destroyed.
 
 
 */

class User3 {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

/**Now we can create and destroy instances of that quickly using a loop – if we create a User instance inside the loop, it will be destroyed when the loop iteration finishes:*/
for i in 1...3 {
    let user = User3(id: i)
    print("User \(user.id): I'm in control!")
}

/**
 
 VARIABLES INSIDE CLASSS
 
 Swift’s classes work a bit like signposts: every copy of a class instance we have is actually a signpost pointing to the same underlying piece of data. Mostly this matters because of the way changing one copy changes all the others, but it also matters because of how classes treat variable properties.
 */

class User4 {
    var name = "Paul"
}

let user4 = User4()
user4.name = "Taylor"
print(user4.name)

/**
 That creates a constant User instance, but then changes it – it changes the constant value. That’s bad, right?

 Except it doesn’t change the constant value at all. Yes, the data inside the class has changed, but the class instance itself – the object we created – has not changed, and in fact can’t be changed because we made it constant.

 Think of it like this: we created a constant signpoint pointing towards a user, but we erased that user’s name tag and wrote in a different name. The user in question hasn’t changed – the person still exists – but a part of their internal data has changed.

 Now, if we had made the name property a constant using let, then it could not be changed – we have a constant signpost pointing to a user, but we’ve written their name in permanent ink so that it can’t be erased.
 
 In contrast, what happens if we made both the user instance and the name property variables? Now we’d be able to change the property, but we’d also be able to change to a wholly new User instance if we wanted. To continue the signpost analogy, it would be like turning the signpost to point at wholly different person.
 */

class User5 {
    var name = "Paul"
}

var user5 = User5()
user5.name = "Taylor"
user5 = User5()
print(user5.name)

/**
 That would end up printing “Paul”, because even though we changed name to “Taylor” we then overwrote the whole user object with a new one, resetting it back to “Paul”.

 The final variation is having a variable instance and constant properties, which would mean we can create a new User if we want, but once it’s done we can’t change its properties.
 
 One upside to all this is that classes don’t need to use the mutating keyword with methods that change their data. This keyword is really important for structs because constant structs cannot have their properties changed no matter how they were created, so when Swift sees us calling a mutating method on a constant struct instance it knows that shouldn’t be allowed.
 */
