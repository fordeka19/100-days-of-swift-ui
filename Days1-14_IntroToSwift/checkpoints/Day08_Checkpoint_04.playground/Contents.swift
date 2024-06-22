import Cocoa

enum SqrtError: Error {
    case OutOfBounds, NoRoot
}

func squareRoot(_ number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw SqrtError.OutOfBounds
    }
    
    for i in 0...number {
        if (i * i == number) {
            return i
        }
    }
    
    throw SqrtError.NoRoot
}

print(try squareRoot(16))

print(try squareRoot(9))
