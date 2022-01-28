import Foundation

// Ch18 Inheritance

//class Person {
//    var name: String = ""
//    var age: Int = 0
//    var koreanAge: Int {
//        return self.age + 1
//    }
//
//    var introduction: String {
//        return "이름 : \(name), 나이 : \(age)"
//    }
//
//    func speak() {
//        print("가나다라마바사")
//    }
//
//    class func introduceClass() -> String {
//        return "인류의 소원은 평화입니다."
//    }
//}
//
//class Student: Person {
//    var grade: String = "F"
//
//    func study() {
//        print("Study hard...")
//    }
//
//    override func speak() {
//        print("저는 학생입니다.")
//    }
//}

//let yagom: Person = Person()
//yagom.name = "yagom"
//yagom.age = 99
//print(yagom.introduction)
//yagom.speak()
//
//let jay: Student = Student()
//jay.name = "jay"
//jay.age = 10
//jay.grade = "A"
//print(jay.introduction)
//jay.speak()
//jay.study()

//class UniversityStudent: Student {
//    var major: String = ""
//
//    class func introduceClass() {
//        print(super.introduceClass())
//    }
//
//    override class func introduceClass() -> String {
//        return "대학생의 소원은 A+입니다."
//    }
//
//    override func speak() {
//        super.speak()
//        print("대학생이죠.")
//    }
//}

//let jenny: UniversityStudent = UniversityStudent()
//jenny.major = "Art"
//jenny.speak()
//jenny.study()


// 메서드 재정의
//let yagom: Person = Person()
//yagom.speak()
//let jay: Student = Student()
//jay.speak()
//let jenny: UniversityStudent = UniversityStudent()
//jenny.speak()
//
//print(Person.introduceClass())
//print(Student.introduceClass())
//print(UniversityStudent.introduceClass() as String)
//UniversityStudent.introduceClass() as Void

// 프로퍼티 재정의
//class Person {
//    var name: String = ""
//    var age: Int = 0
//    var koreanAge: Int {
//        return self.age + 1
//    }
//
//    var introduction: String {
//        return "이름 : \(name), 나이 : \(age)"
//    }
//}
//
//class Student: Person {
//    var grade: String = "F"
//
//    override var introduction: String {
//        return super.introduction + " " + "학점 : \(self.grade)"
//    }
//
//    override var koreanAge: Int {
//        get {
//            return super.koreanAge
//        }
//
//        set {
//            self.age = newValue - 1
//        }
//    }
//}
//
//let yagom: Person = Person()
//yagom.name = "yagom"
//yagom.age = 55
////yagom.koreanAge = 56 오류!!
//print(yagom.introduction)
//print(yagom.koreanAge)
//
//let jay: Student = Student()
//jay.name = "jay"
//jay.age = 14
//jay.koreanAge = 15
//print(jay.introduction)
//print(jay.koreanAge)


// 프로퍼티 감시자 재정의
//class Person {
//    var name: String = ""
//    var age: Int = 0 {
//        didSet {
//            print("Person age : \(self.age)")
//        }
//    }
//    var koreanAge: Int {
//        return self.age + 1
//    }
//
//    var fullName: String {
//        get {
//            return self.name
//        }
//
//        set {
//            self.name = newValue
//        }
//    }
//}
//
//class Student: Person {
//    var grade: String = "F"
//
//    override var age: Int {
//        didSet {
//            print("Student age : \(self.age)")
//        }
//    }
//
//    override var koreanAge: Int {
//        get {
//            return super.koreanAge
//        }
//
//        set {
//            self.age = newValue - 1
//        }
//
////        didSet { } // 오류!!
//    }
//
//    override var fullName: String {
//        didSet {
//            print("Full Name : \(self.fullName)")
//        }
//    }
//}
//
//let yagom: Person = Person()
//yagom.name = "yagom"
//yagom.age = 55
//yagom.fullName = "Jo yagom"
//print(yagom.koreanAge)
//
//let jay: Student = Student()
//jay.name = "jay"
//jay.age = 14
//jay.koreanAge = 15
//jay.fullName = "Kim jay"
//print(jay.koreanAge)
//
//// 서브스크립트 재정의
//class School {
//    var students: [Student] = [Student]()
//
//    subscript(number: Int) -> Student {
//        print("School subscript")
//        return students[number]
//    }
//}
//
//class MiddleSchool: School {
//    var middleStudents: [Student] = [Student]()
//
//    override subscript(index: Int) -> Student {
//        print("MiddleSchool subscript")
//        return middleStudents[index]
//    }
//}
//
//let university: School = School()
//university.students.append(Student())
//university[0]
//
//let middle: MiddleSchool = MiddleSchool()
//middle.middleStudents.append(Student())
//middle[0]


// 재정의 방지
//class Person {
//    final var name: String = ""
//
//    final func speak() {
//        print("가나다라마바사")
//    }
//}
//
//final class Student: Person {
//    override var name: String {
//        set {
//            super.name = newValue
//        }
//
//        get {
//            return "학생"
//        }
//    }
//
//    override func speak() {
//        print("저는 학생입니다.")
//    }
//}
//
//class UniversityStudent: Student { }


// 2단계 초기화
//class Person {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}
//
//class Student: Person {
//    var major: String
//
//    init(name: String, age: Int, major: String) {
//        self.major = major
//        super.init(name: name, age: age)
//    }
//
//    convenience init(name: String) {
//        self.init(name: name, age: 7, major: :"")
//    }
//}

// 클래스 이니셜라이저의 재정의
//class Person {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//
//    convenience init(name: String) {
//        self.init(name: name, age: 0)
//    }
//}
//
//class Student: Person {
//    var major: String
//
//    override init(name: String, age: Int) {
//        self.major = "Swift"
//        super.init(name: name, age: age)
//    }
//
//    convenience init(name: String) {
//        self.init(name: name, age: 7)
//    }
//}


// 실패가능한 이니셜라이저의 재정의
//class Person {
//    var name: String
//    var age: Int
//
//    init() {
//        self.name = "Unknown"
//        self.age = 0
//    }
//
//    init?(name: String, age: Int) {
//
//        if name.isEmpty {
//            return nil
//        }
//        self.name = name
//        self.age = age
//    }
//
//    init?(age: Int) {
//        if age < 0 {
//            return nil
//        }
//        self.name = "Unknown"
//        self.age = age
//    }
//}
//
//class Student: Person {
//    var major: String
//
//    override init?(name: String, age: Int) {
//        self.major = "Swift"
//        super.init(name: name, age: age)
//    }
//
//    override init(age: Int) {
//        self.major = "Swift"
//        super.init()
//    }
//}

// 이니셜라이저 자동 상속
//class Person {
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    convenience init() {
//        self.init(name: "Unknown")
//    }
//}
//
//class Student: Person {
//    var major: String
//
//    convenience init(major: String) {
//        self.init()
//        self.major = major
//    }
//
//    override convenience init(name: String) {
//        self.init(name: name, major: "Unknown")
//    }
//
//    init(name: String, major: String) {
//        self.major = major
//        super.init(name: name)
//    }
//}
//
////let yagom: Person = Person(name: "yagom")
////let hana: Student = Student(name: "hana")
////print(yagom.name)
////print(hana.name)
//
//let wizplan: Person = Person()
//let jinsung: Student = Student(major: "Swift")
//print(wizplan.name)
//print(jinsung.name)
//print(jinsung.major)
//
//
//class UniversityStudent: Student {
//    var grade: String = "A+"
//    var description: String {
//        return "\(self.name) \(self.major) \(self.grade)"
//    }
//
//    convenience init(name: String, major: String, grade: String) {
//        self.init(name: name, major: major)
//        self.grade = grade
//    }
//}
//
//let nova: UniversityStudent = UniversityStudent()
//print(nova.description)
//
//let raon: UniversityStudent = UniversityStudent(name: "raon")
//print(raon.description)
//
//let joker: UniversityStudent = UniversityStudent(name: "joker", major: "Programming")
//print(joker.description)
//
//let chope: UniversityStudent = UniversityStudent(name: "chope", major: "Computer", grade: "C")
//print(chope.description)


// 요구 이니셜라이저
class Person {
    var name: String
    
    init() {
        self.name = "Unknown"
    }
}

class Student: Person {
    var major: String = "Unknown"
    
    init(major: String) {
        self.major = major
        super.init()
    }
    
    required override init() {
        self.major = "Unknown"
        super.init()
    }
    
    required convenience init(name: String) {
        self.init()
        self.name = name
    }
}

class UniversityStudent: Student {
    var grade: String
    
    init(grade: String) {
        self.grade = grade
        super.init()
    }
    
    required init() {
        self.grade = "F"
        super.init()
    }
    
    required convenience init(name: String) {
        self.init()
        self.name = name
    }
}

//let jiSoo: Student = Student()
//print(jiSoo.major)
//
//let yagom: Student = Student(major: "Swift")
//print(yagom.major)
//
//let juHyun: UniversityStudent = UniversityStudent(grade: "A+")
//print(juHyun.grade)

let yagom: UniversityStudent = UniversityStudent()
print(yagom.grade)

let juHyun: UniversityStudent = UniversityStudent(name: "JuHyun")
print(juHyun.name)
