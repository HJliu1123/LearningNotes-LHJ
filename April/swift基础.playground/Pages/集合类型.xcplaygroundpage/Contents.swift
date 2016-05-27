//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
/*
    数组
*/

var arr : Array<String>

arr = ["akf", "afhu"]

arr.insert("skf", atIndex: 1)
arr.removeAtIndex(1)
//删除前面一个
arr.removeFirst(1)


var array : Array<Int> = Array<Int>()
array.append(10)
var array1 = Array<Int>()
array1.append(100)
var array2 : [Int] = [3,5,6,3]
var array3 = [4,2,3]
var array4 = [String]()
array4.append("dlfk")

var shopList = ["泡面","牙膏"]

shopList += ["香烟"]
shopList.insert("饮料", atIndex: 1)
shopList.append("零食")



//var str1 = shopList.removeLast()
//
//shopList
//shopList.removeAtIndex(2)
//shopList
//var range = Range(start: 0, end: 2)
//shopList.removeRange(range)
//shopList



shopList[0] = "大米"

for shopping in shopList {
    print(shopping)
}

for var i = 0; i < shopList.count; i++ {
    print("第\(i)个位置的元素是\(shopList[i])")
}

//二维数组
let n = 9
var nine = [[Int]](count: n, repeatedValue: [Int](count: n, repeatedValue: 0))
assert(n % 2 != 0,"n必须是奇数")

var row = 0
var col = n / 2
for var i = 1; i <= n * n; i++ {
    
    nine[row][col] = i
    row--
    col++
    if row < 0 && col >= n {
        row += 2
        col--
    } else if row < 0 {
        row = n - 1
    } else if col >= n {
        col = 0
    } else if nine[row][col] != 0 {
        row += 2
        col--
    }
}

nine

//字典
var dict : Dictionary<String, Int> = Dictionary<String, Int>()
var dict2 = Dictionary<String, Int>()
var dict3 = [String : Int]()
dict3["sdk"] = 100

var airports  : [String : String] = ["PEK":"北京首都机场","CAN":"广州白云机场"]
var airports2 : Dictionary<String,String> = ["sha":"上海"]
airports["SHA2"] = ""
airports.updateValue("上海虹桥机场", forKey: "SHA2")

airports2.removeValueForKey("sha")

for (key, value) in airports {
    print("key = \(key),value = \(value)")
}

//引用类型
var dict4 = NSDictionary()

//选举计数
let ballot = ["shasha","lili","zhangsan","lishi","shasha","lili","shasha","lishi","shasha","zhangsan","lishi","lili"]
var vote = [String : Int]()
for name in ballot {
    if let cnt = vote[name] {
        vote[name] = cnt + 1
    } else {
        vote[name] = 1
    }
}

vote


/*
*set集合
*/

var set1 : Set<String> = ["rock","classic","jazz","hip hop"]

set1.insert("afds")

if let str = set1.remove("afds") {
    print("suc")
} else {
    print("fail")
}

set1.contains("rock")

//遍历
for str in set1 {
    print(str)
}

var sortArr : Array<String> = set1.sort()
for str in set1.sort() {
    print(str)
}



























