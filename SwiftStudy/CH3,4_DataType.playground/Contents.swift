import UIKit
import CoreGraphics
import Darwin

var greeting = "Hello, playground"

print("Int64의 표현 범위는 \(Int64.min)에서 \(Int64.max)입니다.")
print("UInt64의 표현 범위는 \(UInt64.min)에서 \(UInt64.max)입니다.")

var integer: Int = -100
let unsignedInteger: UInt = 50
print("integer 값: \(integer), unsignedInteger 값: \(unsignedInteger)")
print("Int 최댓값: \(Int.max), Int 최솟값: \(Int.min)")
print("UInt 최댓값: \(UInt.max), UInt 최솟값: \(UInt.min)")
let largeInteger: Int64 = Int64.max
let smallUnsignedInteger: UInt8 = UInt8.max
print("Int64 최댓값: \(largeInteger), UInt8 최댓값: \(smallUnsignedInteger)")
//let tooLarge: Int = Int.max + 1
//let cannotBeNegetive: UInt = -5
//integer = unsignedInteger

let decimalInteger: Int = 28
let binaryInteger: Int = 0b11100
let octalInteger: Int = 0o34
let hexadecimalInteger: Int = 0x1C

var boolean: Bool = true
boolean.toggle() // true - false 반전
let iLoveYou: Bool = true
let isTimeUnlimited: Bool = false
print("시간은 무한합니까: \(isTimeUnlimited)")

var floatValue: Float = 1234567890.1

let doubleValue: Double = 1234567890.1

print("floatValue: \(floatValue) doubleValue: \(doubleValue)")

floatValue = 123456.1
print(floatValue)

Int.random(in: -100...100)

let alphabetA: Character = "A"
print(alphabetA)

let name: String = "yagom"

var introduce: String = String()

introduce.append("제 이름은")

introduce = introduce + " " + name + "입니다."
print(introduce)

print("name의 글자 수: \(name.count)")
print("introduce가 비어있습니까? \(introduce.isEmpty)")

let unicodeScalarValue: String = "\u{2665}"

let hello: String = "Hello"
var isSameString: Bool = false
isSameString = hello == "Hello"
isSameString = hello == "hello"

var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("He")

var hasSuffix: Bool = false
hasSuffix = hello.hasSuffix("He")
hasSuffix = hello.hasSuffix("llo")

var convertedString: String = ""
convertedString = hello.uppercased()
convertedString = hello.lowercased()

print("문자열 내부에\n 이런 \"특수문자\"를\t사용하면 \\이런 놀라운 결과를 볼 수 있습니다")
print(#"문자열 내부에서 특수문자를 사용하기 싫다면 문자열 앞, 뒤에 #을 붙여주세요"#)
let number: Int = 100
print(#"특수문자를 사용하지 않을 때도 문자열 보간법을 사용하고 싶다면 이렇게 \#(number) 해보세요"#)

var someVar: Any = "yagom"
someVar = 50
someVar = 100.1

// 4
typealias MyInt = Int
let age: MyInt = 100
let year: Int = 2080

//var cat: (String, Int, Double) = ("moongchi", 4, 5.1)
//print("이름: \(cat.0), 나이: \(cat.1), 몸무게: \(cat.2)")

var cat: (name: String, age: Int, weight: Double) = ("moongchi", 4, 5.1)
print("이름: \(cat.name), 나이: \(cat.age), 몸무게: \(cat.weight)")

typealias CatTuple = (name: String, age: Int, weight: Double)
let moong: CatTuple = ("moongchi", 4, 5.1)
print("이름: \(moong.name), 나이: \(moong.age), 몸무게: \(moong.weight)")

//var names: Array<String> = ["yagom", "chulsoo", "younghee", "yagom"]
//var names: [String] = ["yagom", "chulsoo", "younghee", "yagom"]

var emptyArray: [Any] = [Any]()
//var emptyArray: [Any] = Array<Any>()
//var emptyArray: [Any] = []

//print(names[2])
//names[2] = "jenny"
//print(names[2])
//
//names.append("elsa")
//names.append(contentsOf: ["john", "max"])
//names.insert("happy", at: 2)
//names.insert(contentsOf: ["jinhee", "minsoo"], at: 5)
//
//print(names.firstIndex(of: "yagom"))
//print(names.first)
//print(names.last)

//let firstItem: String = names.removeFirst()
//let lastItme: String = names.removeLast()
//let indexZeroItem: String = names.remove(at: 0)

//print(names[1 ... 3])

typealias StringIntDictionary = [String: Int]
//var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()
//var numberForName: [String: Int] = [String: Int]()
//var numberForName: StringIntDictionary = StringIntDictionary()
//var numberForName: [String: Int] = [:]
var numberForName: [String: Int] = ["yagom": 100, "chulsoo": 200, "jenny": 300]

print(numberForName["chulsoo"])
print(numberForName["minji"])
numberForName["chulsoo"] = 150
print(numberForName["chulsoo"])
numberForName["max"] = 999
print(numberForName["max"])
print(numberForName.removeValue(forKey: "yagom"))
print(numberForName["yagom", default: 0])

//var names: Set<String> = Set<String>()
//var names: Set<String> = []

var names: Set<String> = ["yagom", "chulsoo", "younghee", "yagom"]
print(names)

names.insert("jenny")
print(names.remove("chulsoo"))

let englishClassStudents: Set<String> = ["john", "chulsoo", "yagom"]
let koreanClassStudents: Set<String> = ["jenny", "yagom", "chulsoo", "hana", "minsoo"]

let intersectSet: Set<String> = englishClassStudents.intersection(koreanClassStudents)
let symmetricDiffSet: Set<String> = englishClassStudents.symmetricDifference(koreanClassStudents)
let unionSet: Set<String> = englishClassStudents.union(koreanClassStudents)
let subtractSet: Set<String> = englishClassStudents.subtracting(koreanClassStudents)

print(subtractSet)
print(unionSet.sorted())

//enum School: CaseIterable {
//    case primary
//    case elementary
//    case middle
//    case high
//    case college
//    case university
//    case graduate
//}
//
//let allCases: [School] = School.allCases
//print(allCases)
//print(allCases.count)

enum School: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    @available(iOS, obsoleted: 12.0)
    case graduate = "대학원"
    
    static var allCases: [School] {
        let all: [School] = [.primary, .elementary, .middle, .high, .college, .university]
        #if os(iOS)
        return all
        #else
        return all + [.graduate]
        #endif
    }
}

let allCases: [School] = School.allCases
print(allCases)





let highestEducationLevel: School = .university
print("저의 최종학력은 \(highestEducationLevel.rawValue) 졸업입니다.")
print(School.elementary.rawValue)

enum Numbers: Int {
    case zero
    case one
    case two
    case ten = 10
}

print("\(Numbers.zero.rawValue), \(Numbers.one.rawValue), \(Numbers.two.rawValue), \(Numbers.ten.rawValue)")

let primary = School(rawValue: "유치원")
let one = Numbers(rawValue: 1)
let three = Numbers(rawValue: 3)


enum PastaTaste: CaseIterable {
    case cream, tomato
}

enum PizzaDough: CaseIterable {
    case cheeseCrust, thin, original
}

enum PizzaTopping: CaseIterable {
    case pepperoni, cheese, bacon
}

enum MainDish: CaseIterable {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
    case rice
    
    static var allCases: [MainDish] {
        return PastaTaste.allCases.map(MainDish.pasta)
            + PizzaDough.allCases.reduce([]) { (result, dough) -> [MainDish] in result + PizzaTopping.allCases.map { (topping) -> MainDish in MainDish.pizza(dough: dough, topping: topping)}}
            + [true, false].map(MainDish.chicken)
            + [MainDish.rice]
    }
}

print(MainDish.allCases.count)
print(MainDish.allCases)

var dinner: MainDish = MainDish.pasta(taste: PastaTaste.tomato)
dinner = MainDish.pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.pepperoni)

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let result: Int = evaluate(final)
print("(5 + 4) * 2 = \(result)")

enum Condition: Comparable {
    case terrble
    case bad
    case good
    case great
}

let myCondition: Condition = Condition.great
let yourCondition: Condition = Condition.bad

if myCondition >= yourCondition {
    print("제 상태가 더 좋군요")
} else {
    print("당신의 상태가 더 좋아요")
}

enum Device: Comparable {
    case iPhone(version: String)
    case iPad(version: String)
    case macBook
    case iMac
}

var devices: [Device] = []
devices.append(Device.iMac)
devices.append(Device.iPhone(version: "14.3"))
devices.append(Device.iPhone(version: "6.1"))
devices.append(Device.iPad(version: "10.3"))
devices.append(Device.macBook)

let sortedDevices: [Device] = devices.sorted()
print(sortedDevices)
