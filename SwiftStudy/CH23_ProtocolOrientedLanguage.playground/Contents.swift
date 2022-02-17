import Foundation
import Darwin

// Ch23 Protocol Oriented Language

protocol Receiveable {
    func received(data: Any, from: Sendable)
}

extension Receiveable {
    func received(data: Any, from: Sendable) {
        print("\(self) received \(data) from \(from)")
    }
}

protocol Sendable {
    var from: Sendable { get }
    var to: Receiveable? { get }
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}

extension Sendable {
    var from: Sendable {
        return self
    }
    
    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("Message has no receiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
    }
    
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

class Message: Sendable, Receiveable {
    var to: Receiveable?
}

class Mail: Sendable, Receiveable {
    var to: Receiveable?
}

let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

myPhoneMessage.send(data: "Hello") // Message has no receiver

myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello") // Message received Hello from Message

let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.send(data: "Hi") // Message has no receiver

myMail.to = yourMail
myMail.send(data: "Hi") // Mail received Hi from Mail

myMail.to = myPhoneMessage
myMail.send(data: "Bye") // Message received Bye from Mail

Message.isSendableInstance("Hello") // false

Message.isSendableInstance(myPhoneMessage) // true

Message.isSendableInstance(yourPhoneMessage) // false
Mail.isSendableInstance(myPhoneMessage) // true
Mail.isSendableInstance(myMail) // true


// 익스텐션을 통해 구현된 메서드 재정의
//class Mail: Sendable, Receiveable {
//    var to: Receiveable?
//
//    func send(data: Any) {
//        print("Mail의 send 메서드는 재정의되었습니다.")
//    }
//}
//
//let mailInstance: Mail = Mail()
//mailInstance.send(data: "Hello")

// 제네릭, 프로토콜, 익스텐션을 통한 재사용 가능한 코드 작성
protocol SelfPrintable {
    func printSelf()
}

extension SelfPrintable where Self: Container {
    func printSelf() {
        print(items)
    }
}

protocol Container: SelfPrintable {
    associatedtype ItemType
    
    var items: [ItemType] { get set }
    var count: Int { get }
    
    mutating func append(item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

extension Container {
    mutating func append(item: ItemType) {
        items.append(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> ItemType {
        return items[i]
    }
}

protocol Popable: Container {
    mutating func pop() -> ItemType?
    mutating func push(_ item: ItemType)
}

extension Popable {
    mutating func pop() -> ItemType? {
        return items.removeLast()
    }
    
    mutating func push(_ item: ItemType) {
        self.append(item: item)
    }
}

protocol Insertable: Container {
    mutating func delete() -> ItemType?
    mutating func insert(_ item: ItemType)
}

extension Insertable {
    mutating func delete() -> ItemType? {
        return items.removeFirst()
    }
    
    mutating func insert(_ item: ItemType) {
        self.append(item: item)
    }
}

struct Stack<Element>: Popable {
    var items: [Element] = [Element]()
    
    func map<T>(transform: (Element) -> T) -> Stack<T> {
        var transformedStack: Stack<T> = Stack<T>()
        
        for item in items {
            transformedStack.items.append(transform(item))
        }
        
        return transformedStack
    }
    
    func filter(includeElement: (Element) -> Bool) -> Stack<Element> {
        var filteredStack: Stack<ItemType> = Stack<ItemType>()
        
        for item in items {
            if includeElement(item) {
                filteredStack.items.append(item)
            }
        }
        
        return filteredStack
    }
    
    func reduce<T>(_ initialResult: T, nextPartialResult: (T, Element) -> T) -> T {
        var result: T = initialResult
        
        for item in items {
            result = nextPartialResult(result, item)
        }
        
        return result
    }
}

struct Queue<Element>: Insertable {
    var items: [Element] = [Element]()
}

//var myIntStack: Stack<Int> = Stack<Int>()
var myStringStack: Stack<String> = Stack<String>()
var myIntQueue: Queue<Int> = Queue<Int>()
var myStringQueue: Queue<String> = Queue<String>()

//myIntStack.push(3)
//myIntStack.printSelf()
//
//myIntStack.push(2)
//myIntStack.printSelf()
//
//myIntStack.pop()
//myIntStack.printSelf()

myStringStack.push("A")
myStringStack.printSelf()

myStringStack.push("B")
myStringStack.printSelf()

myStringStack.pop()
myStringStack.printSelf()

myIntQueue.insert(3)
myIntQueue.printSelf()

myIntQueue.insert(2)
myIntQueue.printSelf()

myIntQueue.delete()
myIntQueue.printSelf()

myStringQueue.insert("A")
myStringQueue.printSelf()

myStringQueue.insert("B")
myStringQueue.printSelf()

myStringQueue.delete()
myStringQueue.printSelf()


// 2. 맵, 필터 리듀스 직접 구현해보기
// Array 타입의 맵 사용
let items: Array<Int> = [1, 2, 3]

let mappedItems: Array<Int> = items.map { (item: Int) -> Int in
    return item * 10
}

print(mappedItems)



// Stack 구조체 구현부 외부
var myIntStack: Stack<Int> = Stack<Int>()
myIntStack.push(1)
myIntStack.push(5)
myIntStack.push(2)
myIntStack.printSelf()
var myStrStack: Stack<String> = myIntStack.map { "\($0)" }
myStrStack.printSelf()

// Array 타입의 필터 사용
let filteredItems: Array<Int> = items.filter { (item: Int) -> Bool in
    return item % 2 == 0
}

print(filteredItems)

// Stack 구조체 구현부 외부
let filteredStack: Stack<Int> = myIntStack.filter { (item: Int) -> Bool in
    return item < 5
}

filteredStack.printSelf()


// Array 타입의 리듀스 사용
let combinedItems: Int = items.reduce(0) { (result: Int, next: Int) -> Int in
    return result + next
}

print(combinedItems)

let combinedItemsDoubled: Double = items.reduce(0.0) { (result: Double, next: Int) -> Double in
    return result + Double(next)
}

print(combinedItemsDoubled)

let combinedItemsString: String = items.reduce("") { (result: String, next: Int) -> String in
    return result + "\(next)"
}

print(combinedItemsString)


// Stack 구조체 구현부 외부
let combinedInt: Int = myIntStack.reduce(100) { (result: Int, next: Int) -> Int in
    return result + next
}

print(combinedInt)

let combinedDouble: Double = myIntStack.reduce(100.0) { (result: Double, next: Int) -> Double in
    return result + Double(next)
}

print(combinedDouble)

let combindString: String = myIntStack.reduce("") { (result: String, next: Int) -> String in
    return result + "\(next)"
}

print(combindString)

// 기본 타입 확장
//protocol SelfPrintable {
//    func printSelf()
//}
//
//extension SelfPrintable {
//    func printSelf() {
//        print(self)
//    }
//}
//
//extension Int: SelfPrintable { }
//extension String: SelfPrintable { }
//extension Double: SelfPrintable { }
//
//1024.printSelf()
//3.14.printSelf()
//"hana".printSelf()
