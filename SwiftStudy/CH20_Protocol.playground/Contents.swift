import Darwin

// Ch20 Protocol

protocol SomeProtocol {
    var settableProperty: String { get set }
    var notNeedToBeSettableProperty: String { get }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
    static var anotherTypeProperty: Int { get }
}

//protocol Sendable {
//    var from: String { get }
//    var to: String { get }
//}
//
//class Message: Sendable {
//    var sender: String
//    var from: String {
//        return self.sender
//    }
//
//    var to: String
//
//    init(sender: String, receiver: String) {
//        self.sender = sender
//        self.to = receiver
//    }
//}
//
//class Mail: Sendable {
//    var from: String
//    var to: String
//
//    init(sender: String, receiver: String) {
//        self.from = sender
//        self.to = receiver
//    }
//}

// 메서드 요구
protocol Receiveable {
    func received(data: Any, from: Sendable)
}

protocol Sendable {
    var from: Sendable { get }
    var to: Receiveable? { get }
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}

class Message: Sendable, Receiveable {
    var from: Sendable {
        return self
    }
    
    var to: Receiveable?
    
    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("Message has no receiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
    }
    
    func received(data: Any, from: Sendable) {
        print("Message received \(data) from \(from)")
    }
    
    class func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

class Mail: Sendable, Receiveable {
    var from: Sendable {
        return self
    }
    
    var to: Receiveable?
    
    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("Mail has no receiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
    }
    
    func received(data: Any, from: Sendable) {
        print("Mail received \(data) from \(from)")
    }
    
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

myPhoneMessage.send(data: "Hello")

myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello")

let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.send(data: "Hi")

myMail.to = yourMail
myMail.send(data: "Hi")

myMail.to = myPhoneMessage
myMail.send(data: "Bye")

Message.isSendableInstance("Hello")

Message.isSendableInstance(myPhoneMessage)

Message.isSendableInstance(yourPhoneMessage)
Mail.isSendableInstance(myPhoneMessage)
Mail.isSendableInstance(myMail)


// 가변 메서드 요구
//protocol Resettable {
//    mutating func reset()
//}
//
//class Person: Resettable {
//    var name: String?
//    var age: Int?
//
//    func reset() {
//        self.name = nil
//        self.age = nil
//    }
//}
//
//struct Point: Resettable {
//    var x: Int = 0
//    var y: Int = 0
//
//    mutating func reset() {
//        self.x = 0
//        self.y = 0
//    }
//}
//
//enum Direction: Resettable {
//    case east, west, south, north, nuknown
//
//    mutating func reset() {
//        self = Direction.nuknown
//    }
//}


// 이니셜라이저 요구
//protocol Named {
//    var name: String { get }
//
//    init(name: String)
//}
//
//struct Pet: Named {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}

//class Person: Named {
//    var name: String
//
//    required init(name: String) {
//        self.name = name
//    }
//}

//class School {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//class MiddleSchool: School, Named {
//    required override init(name: String) {
//        super.init(name: name)
//    }
//}


// 실패 가능한 이니셜라이저 요구
protocol Named {
    var name: String { get }

    init?(name: String)
}

struct Animal: Named {
    var name: String

    init!(name: String) {
        self.name = name
    }
}
//
struct Pet: Named {
    var name: String

    init(name: String) {
        self.name = name
    }
}

class Person: Named {
    var name: String

    required init(name: String) {
        self.name = name
    }
}

class School: Named {
    var name: String

    required init?(name: String) {
        self.name = name
    }
}


// 프로토콜 상속
protocol Readable {
    func read()
}

protocol Writeable {
    func write()
}

protocol ReadSpeakable: Readable {
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}

class SomeClass: ReadWriteSpeakable {
    func read() {
        print("Read")
    }
    
    func write() {
        print("Write")
    }
    
    func speak() {
        print("Speak")
    }
}


// 프로토콜 조합
//protocol Named {
//    var name: String { get }
//}
//
//protocol Aged {
//    var age: Int { get }
//}
//
//struct Person: Named, Aged {
//    var name: String
//    var age: Int
//}
//
//class Car: Named {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//class Truck: Car, Aged {
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.age = age
//        super.init(name: name)
//    }
//}
//
//func celebrateBirthday(to celebrate: Named & Aged) {
//    print("Happy birthday \(celebrate.name)!! Now you are \(celebrate.age)")
//}
//
//let yagom: Person = Person(name: "yagom", age: 99)
//celebrateBirthday(to: yagom)
//
//let myCar: Car = Car(name: "Boong Boong")
////celebrateBirthday(to: myCar)
//
////var someVariable: Car & Truck & Aged
//
//var someVariable: Car & Aged
//
//someVariable = Truck(name: "Truck", age: 5)
//
////someVariable = myCar
//
//print(yagom is Named)
//print(yagom is Aged)
//
//print(myCar is Named)
//print(myCar is Aged)
//
//if let castedInstance: Named = yagom as? Named {
//    print("\(castedInstance) is Named")
//}
//
//if let castedInstance: Aged = yagom as? Aged {
//    print("\(castedInstance) is Aged")
//}
//
//if let castedInstance: Named = myCar as? Named {
//    print("\(castedInstance) is Named")
//}
//
//if let castedInstance: Aged = myCar as? Aged {
//    print("\(castedInstance) is Aged")
//}


// 프로토콜의 선택적 요구
import Foundation

@objc protocol Moveable {
    func walk()
    @objc optional func fly()
}

class Tiger: NSObject, Moveable {
    func walk() {
        print("Tiger walks")
    }
}

class Bird: NSObject, Moveable {
    func walk() {
        print("Bird walks")
    }
    
    func fly() {
        print("Bird flys")
    }
}

let tiger: Tiger = Tiger()
let bird: Bird = Bird()

tiger.walk()
bird.walk()
bird.fly()

var movableInstance: Moveable = tiger
movableInstance.fly?()

movableInstance = bird
movableInstance.fly?()


var someNamed: Named = Animal(name: "Animal")
someNamed = Pet(name: "Pet")
someNamed = Person(name: "Person")
someNamed = School(name: "School")!
