protocol Building {
    var roomsCount: Int { get }
    var cost: Int { get }
    var agentName: String { get }
    
    func printSalesSummary()
}

struct House: Building {
    let roomsCount: Int
    let cost: Int
    let agentName: String
    
    func printSalesSummary() {
        print("House Details:")
        print("Number of rooms: \(roomsCount)")
        print("Cost: $\(cost)")
        print("Estate Agent: \(agentName)")
    }
}

struct Office: Building {
    let roomsCount: Int
    let cost: Int
    let agentName: String
    
    func printSalesSummary() {
        print("Office Details:")
        print("Number of rooms: \(roomsCount)")
        print("Cost: $\(cost)")
        print("Estate Agent: \(agentName)")
    }
}

let myHouse = House(roomsCount: 3, cost: 250000, agentName: "ABC Real Estate")
myHouse.printSalesSummary()

let myOffice = Office(roomsCount: 5, cost: 1000000, agentName: "XYZ")
myOffice.printSalesSummary()
