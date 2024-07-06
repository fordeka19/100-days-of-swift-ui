import Cocoa

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    
    func speak() {
        print("Barky bark bark")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() {
        print("Meow meow meow")
    }
}

class Corgi : Dog {
    override func speak() {
        // Different string for each subclass
        print("Corgi bark bark")
    }
}

class Poodle : Dog {
    override func speak() {
        // Different string for each subclass
        print("Poodle bark bark")
    }
}

class Persian : Cat {
    override func speak() {
        // Different string for each subclass
        print("Persian meow meow")
    }
}

class Lion : Cat {
    override func speak() {
        // Different string for each subclass
        print("Lion meow meow")
    }
}

let corgi = Corgi(legs: 4)
let poodle = Poodle(legs: 4)
corgi.speak()
poodle.speak()
print("Corgi has \(corgi.legs) legs")
print("Poodle has \(poodle.legs) legs")

let persian = Persian(isTame: true, legs: 4)
let lion = Lion(isTame: false, legs: 4)

persian.speak()
lion.speak()

print("Persian has \(persian.legs) legs")
print("Lion has \(lion.legs) legs")
print("Persian is tame? \(persian.isTame)")
print("Lion is tame? \(lion.isTame)")

let dog = Dog(legs: 4)
dog.speak()

let cat = Cat(isTame: true, legs: 4)
cat.speak()
