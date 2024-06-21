import Cocoa

// DEFAULT VALUES
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8) // uses default 12


//
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll() // default keepingCapacity to false, i.e. it frees up the array's memory
print(characters.count)


characters.removeAll(keepingCapacity: true) // don't free up memory as not using the default value now


// ERROR HANDLING

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

/**
 Tip: Most errors thrown by Apple provide a meaningful message that you can present to your user if needed. Swift makes this available using an error value that’s automatically provided inside your catch block, and it’s common to read error.localizedDescription to see exactly what happened.
 */

/**
 When you use try, you need to be inside a do block, and make sure you have one or more catch blocks able to handle any errors. In some circumstances you can use an alternative written as try! which does not require do and catch, but will crash your code if an error is thrown – you should use this rarely, and only if you’re absolutely sure an error cannot be thrown.
 */
