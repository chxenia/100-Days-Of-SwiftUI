import Foundation

for i in 1...100 {
    print("\(i) should print: ")
    
    if i.isMultiple(of: 5) && i.isMultiple(of: 3) {
        print("FizzBuzz")
    }
    else if i.isMultiple(of: 3) {
        print("Fizz")
    }
    
    else if i.isMultiple(of: 5) {
        print("Buzz")
    }
    
    else {
        print(i)
    }
}
