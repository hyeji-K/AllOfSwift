import Foundation

// Ch28 Error Handling

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}


struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Biscuit": Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func dispense(snack: String) {
        print("\(snack) 제공")
    }
    
    func vend(itemNamed name: String) throws {
        guard let item = self.inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= self.coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - self.coinsDeposited)
        }
        
        self.coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        self.inventory[name] = newItem
        
        self.dispense(snack: name)
    }
}

let favoriteSnacks = [
    "yagom": "Chips",
    "jinsung": "Biscuit",
    "heejin": "Chocolate"
]

//func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
//    let snackName = favoriteSnacks[person] ?? "Candy Bar"
//    try vendingMachine.vend(itemNamed: snackName)
//}
//
//struct PurchasedSnack {
//    let name: String
//    init(name: String, vendingMachine: VendingMachine) throws {
//        try vendingMachine.vend(itemNamed: name)
//        self.name = name
//    }
//}

//let machine: VendingMachine = VendingMachine()
//machine.coinsDeposited = 30
//
//var purchase: PurchasedSnack = try PurchasedSnack(name: "Biscuit", vendingMachine: machine)
//
//print(purchase.name)
//
//for (person, favoriteSnack) in favoriteSnacks {
//    print(person, favoriteSnack)
//    try buyFavoriteSnack(person: person, vendingMachine: machine)
//}



func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    tryingVend(itemNamed: snackName, vendingMachine: vendingMachine)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) {
        tryingVend(itemNamed: name, vendingMachine: vendingMachine)
        self.name = name
    }
}
               
func tryingVend(itemNamed: String, vendingMachine: VendingMachine) {
    do {
        try vendingMachine.vend(itemNamed: itemNamed)
    } catch VendingMachineError.invalidSelection {
        print("유효하지 않은 선택")
    } catch VendingMachineError.outOfStock {
        print("품절")
    } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
        print("자금 부족 - 동전 \(coinsNeeded)개를 추가로 지급해주세요")
    } catch {
        print("그 외 오류 발생 : ", error)
    }
}
               
let machine: VendingMachine = VendingMachine()
machine.coinsDeposited = 20

var purchase: PurchasedSnack = PurchasedSnack(name: "Biscuit", vendingMachine: machine)

print(purchase.name)

purchase = PurchasedSnack(name: "Ice Cream", vendingMachine: machine)

print(purchase.name)

for (person, favoriteSnack) in favoriteSnacks {
    print(person, favoriteSnack)
    try buyFavoriteSnack(person: person, vendingMachine: machine)
}


//func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
//    if shouldThrowError {
//        enum SomeError: Error {
//            case justSomeError
//        }
//
//        throw SomeError.justSomeError
//    }
//
//    return 100
//}
//
//let x: Optional = try? someThrowingFunction(shouldThrowError: true)
//print(x)
//
//let y: Optional = try? someThrowingFunction(shouldThrowError: false)
//print(y)


//func fetchData() -> Data? {
//    if let data = try? fetchDataFromDisk() {
//        return data
//    }
//    if let data = try? fetchDataFromServer() {
//        return data
//    }
//    return nil
//}


func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        
        throw SomeError.justSomeError
    }
    
    return 100
}

let y: Int = try! someThrowingFunction(shouldThrowError: false)
print(y)

//let x: Int = try! someThrowingFunction(shouldThrowError: true)



//// 오류를 던지는 함수
//func someThrowingFunction() throws {
//    enum SomeError: Error {
//        case justSomeError
//    }
//
//    throw SomeError.justSomeError
//}
//
//// 다시 던지기 함수
//func someFunction(callback: () throws -> Void) rethrows {
//    enum AnotherError: Error {
//        case justAnotherError
//    }
//
//    do {
//        // 매개변수로 전달한 오류 던지기 함수이므로 catch 절에서 제어할 수 있음
//        try callback()
//    } catch {
//        throw AnotherError.justAnotherError
//    }
//
//    do {
//        // 매개변수로 전달한 오류 던지기 함수가 아니므로 catch 절에서 제어할 수 없음
//        try someThrowingFunction()
//    } catch {
//        throw AnotherError.justAnotherError
//    }
//
//    // catch 절 외부에서 단독으로 오류를 던질 수는 없음
//    throw AnotherError.justAnotherError
//}



//protocol SomeProtocol {
//    func someThrowingFunctionFromProtocol(callback: () throws -> Void) throws
//    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) rethrows
//}
//
//class SomeClass: SomeProtocol {
//    func someThrowingFunction(callback: () throws -> Void) throws { }
//    func someFunction(callback: () throws -> Void) rethrows { }
//
//    // 오류!! 던지기 메서드는 다시 던지기 메서드를 요구하는 프로토콜을 충족할 수 없음
//    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) throws {
//    }
//
//    // 다시 던지기 메서드는 던지기 메서드를 요구하는 프로토콜의 요구사항에 부합
//    func someThrowingFunctionFromProtocol(callback: () throws -> Void) rethrows {
//    }
//}
//
//class SomeChildClass: SomeClass {
//    // 부모클래스의 던지기 메서드는 자식클래스에서 다시 던지기 메서드로 재정의할 수 있음
//    override func someThrowingFunction(callback: () throws -> Void) rethrows {
//    }
//
//    // 오류!! 부모클래스의 다시 던지기 메서드는 자식클래스에서 던지기 메서드로 재정의할 수 없음
//    override func someFunction(callback: () throws -> Void) throws {
//    }
//}


for i in 0...2 {
    defer {
        print("A", terminator: " ")
    }
    print(i, terminator: " ")
    
    if i % 2 == 0 {
        defer {
            print("", terminator: "\n")
        }
        
        print("It's even", terminator: " ")
    }
}

//func writeData() {
//    let file = openFile()
//
//    // 함수 코드 블록을 빠져나가기 직전 무조건 실행되어 파일을 잊지 않고 닫아줌
//    defer {
//        CloseFile(file)
//    }
//
//    if ... {
//        return
//    }
//
//    if ... {
//        return
//    }
//
//    // 처리 끝
//}


func someThrowingFunction2(shouldThrowError: Bool) throws -> Int {
    defer {
        print("First")
    }
    
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        
        throw SomeError.justSomeError
    }
    
    defer {
        print("Second")
    }
    
    defer {
        print("Third")
    }
    
    return 100
}

try? someThrowingFunction2(shouldThrowError: true)

try? someThrowingFunction2(shouldThrowError: false)


func someFunction() {
    print("1")
    
    defer {
        print("2")
    }
    
    do {
        defer {
            print("3")
        }
        print("4")
    }
    
    defer {
        print("5")
    }
    
    print("6")
}

someFunction()
