//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//检测API是否可用
if #available(iOS 10, OSX 10.11, *) {
    print("ios 9")
} else {
    print("not ios 9")
}

func test(){
    guard #available(iOS 10,OSX 10.11,*) else {
        return
    }
}



//forin循环
for x in 1...10 {
    print(x)
}

for _ in 1...10 {
    print("ss")
}

for index in 1...18 {
    print(index)
}

var _is = [1,2,3,4]
for i in _is {
    print(i)
}

var str11 = "znvkddnvvn"
for s in str11.characters {
    print(s)
}

for var i = 0;i < 10;i++ {
    print("\(i)")
}


//while循环
var j = 1
while j < 100 {
    j++
}


j = 1
var oddSum = 0
repeat {
    if j % 2 == 0 {
        oddSum++
    }
    j++
} while j <= 100

oddSum



//早退语句
var hasKey = true
var credit : Int? = 7
func dade() {
    
    guard hasKey else {
        return
    }
    guard let myCredit = credit where myCredit >= 6 else {
        return
    }
    
    print("欢迎乘坐出租车")
}


//switch语句
//范围匹配
var tempre = 20
switch tempre {
case 1...15:
    print("bsaaa")
case 16...30:
    print("skfhahk")
default:
    print("skhfkh")
}

var vegetable = "泰国黄辣椒"
switch vegetable {
    case "白菜":
    print("蔬菜是白菜")
    case "土豆":
    print("蔬菜是土豆")
case let x where x.hasSuffix("辣椒") :
    print("蔬菜是辣椒")
    print("是那种很辣很辣的\(x)")
default:
    print("不能吃，是草")
    
}


//元组匹配
var 坐标1 = (1,2)
switch 坐标1 {
case (0,0):
    print("原点")
case (_,2):
    print("asklhf")
default:
    print("kdn")
    
}

//where匹配
switch 坐标1 {
case (let x, let y) where x == y:
    print("kskdk")
default:
    break
}

//元组与switch综合
let onePoint : (Int, Int) = (1, 0)

switch onePoint {
case (0, 0):
    print("原点")
case (-2...2, -2...2):
    print("在矩形内")
case (_,0):
    print("在x轴上")
case (0,_):
    print("在y轴上")
default:
    print("不在范围")
}





