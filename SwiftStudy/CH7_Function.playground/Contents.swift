
// Ch7 Function

// 1. 함수의 정의와 호출
func hello(name: String) -> String {
    return "Hello \(name)"
}

let helloJenny: String = hello(name: "Jenny")

func introduce(name: String) -> String {
    "제 이름은 " + name + "입니다"
}

let introduceJenny: String = introduce(name: "Jenny")


// 2. 매개변수
// 매개변수가 없는 함수
func helloWorld() -> String {
    return "Hello, World!"
}

// 매개변수가 여러 개인 함수
func sayHello(myName: String, yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}

// 매개변수 이름(Parameter Name)과 전달인자 레이블(Argument Label)을 가지는 함수
func sayHello(from myName: String, to yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}

print(sayHello(from: "hyeji", to: "moongchi"))


// 매개변수 기본값
func sayHello(_ name: String, _ times: Int = 3) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    
    return result
}

print(sayHello("moongchi", 2))
sayHello("hi")


// 가변 매개변수
func sayHelloToFriends(me: String, friends names: String...) -> String {
    var result: String = ""
    
    for friend in names {
        result += "Hello \(friend)!" + " "
    }
    
    result += "I'm " + me + "!"
    return result
}

print(sayHelloToFriends(me: "hyeji", friends: "Moongchi", "Ppiyoung"))


// 입출력 매개변수
var numbers: [Int] = [1, 2, 3]

func nonReferenceParameter(_ arr: [Int]) {
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}

func referenceParameter(_ arr: inout [Int]) {
    arr[1] = 1
}

nonReferenceParameter(numbers)
print(numbers[1])

referenceParameter(&numbers)
print(numbers[1])


// 3. 반환이 없는 함수
func sayHelloWorld() {
    print("Hello, world!")
}

func sayHello2(from myName: String, to name: String) {
    print("Hello \(name)! I'm \(myName)")
}

func sayGoodbye() -> Void {
    print("Good bye")
}


// 4. 데이터 타입으로서의 함수
typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunctions: CalculateTwoInts = addTwoInts
// var mathFunctions: (Int, Int) -> Int = addTwoInts



print(mathFunctions(2, 5))

mathFunctions = multiplyTwoInts
print(mathFunctions(2, 5))



func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 3, 5)

func chooseMathFunction(_ toAdd: Bool) -> CalculateTwoInts {
    return toAdd ? addTwoInts : multiplyTwoInts
}

printMathResult(chooseMathFunction(true), 3, 5)


// 중첩함수
typealias MoveFunc = (Int) -> Int

func goRight(_ currentPosition: Int) -> Int {
    return currentPosition + 1
}

func goLeft(_ currentPosition: Int) -> Int {
    return currentPosition - 1
}

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = 3 // 현 위치

let moveToZero: MoveFunc = functionForMove(position > 0)
print("원점으로 갑시다.")

while position != 0 {
    print("\(position)...")
    position = moveToZero(position)
}

print("원점 도착!")


// 종료되지 않는 함수
func crashAndBurn() -> Never {
    fatalError("Something very, very bad happened")
}

crashAndBurn() // 프로세스 종료 후 오류 보고

func someFunction(isAllIsWell: Bool) {
    guard isAllIsWell else {
        print("마을에 도둑이 들었습니다!")
        crashAndBurn()
    }
    print("All is well")
}

someFunction(isAllIsWell: true)
someFunction(isAllIsWell: false)


// 반환값을 무시할 수 있는 함수
func say(_ something: String) -> String {
//    print(something)
    return something
}


@discardableResult func discadableResultSay(_ something: String) -> String {
    print(something)
    return something
}

say("hello")
//discadableResultSay("hello")

