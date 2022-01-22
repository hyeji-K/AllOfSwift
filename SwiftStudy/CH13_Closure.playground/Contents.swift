
let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

// 매개변수로 String 타입 두 개를 가지며, Bool 타입을 반환하는 함수 구현
func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) 비교중")
    return first > second
}

//let reversed: [String] = names.sorted(by: backwards)
//print(reversed)

//let reversed: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
//    return first > second
//})

//print(reversed)

// 후행 클로저
//let reversed: [String] = names.sorted { (first: String, second: String) -> Bool in
//    return first > second
//}

func doSomething(do: (String) -> Void,
                 onSuccess: (Any) -> Void,
                 onFailure: (Error) -> Void) {
    // do something...
}

// 다중 후행 클로저
doSomething { (someString: String) in
    // do closure
} onSuccess: { (result: Any) in
    // success closure
} onFailure: { (error: Error) in
    // failure closure
}


let reversed: [String] = names.sorted { (first, second) in
    return first > second
}

func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
let incrementByTen: (() -> Int) = makeIncrementer(forIncrement: 10)

let first: Int = incrementByTwo()
let second: Int = incrementByTwo()
let third: Int = incrementByTwo()

let ten: Int = incrementByTen()
let twenty: Int = incrementByTen()
let thirty: Int = incrementByTen()

let sameWithIncrementByTwo: (() -> Int) = incrementByTwo

let first1: Int = incrementByTwo()
let second2: Int = sameWithIncrementByTwo()

var completionHendlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHendlers.append(completionHandler)
}

//typealias VoidVoidClosure = () -> Void
//let firstClosure: VoidVoidClosure = {
//    print("Closure A")
//}
//let secondClosure: VoidVoidClosure = {
//    print("Closure B")
//}
//
//// first와 second 매개변수 클로저는 함수의 반환 값으로 사용될 수 있으므로 탈출 클로저
//func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure, shouldReturnFirstClosure: Bool) -> VoidVoidClosure {
//    // 전달인자로 전달받은 클로저를 함수 외부로 다시 반환하기 때문에 함수를 탈출하는 클로저
//    return shouldReturnFirstClosure ? first : second
//}
//
//// 함수에서 반환한 클로저가 함수 외부의 상수에 저장됨
//let returnClosure: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)
//
//returnClosure()
//
//var closures: [VoidVoidClosure] = []
//
//// closure 매개변수 클로저는 함수 외부의 변수에 저장될 수 있으므로 탈출 클로저
//func appendClosure(closure: @escaping VoidVoidClosure) {
//    // 전달인자로 전달받은 클로저가 함수 외부의 변수 내부에 저장되므로 함수를 탈출함
//    closures.append(closure)
//}

typealias VoidVoidClosure = () -> Void

func functionWithNoescapeClosure(closure: VoidVoidClosure) {
    closure()
}

func functionWithEscapingClosure(completionHandler: @escaping VoidVoidClosure) -> VoidVoidClosure {
    return completionHandler
}

class SomeClass {
    var x = 10
    
    func runNoescapeClosure() {
        functionWithNoescapeClosure {
            x = 200
        }
    }
    
    func runEscapingClosure() -> VoidVoidClosure {
        return functionWithEscapingClosure {
            self.x = 100
        }
    }
}

let instance: SomeClass = SomeClass()
instance.runNoescapeClosure()
print(instance.x)

let returnedClousure: VoidVoidClosure = instance.runEscapingClosure()
returnedClousure()
print(instance.x)

// withoutActuallyEscaping
//func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
//    return (array.lazy.filter { predicate($0) }.isEmpty == false)
//}

let numbers: [Int] = [2, 4, 6, 8]

let evenNumberPredicate = { (number: Int) -> Bool in
    return number % 2 == 0
}

let oddNumberPredicate = { (number: Int) -> Bool in
    return number % 2 == 1
}

func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
    return withoutActuallyEscaping(predicate, do: { escapablePredicate in
        return (array.lazy.filter { escapablePredicate($0) }.isEmpty == false)
    })
}

let hasEvenNumber = hasElements(in: numbers, match: evenNumberPredicate)
let hasOddNumber = hasElements(in: numbers, match: oddNumberPredicate)

print(hasEvenNumber)
print(hasOddNumber)


// 대기 중인 손님들입니다
var customersInLine: [String] = ["yoangWha", "SangYong", "SungHun", "HaMi"]
print(customersInLine.count)

// 클로저를 만들어두면 클로저 내부의 코드를 미리 실행(연산)하지 않고 가지고만 있음
let customerProvider: () -> String = {
    return customersInLine.removeFirst()
}
print(customersInLine.count)

// 실제로 실행
//print("Now serving \(customerProvider())!")
print(customersInLine.count)

func serveCustomer(_ customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer(customersInLine.removeFirst())


func returnProvider(_ customerProvider: @autoclosure @escaping () -> String) -> (() -> String) {
    return customerProvider
}

let customerProvider2: () -> String = returnProvider(customersInLine.removeFirst())
print("Now serving \(customerProvider())!")
