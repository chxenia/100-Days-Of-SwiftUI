class Animal {
    let legs: Int 
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog : Animal {
    
    func speak() {
        print("Bark!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Cark!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Park!")
    }
}

class Cat : Animal {
    let isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Meow!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Peow!")
    }

}

class Lion: Cat {
    override func speak() {
        print("Leow!")
    }
 
}

let animal = Animal(legs: 4)
print("Number of legs: \(animal.legs)") 

let dog = Dog(legs: 4)
dog.speak() 

let cat = Cat(legs: 4, isTame: true)
cat.speak() 
print("Is cat tame? \(cat.isTame)")

let corgi = Corgi(legs: 4)
corgi.speak() 

let poodle = Poodle(legs: 4)
poodle.speak() 

let persian = Persian(legs: 4, isTame: true)
persian.speak()
print("Is Persian cat tame? \(persian.isTame)") 

let lion = Lion(legs: 4, isTame: false)
lion.speak() 
print("Is lion tame? \(lion.isTame)")
