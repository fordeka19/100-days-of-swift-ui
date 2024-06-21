import Cocoa

var array = ["one", "two", "three", "four", "three"]

print("Number of items in array: \(array.count)")
print("Number of unique items in array: \(Set(array).count)")
