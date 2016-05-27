//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)?
/*
    函数
*/
//多返回值 使用元组
func maxMain() -> (Int, Int) {
    return (Int.max, Int.min)
}

maxMain().0
maxMain().1

func add(a a:Int,b:Int,c:Int) -> Int{
    return a + b + c
}

add(a: 1, b: 4, c: 5)

//不定参数    不定参数可以当做数组来用
func sum(a:Int...) -> Int {
    var result = 0
    
    for number in a {
        result += number
    }
    
    return result
}

sum(1,2,4,5,0,26,63,2)

//函数型变量
func plus (a:(Int,Int,Int) -> Int, b:Int,c:Int) -> Int {
    return b + c
}


plus(add, b: 2, c: 3)

func sayHello(name : String) ->String {
    let greet = "Hello " + name + "!"
    return greet
}

var string = sayHello("lisi")

//函数返回值
func sayHello2(name: String, num: Int) ->Void {
    "Hello " + name + "!"
}

//有多个返回值
func count(string: String) ->(me: Int, you: Int, other: Int) {
    var me = 0, you = 0, other = 0
    for ch in string.characters {
        switch ch {
            case "我":
                me++
            case "你":
                you++
            default :
                other++
        }
    }
    return (me, you, other)
    
}


var result = count("我爱你，我想你，我恨你，我想打死你")
result.0
result.you
result.2


//默认参数函数
func printArray(a : [Int], s : String = "$", flag : Bool = true) {
    if flag {
        print("[")
    }
    for var i = 0; i < a.count; i++ {
        print("\(a[i])" + s)
    }
    print("\(a[a.count - 1])")
    if flag {
        print("]")
    }
}

var a = [1,2,3,4,5,6,7,8,9]

printArray(a, s: "$,", flag: true)

func arithmeticMean(numbers : Double...) ->Double {
    var total : Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1.2, 1.4, 3.2, 4.3)

func fa(x : Int) {
//    x = 20
}

func fb(var x : Int) {
    x = 200
}

func alignRight(var string : String, count : Int, pad : Character) ->String {
    let amountToPad = count - string.characters.count
    for _ in 1...amountToPad {
        string = String(pad) + string
    }
    return string
}

alignRight("Hello", count: 15, pad: "*")


func _swap(inout a : Int, inout b : Int) {
    print("a = \(a), b = \(b)")
    let t = a
    a = b
    b = t
    print("a = \(a), b = \(b)")
}

var x = 10
var y = 20

_swap(&x, b: &y)
print("x = \(x), y = \(y)")

//函数作为参数

func addTwoInts(a : Int, b : Int) ->Int {
    return a + b
}

func mulTwoInts(a : Int, b : Int) ->Int {
    return a * b
}

func printMathResult(a : Int, b : Int, function : (Int, Int) ->Int) {
    print("result = \(function(a, b))")
}

printMathResult(10, b: 20, function: mulTwoInts)
printMathResult(29, b: 22, function: addTwoInts)



var fs : [(Int, Int) ->Int] = [addTwoInts, mulTwoInts]

fs[0](293, 298)













