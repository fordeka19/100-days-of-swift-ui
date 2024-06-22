import Cocoa

/** STRUCTS - ACCESS CONTROL
 
 By default, Swift’s structs let us access their properties and methods freely, but sometimes you want to hide some data from external access
 */


struct BankAccount {
    var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

/**
 But the funds property is just exposed to us externally, so what’s stopping us from touching it directly? The answer is nothing at all – this kind of code is allowed:
 account.funds -= 1000
 
 That completely bypasses the logic we put in place to stop people taking out more money than they have, and now our program could behave in weird ways.
 */

/**
Use private for “don’t let anything outside the struct use this.”
Use fileprivate for “don’t let anything outside the current file use this.”
Use public for “let anyone, anywhere use this.”
 
 There’s one extra option that is sometimes useful for learners, which is this: private(set). This means “let anyone read this property, but only let my methods write it.” If we had used that with BankAccount, it would mean we could print account.funds outside of the struct, but only deposit() and withdraw() could actually change the value.
 
 Important: If you use private access control for one or more properties, chances are you’ll need to create your own initializer.
 */



/** STATIC PROPERTIES AND FUNCTIONS
 
 Sometimes  you want to add a property or method to the struct itself, rather than to one particular instance of the struct, which allows you to use them directly. Used a lot with SwiftUI for two things: creating example data, and storing fixed data that needs to be accessed in various places.
 */

struct School {
    static var studentCount = 0

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

/**
We can use add() and studentCount directly on the struct without creating an instance. This is because those are both static, which means they don’t exist uniquely on instances of the struct.
 
 Don't need to mark method as mutating
 
 If you want to mix and match static and non-static properties and methods, there are two rules:

 To access non-static code from static code… you’re out of luck: static properties and methods can’t refer to non-static properties and methods because it just doesn’t make sense – which instance of School would you be referring to?
 To access static code from non-static code, always use your type’s name such as School.studentCount. You can also use Self to refer to the current type.
 
 Now we have self and Self, and they mean different things: self refers to the current value of the struct, and Self refers to the current type.
 */


/** COMMON USES OF STATIC DATA */


// Use 1: Organising common data in apps
struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

// Can simply read
AppData.version


// Use 2: Create examples of structs.
// SwiftUI works best when it can show previews of your app as you develop,
// and those previews often require sample data.
// This is best done using a static example property on the struct, like this:
struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

// now whenever you need an Employee instance to work with in your design previews use:
Employee.example
