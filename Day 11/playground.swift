struct Car {
    let model: String
    let seatCount: Int
    var currentGear: Int = 0
    
    init(model: String, seatCount: Int) {
        self.model = model
        self.seatCount = seatCount
    }
    
    mutating func changeGear(up: Bool) {
        if up {
            if currentGear < 10 {
            currentGear += 1
            }
        } else {
            if currentGear > 0 {
                currentGear -= 1
            }
        }
    }
}

var myCar = Car(model: "Nissan", seatCount: 5)
print(myCar.model)
print(myCar.seatCount)
print(myCar.currentGear)
myCar.changeGear(up: true)
print(myCar.currentGear)
