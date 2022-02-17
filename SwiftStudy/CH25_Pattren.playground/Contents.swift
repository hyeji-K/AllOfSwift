
// Ch25 Pattern

// 와일드카드 패턴
//let string: String = "ABC"
//
//switch string {
//case _: print(string)
//}
//
//let optionalString: String? = "ABC"
//
//switch optionalString {
//case "ABC"?: print(optionalString)
//case _?: print("Has value, but not ABC")
//case nil: print("nil")
//}
//
//let yagom = ("yagom", 99, "Male")
//
//switch yagom {
//case ("yagom", _, _): print("Hello yagom!!!")
//case (_, _, _): print("Who cares~")
//}
//
//for _ in 0..<2 {
//    print("Hello")
//}


// 값 바인딩 패턴
let yagom = ("yagom", 99, "Male")

switch yagom {
case let (name, age, gender): print("Name: \(name), Age: \(age), Gender: \(gender)")
}

switch yagom {
case (let name, let age, let gender): print("Name: \(name), Age: \(age), Gender: \(gender)")
}

switch yagom {
case (let name, _, let gender): print("Name: \(name), Gender: \(gender)")
}


// 튜플 패턴
let (a): Int = 2
print(a)

let (x, y): (Int, Int) = (1, 2)
print(x)
print(y)

let name: String = "Jung"
let age: Int = 99
let gender: String? = "Male"

switch (name, age, gender) {
case ("Jung", _, _): print("Hello Jung!!")
case (_, _, "Male"?): print("Who are you man?")
default: print("I don't know who you are")
}

let points: [(Int, Int)] = [(0, 0), (1, 0), (1, 1), (2, 0), (2, 1)]

for (x, _) in points {
    print(x)
}

// 열거형 케이스 패턴
let someValue: Int = 30

if case 0...100 = someValue {
    print("0 <= \(someValue) <= 100")
}

let anotherValue: String = "ABC"

if case "ABC" = anotherValue {
    print(anotherValue)
}

enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dishes: [MainDish] = []

var dinner: MainDish = .pasta(taste: "크림")
dishes.append(dinner)

if case .pasta(let taste) = dinner {
    print("\(taste) 파스타")
}

dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
dishes.append(dinner)

func whatIsThis(dish: MainDish) {
    guard case .pizza(let dough, let topping) = dinner else {
        print("It's not a Pizza")
        return
    }
    
    print("\(dough) \(topping) 피자")
}
whatIsThis(dish: dinner)

dinner = .chicken(withSauce: true)
dishes.append(dinner)

while case .chicken(let sauced) = dinner {
    print("\(sauced ? "양념" : "후라이드") 통닭")
    break
}

dinner = .rice
dishes.append(dinner)

if case .rice = dinner {
    print("오늘 저녁은 밥입니다.")
}

for dish in dishes {
    switch dish {
    case let .pasta(taste): print(taste)
    case let .pizza(dough, topping): print(dough, topping)
    case let .chicken(sauced): print(sauced ? "양념" : "후라이드")
    case .rice: print("Just 쌀")
    }
}


// 옵셔널 패턴
var optionalValue: Int? = 100

if case .some(let value) = optionalValue {
    print(value)
}

if case let value? = optionalValue {
    print(value)
}

func isItHasValue(_ optionalValue: Int?) {
    guard case .some(let value) = optionalValue else {
        print("none")
        return
    }
    
    print(value)
}

isItHasValue(optionalValue)

while case .some(let value) = optionalValue {
    print(value)
    optionalValue = nil
}

print(optionalValue)

let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]

for case let number? in arrayOfOptionalInts {
    print("Found a \(number)")
}

// 타입캐스팅 패턴
//let someValue: Any = 100
//
//switch someValue {
//case is String: print("It's String!")
//case let value as Int: print(value + 1)
//default: print("Int도 String도 아닙니다")
//}


// 표현 패턴
//switch 3 {
//case 0...5: print("0과 5 사이")
//default: print("0보다 작거나 5보다 큽니다.")
//}
//
//var point: (Int, Int) = (1, 2)
//
//switch point {
//case (0, 0): print("원점")
//case (-2...2, -2...2): print("\(point.0), \(point.1)은 원점과 가깝습니다.")
//default: print("point (\(point.0), \(point.1))")
//}
//
//func ~= (pattern: String, value: Int) -> Bool {
//    return pattern == "\(value)"
//}
//
//point = (0, 0)
//
//
//switch point {
//case ("0", "0"): print("원점")
//default: print("point (\(point.0), \(point.1))")
//}
//
//struct Person {
//    var name: String
//    var age: Int
//}
//
//let lingo: Person = Person(name: "Lingo", age: 99)
//func ~= (pattern: String, value: Person) -> Bool {
//    return pattern == value.name
//}
//
//func ~= (pattern: Person, value: Person) -> Bool {
//    return pattern.name == value.name && pattern.age == value.age
//}
//
//switch lingo {
//case Person(name: "Lingo", age: 99): print("Same Person!!")
//case "Lingo": print("Hello Lingo!!")
//default: print("I don't know who you are")
//}


// 표현 패턴 2
protocol Personalize {
    var name: String { get }
    var age: Int { get }
}

struct Person: Personalize {
    var name: String
    var age: Int
}

let star: Person = Person(name: "Star", age: 99)

//func ~= (pattern: String, value: Person) -> Bool {
//    return pattern == value.name
//}
//
//func ~= (pattern: Person, value: Person) -> Bool {
//    return pattern.name == value.name && pattern.age == value.age
//}

func ~= <T: Personalize>(pattern: String, value: T) -> Bool {
    return pattern == value.name
}

func ~= <T: Personalize>(pattern: T, value: T) -> Bool {
    return pattern.name == value.name && pattern.age == value.age
}

switch star {
case Person(name: "Star", age: 99): print("Same Person!!")
case "Star": print("Hello Star!!")
default: print("I don't know who you are")
}

func ~= <T: Personalize>(pattern: (T) -> Bool, value: T) -> Bool {
    return pattern(value)
}

func young<T: Personalize>(value: T) -> Bool {
    return value.age < 50
}

switch star {
case young: print("\(star.name) is young")
default: print("\(star.name) is old")
}

func isNamed<T: Personalize>(_ pattern: String) -> ((T) -> Bool) {
    return { (value: T) -> Bool in value.name == pattern }
}

switch star {
case isNamed("Jung"): print("He is Jung")
default: print("Another person")
}

prefix operator ==?

prefix func ==? <T: Personalize>(pattern: String) -> ((T) -> Bool) {
    return isNamed(pattern)
}

switch star {
case ==?"Jung": print("He is Jung")
default: print("Another person")
}
