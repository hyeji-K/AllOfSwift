
/// 오류 타입의 열거형입니다.
/// - noName: 이름을 전달받지 못했을 때 발생하는 오류
/// - incorrectAge(age: Int): 나이가 0세 미만, 150세 초과인 경우 잘못된 나이로 인식하여 오류로 처리
/// - unknown: 알 수 없는 오류
enum HelloError: Error {
    case noName
    case incorrectAge(age: Int)
    case unknown
}



/**
 여기에 작성되는 텍스트는 Description 부분에 표기됩니다.
 
 텍스트 간에 한 줄을 비워놓으면 줄바꿈이 됩니다.
 
 '-', '+', '*' 를 사용하여 원형 글머리 기호를 사용할 수 있습니다.
 
 - 이렇게 말이죠
 + 이렇게도 되고요
 * 이렇게도 됩니다.
 
 아니면 번호로 글머리 기호를 매겨줄 수도 있습니다.
 
 1. 1번
 2. 2번
 6. 3번
 
 눈치채셨겠지만 앞에 붙는 번호는 크게 중요하지 않습니다. 자동으로 번호를 매겨주죠.
 
 ---
 문단 바꿈
 
 바를 세 개 이상 사용하면 긴 줄로 문단을 나눠줍니다.
 
 ---
 
 언더바 또는 별표를 사용하여 텍스트를 강조할 수 있습니다.
 
 텍스트를 기울이고 싶으면 *A pair of marks*를 사용하고
 
 텍스트를 굵게 표기하고 싶으면 **Two pair of marks**를 사용하면 됩니다.
 
 관련 링크도 넣어줄 수 있습니다.
 
 [swift blog](https://swift.org/blog/)
 
 ---
 등호를 사용하면 바로 위 텍스트를 큰 제목으로 표시해줍니다. 텍스트 앞에 #을 하나 붙여줘도 동일한 효과를 냅니다.
 
 # 큰 제목 표시
 
 
 바를 사용하면 바로 위 텍스트를 중간 크기 제목으로 표시해줍니다. 텍스트 앞에 #을 두 개 붙여줘도 동일한 효과를 냅니다.
 
 ## 사용 예
 ---
 
 다른 텍스트보다 네 칸 이상 들여쓰기하면 코드 블록을 만들어줍니다. 또한 강세표(backquote, )를 세 개 이상 한 쌍으로 묶어도 코드 블록을 만들어줍니다.
 
     // 코멘트로 넣어줄 수 있지요.
     let myName: String = "yagom"
     try helloSwift(myName, yourAge: 100)
 
 ````
 let myName: String = "yagom"
 try helloSwift(myName, yourAge: 100)
 ````
 
 Precondition, postcondition, Requires, Invariant, Complexity, Important, Warning, Author, Authors, Copyright, Date, SeeAlso, Since, Version, Attention, Bug, Experiment, Note, Remark, ToDo 등의 키워드를 통해 적절한 정보를 제공해보세요.
 - note: 강조하고픈 메모를 노트로 남겨둘 수 있습니다.
 - author: 작성자를 남길 수 있습니다.
 - warning: 주의해야 할 점을 남길 수도 있습니다. *주의: 하등 쓸모없는 함수임.

 
 ---
 >  매개변수와 반환 값 등도 적절히 표기해줄 수 있습니다.
 - parameters:
    - yourName: 당신의 이름
    - yourAge: 당신의 나이. 0 미만 또는 150을 초과하면 오류 발생
 - Throws: 오류가 발생하면 HelloError의 한 케이스를 throw
 - returns: Hello string
 */

func helloSwift(yourName: String?, yourAge age: Int = 0) throws -> String {
    guard let name: String = yourName else {
        throw HelloError.noName
    }
    
    if age > 150 {
        throw HelloError.incorrectAge(age: age)
    }
    
    return "Hello Swift!! My name is \(name)." + (age > 0 ? " I'm \(age) years old." : "")
}


struct BasicInformation {
    let name: String
    var age: Int
}

var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

let yagom: Person = Person()
yagom.height = 182.5
yagom.weight = 78.5

print(yagomInfo)
dump(yagomInfo)

print(yagom)
dump(yagom)


let names = ["서현", "다희", "혜지", "지은", "민경", "예리", "미지", "나연", "청해"]
let randomName = names.randomElement()


var valueA: Int = 3
var valueB: Int = 5
var biggerValue: Int = valueA > valueB ? valueA : valueB

var stringA: String = ""
var stringB: String = "String"
var resultValue: Double = stringA.isEmpty ? 1.0 : 0.0
resultValue = stringB.isEmpty ? 1.0 : 0.0

prefix operator **

prefix func ** (value: Int) -> Int {
    return value * value
}

let minusFive: Int = -5
let sqrtMinusFive: Int = **minusFive

print(sqrtMinusFive) // 25

prefix func ! (value: String) -> Bool {
    return value.isEmpty
}

var stringValue: String = "moongchi"
var isEmptyString: Bool = !stringValue

print(isEmptyString) // false

stringValue = ""
isEmptyString = !stringValue

print(isEmptyString) // true



prefix func ** (value: String) -> String {
    return value + " " + value
}

let resultString: String = **"moongchi"

print(resultString) // moongchi moongchi

postfix operator **

postfix func ** (value: Int) -> Int {
    return value + 10
}

let five: Int = 5
let fivePlusTen: Int = five**

print(fivePlusTen) // 15


import Foundation
infix operator ** : MultiplicationPrecedence

func ** (lhs: String, rhs: String) -> Bool {
    return lhs.contains(rhs)
}

let helloMoongchi: String = "Hello moongchi"
let moongchi: String = "moongchi"
let isContainsMoongchi: Bool = helloMoongchi ** moongchi // true

class Car {
    var modelYear: Int? // 연식
    var modelName: String? // 모델 이름
}

struct SmartPhone {
    var company: String? // 제조사
    var model: String? // 모델
}

// Car 클래스의 인스턴스끼리 == 연산했을 때 modelName이 같다면 true 반환
func == (lhs: Car, rhs: Car) -> Bool {
    return lhs.modelName == rhs.modelName
}

// SmartPhone 구조체의 인스턴스끼리 == 연산했을 때 model이 같다면 true 반환
func == (lhs: SmartPhone, rhs: SmartPhone) -> Bool {
    return lhs.model == rhs.model
}

let myCar = Car()
myCar.modelName = "S"

let yourCar = Car()
yourCar.modelName = "S"

var myPhone = SmartPhone()
myPhone.model = "SE"

var yourPhone = SmartPhone()
yourPhone.model = "6"

print(myCar == yourCar) // true
print(myPhone == yourPhone) // false

let first: Int = 5
let second: Int = 7

if first > second {
    print("first > second")
} else if first < second {
    print("first < second")
} else {
    print("first == second")
}
