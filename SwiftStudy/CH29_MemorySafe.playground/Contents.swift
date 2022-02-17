import Darwin

// Ch29 - Ch30

// Ch29

func oneMore(than number: Int) -> Int {
    return number + 1
}

var myNumber: Int = 1
myNumber = oneMore(than: myNumber)
print(myNumber)


//// 값 타입의 경우
//var number: Int = 100
//print(Unmanaged<AnyObject>.fromOpaque(&number).toOpaque())
//
//// 참조 타입의 경우
//var object: SomeClass = SomeClass()
//print(Unmanaged<AnyObject>.passUnretained(object).toOpaque())


var step: Int = 1
var copyOfStep: Int = step

func increment(_ number: inout Int) {
    number += copyOfStep
}

increment(&step)


func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

var playerOneScore: Int = 42
var playerTwoScore: Int = 30
balance(&playerOneScore, &playerTwoScore)
//balance(&playerOneScore, &playerOneScore)


struct GamePlayer {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    
    mutating func restoreHealth() {
        self.health = GamePlayer.maxHealth
    }
    
    mutating func shareHealth(with teammate: inout GamePlayer) {
        balance(&teammate.health, &health)
    }
}

var oscar: GamePlayer = GamePlayer(name: "Oscar", health: 10, energy: 10)
var maria: GamePlayer = GamePlayer(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)


func someFunction() {
    var oscar = GamePlayer(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)
}



// Ch30

protocol WrappedPrize {
    associatedtype Prize
    
    var wrapColor: String! { get }
    var prize: Prize! { get }
}

protocol Gundam { }
protocol Pokemon { }

struct WrappedGundam: WrappedPrize {
    var wrapColor: String!
    var prize: Gundam!
}

struct WrappedPokemon: WrappedPrize {
    var wrapColor: String!
    var prize: Pokemon!
}

//struct PrizeMachine {
//    func dispenseRandomPrize() -> WrappedPrize {
//        return WrappedGundam()
//    }
//}

struct PrizeMachine {
    func dispenseRandomPrize() -> some WrappedPrize {
        return WrappedGundam()
    }
}

let machine: PrizeMachine = PrizeMachine()
let wrappedPrize = machine.dispenseRandomPrize()
