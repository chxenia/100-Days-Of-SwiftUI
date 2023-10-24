func printRandomNumber(_ array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 0...100)
}

var arr: [Int]? = nil
print(printRandomNumber(arr)) 
