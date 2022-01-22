
// ch14 optional chaining & early exit

class Room {
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
}

class Building {
    var name: String
    var room: Room?
    
    init(name: String) {
        self.name = name
    }
}

//struct Address {
//    var province: String
//    var city: String
//    var street: String
//    var building: Building?
//    var detailAddress: String?
//}

class Person {
    var name: String
    var address: Address?
    
    init(name: String) {
        self.name = name
    }
}

let yagom: Person = Person(name: "yagom")

// 옵셔널 체이닝
let yagomRoomViaOptionalChaining: Int? = yagom.address?.building?.room?.number

// 강제 추출
//let yagomRoomViaOptionalUnwraping: Int = yagom.address!.building!.room!.number

// 옵셔널 바인딩
var roomNumber: Int? = nil

if let yagomAddress: Address = yagom.address {
    if let yagomBuilding: Building = yagomAddress.building {
        if let yagomRoom: Room = yagomBuilding.room {
            roomNumber = yagomRoom.number
        }
    }
}

if let number: Int = roomNumber {
    print(number)
} else {
    print("Can not find room number")
}

if let roomNumber: Int = yagom.address?.building?.room?.number {
    print(roomNumber)
} else {
    print("Can not find room number")
}


//yagom.address = Address(province: "충청북도", city: "청주시 청원구", street: "충청대로", building: nil, detailAddress: nil)
//yagom.address?.building = Building(name: "곰굴")
//yagom.address?.building?.room = Room(number: 0)
//yagom.address?.building?.room?.number = 505
//print(yagom.address?.building?.room?.number)

struct Address {
    var province: String
    var city: String
    var street: String
    var building: Building?
    var detailAddress: String?
    
    init(province: String, city: String, street: String) {
        self.province = province
        self.city = city
        self.street = street
    }
    
    func fullAddress() -> String? {
        var restAddress: String? = nil
        
        if let buildingInfo: Building = self.building {
            restAddress = buildingInfo.name
        } else if let detail = self.detailAddress {
            restAddress = detail
        }
        
        if let rest: String = restAddress {
            var fullAddress: String = self.province
            
            fullAddress += " " + self.city
            fullAddress += " " + self.street
            fullAddress += " " + rest
            
            return fullAddress
        } else {
            return nil
        }
    }
    
    func printAddress() {
        if let address: String = self.fullAddress() {
            print(address)
        }
    }
}

yagom.address = Address(province: "충청북도", city: "청주시 청원구", street: "충청대로")
yagom.address?.building = Building(name: "곰굴")
yagom.address?.building?.room = Room(number: 0)
yagom.address?.building?.room?.number = 505

yagom.address?.fullAddress()?.isEmpty
yagom.address?.printAddress()

let optionalArray: [Int]? = [1, 2, 3]
optionalArray?[1]

var optionalDictionary: [String: [Int]]? = [String: [Int]]()
optionalDictionary?["numberArray"] = optionalArray
optionalDictionary?["numberArray"]?[2]


// 빠른 종료
func greet(_ person: [String: String]) {
    guard let name: String = person["name"] else {
        return
    }
    
    print("Hello \(name)")
    
    guard let location: String = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    
    print("I hope the weather is nice \(location)")
}

var personInfo: [String: String] = [String: String]()
personInfo["name"] = "Jenny"
greet(personInfo)

personInfo["location"] = "Korea"
greet(personInfo)

func enterClub(name: String?, age: Int?) {
    guard let name: String = name, let age: Int = age, age > 19, name.isEmpty == false else {
          print("You are too young to enter the club")
          return
      }
    
    print("Welcome \(name)")
}

let first: Int = 3
let second: Int = 5

guard first > second else {
    // 
}
