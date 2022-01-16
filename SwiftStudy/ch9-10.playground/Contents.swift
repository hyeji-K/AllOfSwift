import UIKit

struct BasicInformation {
    var name: String
    var age: Int
}

var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)
yagomInfo.age = 100

var friendInfo: BasicInformation = yagomInfo

print("yagom's age: \(yagomInfo.age)")
print("friend's age: \(friendInfo.age)")

friendInfo.age = 999

print("yagom's age: \(yagomInfo.age)")
print("friend's age: \(friendInfo.age)")


//class Person {
//    var height: Float = 0.0
//    var weight: Float = 0.0
//
////    deinit {
////        print("Person 클래스의 인스턴스가 소멸됩니다.")
////    }
//}

//var yagom: Person = Person()
//var friend: Person = yagom
//
//print("yagom's age: \(yagom.height)")
//print("friend's age: \(friend.height)")
//
//friend.height = 185.5
//
//print("yagom's age: \(yagom.height)")
//print("friend's age: \(friend.height)")
//
//func changeBasicInfo(_ info: BasicInformation) {
//    var copiedInfo: BasicInformation = info
//    copiedInfo.age = 1
//}
//
//func changePersonInfo(_ info: Person) {
//    info.height = 155.3
//}
//
//changeBasicInfo(yagomInfo)
//print("yagom's age: \(yagomInfo.age)")
//
//changePersonInfo(yagom)
//print("yagom's height: \(yagom.height)")


//var yagom: Person = Person()
//let friend: Person = yagom
//let anotherFriend: Person = Person()
//
//print(yagom === friend)
//print(yagom === anotherFriend)
//print(friend !== anotherFriend)

//struct CoordinatePoint {
//    var x: Int
//    var y: Int
//
//    // 대칭점을 구하는 메서드 - 접근자
//    func oppositePoint() -> Self {
//        return CoordinatePoint(x: -x, y: -y)
//    }
//
//    // 대칭점을 설정하는 메서드 - 설정자
//    mutating func setOppositePoint(_ opposite: CoordinatePoint) {
//        x = -opposite.x
//        y = -opposite.y
//    }
//}
//
//var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)
//// 현재 좌표
//print(yagomPosition)
//// 대칭 좌표
//print(yagomPosition.oppositePoint())
//// 대칭 좌표를 (15, 10)으로 설정하면
//yagomPosition.setOppositePoint(CoordinatePoint(x: 15, y: 10))
//// 현재 좌표
//print(yagomPosition)

struct CoordinatePoint {
    var x: Int
    var y: Int
    
    // 대칭 좌표
    var oppositePoint: CoordinatePoint {
        // 접근자
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
        
        // 설정자
        set(opposite) {
            x = -opposite.x
            y = -opposite.y
        }
    }
}

var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)
// 현재 좌표
print(yagomPosition)
// 대칭 좌표
print(yagomPosition.oppositePoint)
// 대칭 좌표를 (15, 10)으로 설정하면
yagomPosition.oppositePoint = CoordinatePoint(x: 15, y: 10)
// 현재 좌표
print(yagomPosition)

//
//class Position {
//    var point: CoordinatePoint = CoordinatePoint()
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//let yagomPosition: Position = Position(name: "yagom")
//
//print(yagomPosition.point)
//

//class Account {
//    var credit: Int = 0 {
//        willSet {
//            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
//        }
//
//        didSet {
//            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
//        }
//    }
//
//    var dollarValue: Double {
//        get {
//            return Double(credit)
//        }
//
//        set {
//            credit = Int(newValue * 1000)
//            print("잔액을 \(newValue)달러로 변경하는 중입니다.")
//        }
//    }
//}
//
//class ForeignAccount: Account {
//    override var dollarValue: Double {
//        willSet {
//            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다.")
//        }
//
//        didSet {
//            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
//        }
//    }
//}
//
//let myAccount: ForeignAccount = ForeignAccount()
//myAccount.credit = 1000
//
//myAccount.dollarValue = 2


//let myAccount: Account = Account()
//myAccount.credit = 1000

var wonInPocket: Int = 2000 {
    willSet {
        print("주머니의 돈이 \(wonInPocket)원에서 \(newValue)원으로 변경될 예정입니다.")
    }
    
    didSet {
        print("주머니의 돈이 \(oldValue)원에서 \(wonInPocket)원으로 변경되었습니다.")
    }
}

var dollarInPocket: Double {
    get {
        return Double(wonInPocket)
    }
    
    set {
        wonInPocket = Int(newValue * 1000.0)
        print("주머니의 달러를 \(newValue)달러로 변경 중입니다.")
    }
}

dollarInPocket = 3.5

//class AClass {
//    // 저장 타입 프로퍼티
//    static var typeProperty: Int = 0
//
//    // 저장 인스턴스 프로퍼티
//    var instanceProperty: Int = 0 {
//        didSet {
//            Self.typeProperty = instanceProperty + 100
//        }
//    }
//
//    // 연산 타입 프로퍼티
//    static var typeComputedProperty: Int {
//        get {
//            return typeProperty
//        }
//
//        set {
//            typeProperty = newValue
//        }
//    }
//}
//
//AClass.typeProperty = 123
//
//let classInstance: AClass = AClass()
//classInstance.instanceProperty = 100
//
//print(AClass.typeProperty)
//print(AClass.typeComputedProperty)


class Account {
    static let dollarExchangeRate: Double = 1000.0
    
    var credit: Int = 0
    
    var dollarValue: Double {
        get {
            return Double(credit) / Self.dollarExchangeRate
        }
        
        set {
            credit = Int(newValue * Account.dollarExchangeRate)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

func someFunction(paramA: Any, paramB: Any) {
    print("someFunction called...")
}

//var functionReference = someFunction(paramA: <#T##Any#>, paramB: <#T##Any#>)

//class Person {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//struct Stuff {
//    var name: String
//    var owner: Person
//}
//
//print(type(of: \Person.name))
//print(type(of: \Stuff.name))
//
//let keyPath = \Stuff.owner
//let nameKeyPath = keyPath.appending(path: \.name)

//class Person {
//    let name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//struct Stuff {
//    var name: String
//    var owner: Person
//}
//
//let yagom = Person(name: "yagom")
//let hana = Person(name: "hana")
//let macbook = Stuff(name: "MacBook Pro", owner: yagom)
//var iMac = Stuff(name: "iMac", owner: yagom)
//let iPhone = Stuff(name: "iPhone", owner: hana)
//
//let stuffNameKeyPath = \Stuff.name
//let ownerKeyPath = \Stuff.owner
//
//let ownerNameKeyPath = ownerKeyPath.appending(path: \.name)
//
//print(macbook[keyPath: stuffNameKeyPath])
//print(iMac[keyPath: stuffNameKeyPath])
//print(iPhone[keyPath: stuffNameKeyPath])
//
//print(macbook[keyPath: ownerNameKeyPath])
//print(iMac[keyPath: ownerNameKeyPath])
//print(iPhone[keyPath: ownerNameKeyPath])
//
//iMac[keyPath: stuffNameKeyPath] = "iMac Pro"
//iMac[keyPath: ownerKeyPath] = hana
//
//print(iMac[keyPath: stuffNameKeyPath])
//print(iMac[keyPath: ownerNameKeyPath])
//
//macbook[keyPath: stuffNameKeyPath] = "macbook pro touch bar"
//yagom[keyPath: \Person.name] = "bear"

struct Person {
    let name: String
    let nickname: String?
    let age: Int
    
    var isAdult: Bool {
        return age > 18
    }
}

let yagom: Person = Person(name: "yagom", nickname: "bear", age: 100)
let hana: Person = Person(name: "hana", nickname: "na", age: 100)
let happy: Person = Person(name: "happy", nickname: nil, age: 3)

let family: [Person] = [yagom, hana, happy]
let names: [String] = family.map(\.name)
let nicknames: [String] = family.compactMap(\.nickname)
let adults: [String] = family.filter(\.isAdult).map(\.name)


//class LevelClass {
//    //현재 레벨을 저장하는 저장 프로퍼티
//    var level: Int = 0 {
//        //프로퍼티 값이 변경되면 호출하는 프로퍼티 감시자
//        didSet {
//            print("Level \(level)")
//        }
//    }
//    // 레벨이 올랐을 때 호출할 메서드
//    func levelUp() {
//        print("Level Up!")
//        level += 1
//    }
//
//    // 레벨이 감소했을 때 호출할 메서드
//    func levelDown() {
//        print("Level Down")
//        level -= 1
//        if level < 0 {
//            reset()
//        }
//    }
//
//    // 특정 레벨로 이동할 때 호출할 메서드
//    func jumpLevel(to: Int) {
//        print("Jump to \(to)")
//        level = to
//    }
//
//    // 레벨을 초기화할 때 호출할 메서드
//    func reset() {
//        print("Reset!")
//        level = 0
//    }
//}
//
//var levelClassInstance: LevelClass = LevelClass()
//levelClassInstance.levelUp()
//levelClassInstance.levelDown()
//levelClassInstance.levelDown()
//levelClassInstance.jumpLevel(to: 3)


//struct LevelStruct {
//    var level: Int = 0 {
//        didSet {
//            print("Level \(level)")
//        }
//    }
//
//    mutating func levelUp() {
//        print("Level Up!")
//        level += 1
//    }
//
//    mutating func levelDown() {
//        print("Level Down")
//        level -= 1
//        if level < 0 {
//            reset()
//        }
//    }
//
//    mutating func jumpLevel(to: Int) {
//        print("Jump to \(to)")
//        level = to
//    }
//
//    mutating func reset() {
//        print("Reset!")
//        level = 0
//    }
//}

//var levelStructInstance: LevelStruct = LevelStruct()
//levelStructInstance.levelUp()
//levelStructInstance.levelDown()
//levelStructInstance.levelDown()
//levelStructInstance.jumpLevel(to: 3)


//class LevelClass {
//    var level: Int = 0
//
//    func reset() {
//        self = LevelClass()
//    }
//}

struct LevelStruct {
    var level: Int = 0
    
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    mutating func reset() {
        print("Reset!")
        self = LevelStruct()
    }
}

var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()
print(levelStructInstance.level)

levelStructInstance.reset()
print(levelStructInstance.level)

enum OnOffSwitch {
    case on, off
    mutating func nextState() {
        self = self == .on ? .off : .on
    }
}

var toggle: OnOffSwitch = OnOffSwitch.off
toggle.nextState()
print(toggle)


struct Puppy {
    var name: String = "멍멍이"
    
    func callAsFunction() {
        print("멍멍")
    }
    
    func callAsFunction(destination: String) {
        print("\(destination)(으)로 달려갑니다")
    }
    
    func callAsFunction(something: String, times: Int) {
        print("\(something)(을)를 \(times)번 반복합니다.")
    }
    
    func callAsFunction(color: String) -> String {
        return "\(color) 응가"
    }
    
    mutating func callAsFunction(name: String) {
        self.name = name
    }
}

var doggy: Puppy = Puppy()
doggy.callAsFunction()
doggy()
doggy.callAsFunction(destination: "집")
doggy(destination: "뒷동산")
doggy(something: "재주넘기", times: 3)
print(doggy(color: "무지개색"))
doggy(name: "댕댕이")
print(doggy.name)


class AClass {
    static func staticTypeMethod() {
        print("AClass staticTypeMethod")
    }
    
    class func classTypeMethod() {
        print("AClass classTypeMethod")
    }
}

class BClass: AClass {
//    override static func staticTypeMethod() {
//
//    }
    
    override class func classTypeMethod() {
        print("BClass classTypeMehtod")
    }
}

AClass.staticTypeMethod()
AClass.classTypeMethod()
BClass.classTypeMethod()


// 시스템 음량은 한 기기에서 유일한 값이어야 함
struct SystemVolume {
    // 타입 프로퍼티를 사용하면 언제나 유일한 값이 됨
    static var volume: Int = 5
    
    // 타입 프로퍼티를 제어하기 위해 타입 메서드를 사용
    static func mute() {
        self.volume = 0
    }
}

// 내비게이션 역할은 여러 인스턴스가 수행할 수 있음
class Navigation {
    // 내비게이션 인스턴스마다 음량을 따로 설정할 수 있음
    var volume: Int = 5
    
    // 길 안내 음성 재생
    func guideWay() {
        // 내비게이션 외 다른 재생원 음소거
        SystemVolume.mute()
    }
    
    // 길 안내 음성 종료
    func finishGuideWay() {
        // 기존 재생원 음량 복구
        SystemVolume.volume = self.volume
    }
}

SystemVolume.volume = 10

let myNavi: Navigation = Navigation()

myNavi.guideWay()
print(SystemVolume.volume)

myNavi.finishGuideWay()
print(SystemVolume.volume)



