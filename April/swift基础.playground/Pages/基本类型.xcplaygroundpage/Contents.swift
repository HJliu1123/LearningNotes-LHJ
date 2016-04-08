//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("Hello World!")
print("海军米hiatus了")




let juli = 1500
let 局哦 : Int = 2994
var 上证指数 : Int = 38437
var sf : Int
sf = 203
sf = 2930
var sd : String
sd = "lsfjalhk"
//不同类型不支持直接转换
//sd = sf


Int.max
Int8.max
Int.min

//负无穷
-Double.infinity
//inf 表示无穷大
let aaa = 2498408528763522734830852876352273483085287635227348308528763522734830852876352273483085287635227348308528763522734830852876352273483085287635227348308528763522734830852876352273483085287635227348308528763522734830852876352273483085287635227348308528763522734830852876352273483085287635227348356727343278363684658243937458635763748821974376458753.2378



023
0x3430b
0b10100101
//格式化不影响数值大小
293_239_120_203

//不同类型数据不能进行运算，要转换成统一类型
let x = 3
let y = 3.238
let z = Double(x) + y

//别名
typealias 整型 = Int

//bool类型只有两个值true和false

//元组    可以用点语法访问，点之后可以是前缀或者下标
let sh = (user:"sksks",account:349,title:34)
sh.user
sh.1

var (a,b,c) = (23,435,29)
a
b
c

//可选类型
var address : String?
//nil只能赋值给可选类型
var sex : Bool? = false
sex = nil

var sexx : Bool? = true
if sexx == nil {
    print("mieh")
} else {
    print("lhfslkg")
}

//可选拆包：把可选变量的值解出来，在变量后加“！”
if sexx! == true {
    print("shf")
} else {
    print("kdskfs")
}


//当可选值为nil是拆包会报错


//可选绑定：讲可选判断和拆包安全的组合在一起

if let sex1 = sexx {
    print("sex1")
} else {
    print("用户没有选择性别")
}

//多重绑定
var add : String? = "深圳"
if let sex2 = sexx, add = address {
    print("sfjsk")
} else {
    print("lsfkdfhks")
}

//断言
var isNetwork : Bool = true
assert(isNetwork, "网络不同")





