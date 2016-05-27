//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
//闭包函数
var f : (Int, Int) ->Int
func test(a : Int, b : Int) ->Int {
    return 20
}

f = test
f(39, 20)


f = {
    (a : Int, b : Int) ->Int in
    print("a = \(a + b)")
    return a - b
}

f(39, 20)

//选择排序
func selectSort(inout a : [Int], function : (Int, Int) ->Bool) {
    for var i = 0; i < a.count - 1; i++ {
        var k = i
        for var j = i + 1; j < a.count; j++ {
            if function(a[j], a[k]) {
                k = j
            }
        }
        if k != i {swap(&a[i], &a[k])}
    }
}

var ar = [1, 43, 4, 3, 98, 45, 28]
selectSort(&ar, function: {
    (a : Int, b : Int) ->Bool in
    return a < b
})

selectSort(&ar) { (a, b) -> Bool in
    return a < b
}

selectSort(&ar, function: >)

selectSort(&ar, function: {
    $0 < $1
})

ar.sort(>)

