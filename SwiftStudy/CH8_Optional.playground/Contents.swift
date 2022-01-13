
// Ch8 Optional

// 1. 옵셔널 사용
var myName: String? = "hyeji"
print(myName)

myName = nil
print(myName)

// 옵셔널 값 확인
func checkOptionalValue(value optionalValue: Any?) {
    switch optionalValue {
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
    }
}

var myName2: String? = "hyeji"
checkOptionalValue(value: myName2)

myName2 = nil
checkOptionalValue(value: myName2)


let numbers: [Int?] = [2, nil, -4, nil, 100]

for number in numbers {
    switch number {
    case .some(let value) where value < 0:
        print("Negative value!! \(value)")
    case .some(let value) where value > 10:
        print("Large value!! \(value)")
    case .some(let value):
        print("Value \(value)")
    case .none:
        print("nil")
    }
}


// 2. 강제 추출
var myName3: String? = "hyeji"

var hyeji: String = myName3!

//myName = nil
//hyeji = myName!

if myName3 != nil {
    print("My name is \(myName3!)")
} else {
    print("myName == nil")
}


// 3. 옵셔널 바인딩
if let name = myName3 {
    print("My name is \(name)")
} else {
    print("myName == nil")
}

if var name = myName3 {
    name = "wizplan"
    print("My name is \(name)")
} else {
    print("myName == nil")
}

var yourName: String? = nil

if let name = myName3, let friend = yourName {
    print("We are friend! \(name) & \(friend)")
}

yourName = "eric"

if let name = myName3, let friend = yourName {
    print("We are friend! \(name) & \(friend)")
}


// 4. 암시적 추출 옵셔널
var myName4: String! = "hyeji"
//print(myName)
myName4 = nil

if let name = myName4 {
    print("My name is \(name)")
} else {
    print("myName == nil")
}

myName4.isEmpty

