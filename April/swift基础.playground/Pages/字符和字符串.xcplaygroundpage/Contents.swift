//: [Previous](@previous)

import Foundation

//var str = "Hello, playground"

//: [Next](@next)

//用String来表示字符串 ，用Character表示字符,都是用双引号，且字符型一定要指定类型，默认的都是字符串
let a : String = "kskfh"
let b : Character = "a"

//字符串可以遍历里面字符
let c = "小波说雨燕"
for x in c.characters {
    print(x)
}

//连接字符串可以用+或+=
var str1 = "小波"
var str2 = "说雨燕"
var str3 = str1 + str2

//字符串添加字符要用append
var ch : Character = "a"
str1.append(ch)

//字符串插值
let name = "aaa"
let age = 1
let salary = 292.32
let str4 = "姓名：\(name) 年龄：\(age) 工资：\(salary)"

//汉字Unicode编码
"\u{4e4d}"

//字符计数
c.characters.count

//字符串索引startIndex(首字符索引),endIndex（尾字符后面一个位置的索引）
c.startIndex
c.endIndex

//successor向前进一位，predecessor向后退一位,advancedBy向前进位
c[c.startIndex.successor()]
c[c.endIndex.predecessor()]
c[c.startIndex.advancedBy(2)]

//character中的属性indicates表示索引区间
for b in c.characters.indices {
    print(c[b],terminator:"-")
}

//修改字符串：插入和删除
var str5 = "小波说雨燕 之 swift2"
//插入一个字符
str5.insert("a", atIndex: str5.endIndex)

//插入一个字符串
let str6 = "kssk"
str5.insertContentsOf(str6.characters, at: str5.endIndex)

//删除指定范围内的子字符串
let 范围 = str5.endIndex.advancedBy(-(str6.characters.count + 1))..<str5.endIndex
str5.removeRange(范围)

//比较字符串  相等性用==和!=操作符表示
let x = "slfas"
let y = "sfsl"
x == y

//比较字符串前缀和后缀是否相等
let m = "aspkshfhsj"
let n = "aspjshfja"
let l = "sfasfja"
m.hasPrefix("asp")
n.hasSuffix("fja")


















