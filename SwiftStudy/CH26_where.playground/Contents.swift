import Darwin
import Security

// Ch26 where

let tuples: [(Int, Int)] = [(1, 2), (1, -1), (1, 0), (0, 2)]

// 값 바인딩, 와일드카드 패턴
for tuple in tuples {
    switch tuple {
    case let (x, y) where x == y: print("x == y")
    case let (x, y) where x == -y: print("x == -y")
    case let (x, y) where x > y: print("x > y")
    case (1, _): print("x == 1")
    case (_, 2): print("y == 2")
    default: print("\(tuple.0), \(tuple.1)")
    }
}

var repeatCount: Int = 0

// 값 바인딩 패턴
for tuple in tuples {
    switch tuple {
    case let (x, y) where x == y && repeatCount > 2: print("x == y")
    case let (x, y) where repeatCount < 2: print("\(x), \(y)")
    default: print("Nothing")
    }
    
    repeatCount += 1
}

let firstValue: Int = 50
let secondValue: Int = 30

// 값 바인딩 패턴
switch firstValue + secondValue {
case let total where total > 100: print("total > 100")
case let total where total < 0: print("wrong value")
case let total where total == 0: print("zero")
case let total: print(total)
}


// 옵셔널 패턴과 where 절의 활용
let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]

for case let number? in arrayOfOptionalInts where number > 2 {
    print("Found a \(number)")
}


// 타입캐스팅 패턴과 where 절의 활용
let anyValue: Any = "ABC"

switch anyValue {
case let value where value is Int: print("value is Int")
case let value where value is String: print("value is String")
case let value where value is Double: print("value is Double")
default: print("Unknown type")
}

var things: [Any] = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}


// 표현 패턴과 where 절의 활용
var point: (Int, Int) = (1, 2)

switch point {
case (0, 0): print("원점")
case (-2...2, -2...2) where point.0 != 1: print("(\(point.0), \(point.1))은 원점과 가깝습니다.")
default: print("point (\(point.0), \(point.1))")
}


// where 절을 활용한 프로토콜 익스텐션의 프로토콜 준수 제약 추가
protocol SelfPrintable {
    func printSelf()
}

struct Person: SelfPrintable { }

extension Int: SelfPrintable { }
extension UInt: SelfPrintable { }
extension String: SelfPrintable { }
extension Double: SelfPrintable { }

extension SelfPrintable where Self: FixedWidthInteger, Self: SignedInteger {
    func printSelf() {
        print("FixedWidthInteger와 SignedInteger을 준수하면서 SelfPrintable을 준수하는 타입 \(type(of: self))")
    }
}
extension SelfPrintable where Self: CustomStringConvertible {
    func printSelf() {
        print("CustomStringConvertible을 준수하면서 SelfPrintable을 준수하는 타입 \(type(of: self))")
    }
}
extension SelfPrintable {
    func printSelf() {
        print("그 외 SelfPrintable을 준수하는 타입 \(type(of: self))")
    }
}

Int(-8).printSelf()

UInt(8).printSelf()

String("yagom").printSelf()

Double(8.0).printSelf()

Person().printSelf()


// where 절을 활용한 타입 매개변수와 연관 타입의 타입 제약 추가
//func doubled<T>(integerValue: T) -> T where T: BinaryInteger {
//    return integerValue * 2
//}
//
//func doubled<T: BinaryInteger>(integerValue: T) -> T {
//    return integerValue * 2
//}
//
//func prints<T, U>(first: T, second: U) where T: CustomStringConvertible, U: CustomStringConvertible {
//    print(first)
//    print(second)
//}
//
//func prints<T: CustomStringConvertible, U: CustomStringConvertible>(first: T, second: U) {
//    print(first)
//    print(second)
//}
//
//func compareTwoSequences<S1, S2>(a: S1, b: S2) where S1: Sequence, S2: Sequence, S1.Element: Equatable,  S1.Element == S2.Element {
//    // ...
//}
//
//func compareTwoSequences<S1: Sequence, S2: Sequence>(a: S1, b: S2) where S1.Element: Equatable, S1.Element == S2.Iterator.Element {
//    // ...
//}
//
//func compareTwoSequences<S1, S2>(a: S1, b: S2) where S1: Sequence, S1.Element: Equatable, S2: Sequence, S2.Element: Equatable {
//    // ...
//}
//
//protocol Container {
//    associatedtype ItemType where ItemType: BinaryInteger
//    var count: Int { get }
//
//    mutating func append(_ item: ItemType)
//    subscript(i: Int) -> ItemType { get }
//}
//
//protocol Container where ItemType: BinaryInteger {
//    associatedtype SecExternalItemType
//    var count: Int { get }
//
//    mutating func append(_ item: ItemType)
//    subscript(i: Int) -> ItemType { get }
//}


// where 절을 활용한 제네릭 타입의 연관 타입 제약 추가
//protocol Talkable { }
//protocol CallToAll {
//    func callToAll()
//}
//
//struct Person: Talkable { }
//struct Animal { }
//
//extension Array: CallToAll where Element: Talkable {
//    func callToAll() { }
//}
//
//let people: [Person] = []
//let cats: [Animal] = []
//
//people.callToAll()
////cats.callToAll()


// where 절을 활용한 제네릭 타입의 메서드 제약 추가
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

extension Stack {
    func sorted() -> [Element] where Element: Comparable {
        return items.sorted()
    }
}
