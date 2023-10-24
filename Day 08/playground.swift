import Foundation


enum errorList: Error {
    case outOfBounds, noRoot
}

func countRoot(_ number: Int)throws ->  Int {
    if number < 1 || number > 10_000 {
        throw errorList.outOfBounds
    }
    
    for i in 1...100 {
        if i * i == number {
            return i
        }
    }
    
    throw errorList.noRoot
}

let num = 999

do {
    let res = try countRoot(num)
    print("Root of \(num) is \(res)")
} catch errorList.outOfBounds {
    print("Value of number should be between 1 and 10,000")
} catch errorList.noRoot {
    print("No integer root found for \(num)")
} catch {
    print("Error")
}
