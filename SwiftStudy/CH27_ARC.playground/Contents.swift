
// Ch27 ARC

// 강한참조의 참조 횟수 확인
//class Person {
//    let name: String
//
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//
//reference1 = Person(name: "yagom")
//
//reference2 = reference1
//reference3 = reference1
//
//reference3 = nil
//reference2 = nil
//reference1 = nil


// 강한참조 지역변수(상수)의 참조 횟수 확인
//func foo() {
//    let yagom: Person = Person(name: "yagom")
//}
//
//foo()

// 강한참조 지역변수(상수)의 참조 횟수 확인과 전역변수
//var globalReference: Person?
//
//func foo() {
//    let yagom: Person = Person(name: "yagom")
//
//    globalReference = yagom
//}
//
//foo()


// 강한참조 순환 문제
// 강한참조 순환 문제를 약한참조로 해결
//class Person {
//    let name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    var room: Room?
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//class Room {
//    let number: String
//
//    init(number: String) {
//        self.number = number
//    }
//
//    weak var host: Person?
//
//    deinit {
//        print("Room \(number) is being deinitialized")
//    }
//}
//
//var yagom: Person? = Person(name: "yagom")
//var room: Room? = Room(number: "505")
//
//room?.host = yagom
//yagom?.room = room
//
//yagom = nil
//print(room?.host)
//
//room = nil

//yagom?.room = nil
//yagom = nil
//
//room?.host = nil
//room = nil


// 미소유참조
//class Person {
//    let name: String
//
//    var card: CreditCard?
//
//    init(name: String) {
//        self.name = name
//    }
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//class CreditCard {
//    let number: UInt
//    unowned let owner: Person
//
//    init(number: UInt, owner: Person) {
//        self.number = number
//        self.owner = owner
//    }
//
//    deinit {
//        print("Card #\(number) is being deinitialized")
//    }
//}
//
//var jisoo: Person? = Person(name: "jisoo")
//
//if let person: Person = jisoo {
//    person.card = CreditCard(number: 1004, owner: person)
//}
//
//jisoo = nil


// 미소유 옵셔널 참조
class Department {
    var name: String
    var subjects: [Subject] = []
    
    init(name: String) {
        self.name = name
    }
}

class Subject {
    var name: String
    unowned var department: Department
    unowned var nextSubject: Subject?
    
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextSubject = nil
    }
}

let department = Department(name: "Computer Science")

let intro = Subject(name: "Computer Architecture", in: department)
let intermediate = Subject(name: "Swift Language", in: department)
let advanced = Subject(name: "iOS App Programming", in: department)

intro.nextSubject = intermediate
intermediate.nextSubject = advanced
department.subjects = [intro, intermediate, advanced]


// 미소유참조와 암시적 추출 옵셔널 프로퍼티
class Company {
    let name: String
    var ceo: CEO!
    
    init(name: String, ceoName: String) {
        self.name = name
        self.ceo = CEO(name: ceoName, company: self)
    }
    
    func introduce() {
        print("\(name)의 CEO는 \(ceo.name)입니다.")
    }
}

class CEO {
    let name: String
    unowned let company: Company
    
    init(name: String, company: Company) {
        self.name = name
        self.company = company
    }
    
    func introduce() {
        print("\(name)는 \(company.name)의 CEO입니다.")
    }
}

let company: Company = Company(name: "좋은회사", ceoName: "좋은사람")
company.introduce()
company.ceo.introduce()


// 클로저의 강한참조 순환
//class Person {
//    let name: String
//    let hobby: String?
//
//    lazy var introduce: () -> String = {
//        var introduction: String = "My name is \(self.name)."
//        guard let hobby = self.hobby else {
//            return introduction
//        }
//
//        introduction += " "
//        introduction += "My hobby is \(hobby)."
//
//        return introduction
//    }
//
//    init(name: String, hobby: String? = nil) {
//        self.name = name
//        self.hobby = hobby
//    }
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//var yagom: Person? = Person(name: "yagom", hobby: "eating")
//print(yagom?.introduce())
//yagom = nil


// 획득목록
//var a = 0
//var b = 0
//let closure = { [a] in
//    print(a, b)
//    b = 20
//}
//
//a = 10
//b = 10
//closure()
//print(b)


//class SimpleClass {
//    var value: Int = 0
//
//}
//
//var x = SimpleClass()
//var y = SimpleClass()
//
//let closure = { [x] in
//    print(x.value, y.value)
//}
//
//x.value = 10
//y.value = 10
//
//closure()


// 획득목록의 획득 종류 명시
class SimpleClass {
    var value: Int = 0
}

var x: SimpleClass? = SimpleClass()
var y = SimpleClass()

let closure = { [weak x, unowned y] in
    print(x?.value, y.value)
}

x = nil
y.value = 10

closure()


//class Person {
//    let name: String
//    let hobby: String?
//
//    lazy var introduce: () -> String = { [unowned self] in
//        var introduction: String = "My name is \(self.name)."
//
//        guard let hobby = self.hobby else {
//            return introduction
//        }
//
//        introduction += " "
//        introduction += "My hobby is \(hobby)."
//
//        return introduction
//    }
//
//    init(name: String, hobby: String? = nil) {
//        self.name = name
//        self.hobby = hobby
//    }
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//var yagom: Person? = Person(name: "yagom", hobby: "eating")
//var hana: Person? = Person(name: "hana", hobby: "playing guitar")
//hana?.introduce = yagom?.introduce ?? {" "}
//
//print(yagom?.introduce())
//yagom = nil
//print(hana?.introduce())

// 획득목록의 약한참조를 통한 차후 접근 문제 방지
class Person {
    let name: String
    let hobby: String?

    lazy var introduce: () -> String = { [weak self] in
        guard let `self` = self else {
            return "원래의 참조 인스턴스가 없어졌습니다."
        }
        
        var introduction: String = "My name is \(self.name)."
        
        guard let hobby = self.hobby else {
            return introduction
        }

        introduction += " "
        introduction += "My hobby is \(hobby)."

        return introduction
    }

    init(name: String, hobby: String? = nil) {
        self.name = name
        self.hobby = hobby
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

var yagom: Person? = Person(name: "yagom", hobby: "eating")
var hana: Person? = Person(name: "hana", hobby: "playing guitar")
hana?.introduce = yagom?.introduce ?? {" "}

print(yagom?.introduce())
yagom = nil
print(hana?.introduce())
