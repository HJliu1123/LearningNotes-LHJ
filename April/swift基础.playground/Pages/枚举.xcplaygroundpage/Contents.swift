//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/*
    枚举
*/

enum weather {
    
    case sun
    case wind
    case rain
    case frozen
    case snow
    
}

weather.snow

let sss = weather.sun
switch sss {
case .sun:
    print("sdkf")
default:
    break
}

enum CompassPoint {
    case North
    case South
    case East
    case West
}


var point : CompassPoint
point = CompassPoint.North
point = .East

var point2 : CompassPoint = .West

enum Plant {
    case Mercury, Venus, Earth, Mars, Jupiter, Sature, Uranus, Neptune
}

var plant : Plant = .Venus


switch point {
case .North:
    print("北")
case .South:
    print("南")
case .West:
    print("西")
case .East:
    print("东")
}


enum Week : Int {
    case Sun = 0, Mon, Tur, Wen, Thu, Fri, Sat
}

var weekDay : Week = Week.Fri

var weekNum : Int = weekDay.rawValue

//关联值
enum Barcode {
    case UPCA(Int, Int, Int)
    case QRCode(String)
}

var code : Barcode = .UPCA(69, 2343534443, 8)

switch code {
case .UPCA(let(num, id, check)):
    print("这是一个条形码\(num)-\(id)-\(check)")
case .QRCode(let pCode):
    print("这是一个二维码\(pCode)")
}










