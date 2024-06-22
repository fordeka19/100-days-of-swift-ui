import Cocoa

struct Car {
    let model: String
    let seats: Int
    private(set) var currentGear: Int
    
    enum GearDirection {
        case up, down
    }
    
    mutating func changeGear(direction: GearDirection) throws {
        print("About to move gear \(direction)")
        switch(direction) {
        case GearDirection.up:
            if (currentGear == 10) {
                throw GearError.aboveMax
            } else {
                currentGear += 1
            }
        case GearDirection.down:
            if (currentGear == 0) {
                throw GearError.belowMin
            } else {
                currentGear -= 1
            }
        }
    }
}

enum GearError: Error {
    case belowMin, aboveMax
}

// Test
var car = Car(model: "Peugeot", seats: 5, currentGear: 4)
print("--- Car starting with gear \(car2.currentGear) ----- ")
do {
    try car.changeGear(direction: Car.GearDirection.up)
    print("After moving gear up one: \(car.currentGear)")
    try car.changeGear(direction: Car.GearDirection.down)
    try car.changeGear(direction: Car.GearDirection.down)
    print("After moving gear down two: \(car.currentGear)")
} catch GearError.belowMin {
    print("Gear cannot be below 0")
} catch GearError.aboveMax {
    print("Gear cannot be above 10")
}

// Test GearError.aboveMax error
var car2 = Car(model: "Peugeot", seats: 5, currentGear: 10)
print("--- Car starting with gear \(car2.currentGear) ----- ")
do {
    try car2.changeGear(direction: Car.GearDirection.up)
    print("After moving gear up one: \(car2.currentGear)")
} catch GearError.belowMin {
    print("Gear cannot be below 0")
} catch GearError.aboveMax {
    print("Gear cannot be above 10")
}


// Test GearError.belowMin error
var car3 = Car(model: "Peugeot", seats: 5, currentGear: 0)
print("--- Car starting with gear \(car3.currentGear) ----- ")
do {
    try car3.changeGear(direction: Car.GearDirection.down)
    print("After moving gear down one: \(car3.currentGear)")
} catch GearError.belowMin {
    print("Gear cannot be below 0")
} catch GearError.aboveMax {
    print("Gear cannot be above 10")
}
