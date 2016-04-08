//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

class StepComputer {
    var totalStep : Int = 0 {
        willSet {
            print("属性将要改变，要变成\(newValue)")
        }
        didSet {
            print("属性已经改变，改变前的\(oldValue)")
        }
    }
    
}

var setComputer = StepComputer()
setComputer.totalStep = 10




class Counter {
    
    var count = 0
    
    func increment() {
        count++
    }
    func incrementBy(amout : Int) {
        count += amout
    }
    func reset() ->Int {
        return count
    }
    func incrementBy(amout : Int, numberOfTimes : Int, a : Int) {
        count += amout * numberOfTimes + a
    }
    
    
}

var counter = Counter()
counter.count
counter.increment()
counter.count
counter.reset()
counter.incrementBy(394)
counter.count
counter.incrementBy(39, numberOfTimes: 20, a: 12)
counter.reset()

class SomeClass {
    
    var prop : Int = 0
    static var type_prop : Int = 0
    func instanceMethod() {
        prop = 20
        print("this is a instance method \(self.prop)")
        SomeClass.type_prop = 30
        SomeClass.typeMethod()
    }
    
    class func typeMethod() {
        self.type_prop = 30
        print("this is a class method \(self.type_prop)")
    }
    
    
}

var sc = SomeClass()
sc.instanceMethod()
SomeClass.typeMethod()

class Vehicle {
    
    var currentSpeed = 0.0
    var description : String {
        return "当前的速度是每小时\(currentSpeed)公里"
    }
    func makeNoise() {
        print("makenoise")
    }
    func show() {
        print("显示")
    }
    
    
    
}


class Bicycle: Vehicle {
    var hasBasket = false
}

var bicycle : Bicycle = Bicycle()
bicycle.show()
bicycle.currentSpeed = 39
bicycle.makeNoise()

