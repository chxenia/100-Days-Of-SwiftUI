import Foundation

let array: [String] = ["Apple", "Banana", "Peach", "Pineapple", "Apple", "Banana", "Brr", "Peach"]
let setArray: Set<String> = Set(array) 
print("The amount of element in my array is: \(array.count). The amount of orig elements is: \(setArray.count)")
