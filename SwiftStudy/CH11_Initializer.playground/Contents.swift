import Foundation

// Ch11 Initializer

class SomeClass {
    init() {
        // 초기화할 때 필요한 코드
    }
}

struct SomeStruct {
    init() {
        // 초기화할 때 필요한 코드
    }
}

enum SomeEnum {
    case SomeCase
    
    init() {
        // 열거형은 초기화할 때 반드시 case 중 하나가 되어야 함
        self = .SomeCase
        // 초기화할 때 필요한 코드
    }
}

// 1. 프로퍼티 기본값
struct Area {
    var squareMeter: Double
    
    init() {
        squareMeter = 0.0 // squareMeter의 초기값 할당
    }
}

let room: Area = Area()
print(room.squareMeter)

struct AreaTwo {
    var squareMeter: Double = 0.0 // 프로퍼티 기본값 할당
}

let roomTwo: AreaTwo = AreaTwo()
print(room.squareMeter)

// 2. 이니셜라이저 매개변수
struct AreaThree {
    var squareMeter: Double
    
    // 평수를 입력받아 제곱미터로 환산한 값을 프로퍼티에 할당하는 이니셜라이저
    init(fromPy py: Double) {
        squareMeter = py * 3.3058
    }
    
    // 제곱미터를 입력받아 그대로 프로퍼티에 할당하는 이니셜라이저
    init(fromSquareMeter squareMeter: Double) {
        self.squareMeter = squareMeter
    }
    
    init(value: Double) {
        squareMeter = value
    }
    
    init(_ value: Double) {
        squareMeter = value
    }
}

let roomThree: AreaThree = AreaThree(fromPy: 15.0)
print(roomThree.squareMeter)

let roomFour: AreaThree = AreaThree(fromSquareMeter: 33.06)
print(roomFour.squareMeter)

let roomFive: AreaThree = AreaThree(value: 30.0)
roomFive.squareMeter
let roomSix: AreaThree = AreaThree(55.0)
roomSix.squareMeter
//AreaThree() // 오류!! 사용자 정의 이니셜라이저를 만들면 기존의 기본 이니셜라이저(init())는 별로도 구현하지 않는 이상 사용할 수 없음

// 3. 옵셔널 프로퍼티 타입
class Person {
    var name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let yagom: Person = Person(name: "yagom")
print(yagom.name)
print(yagom.age)

yagom.age = 99
print(yagom.age)

yagom.name = "Eric"
print(yagom.name)

// 4. 상수 프로퍼티
class AnotherPerson {
    let name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let hyeji: AnotherPerson = AnotherPerson(name: "hyeji")
//hyeji.name = "Eric"

// 5. 기본 이니셜라이저와 멤버와이즈 이니셜라이즈
struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

let point: Point = Point(x: 0, y: 0)
let size: Size = Size(width: 50.0, height: 50.0)

let somePoint: Point = Point()
let someSize: Size = Size(width: 50)
let anotherPoint: Point = Point(y: 100)

// 6. 초기화 위임
enum Student {
    case elementary, middle, high
    case none
    
    init() {
        self = .none
    }
    
    init(koreanAge: Int) {
        switch koreanAge {
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            self = .none
        }
    }
    
    init(bornAt: Int, currentYear: Int) {
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var younger: Student = Student(koreanAge: 16)
print(younger)

younger = Student(bornAt: 1998, currentYear: 2016)
print(younger)

// 7. 실패 가능한 이니셜라이저
class PersonTwo {
    let name: String
    var age: Int?
    
    init?(name: String) {
        
        if name.isEmpty {
            return nil
        }
        
        self.name = name
    }
    
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}

let yagomone: PersonTwo? = PersonTwo(name: "yagom", age: 99)

if let person: PersonTwo = yagomone {
    print(person.name)
} else {
    print("Person wasn't initialized")
}

let chope: PersonTwo? = PersonTwo(name: "chope", age: -10)

if let person: PersonTwo = chope {
    print(person.name)
} else {
    print("Person wasn't initialized")
}

// 8. 함수를 사용한 프로퍼티 기본값 설정
//class SomeClassTwo {
//    let someProperty: SomeType = {
//        return someValue
//    }()
//}

struct StudentThree {
    var name: String?
    var number: Int?
}

class SchoolClass {
    var students: [StudentThree] = {
        var arr: [StudentThree] = [StudentThree]()
        
        for num in 1...15 {
            var student: StudentThree = StudentThree(name: nil, number: num)
            arr.append(student)
        }
        
        return arr
    }()
}

let myClass: SchoolClass = SchoolClass()
print(myClass.students.count)

print(myClass.students)


// 인스턴스 소멸
class SomeClassThree {
    deinit {
        print("Instance will be deallocated immediately")
    }
}

var instance: SomeClassThree? = SomeClassThree()
instance = nil


class FileManager {
    var fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func openFile() {
        print("Open File: \(self.fileName)")
    }
    
    func modifyFile() {
        print("Modify File: \(self.fileName)")
    }
    
    func writeFile() {
        print("Write File: \(self.fileName)")
    }
    
    func closeFile() {
        print("Close File: \(self.fileName)")
    }
    
    deinit {
        print("Deinit instance")
        self.writeFile()
        self.closeFile()
    }
}

var fileManager: FileManager? = FileManager(fileName: "abc.txt")

if let manager: FileManager = fileManager {
    manager.openFile()
    manager.modifyFile()
}

fileManager = nil
