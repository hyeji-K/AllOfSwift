
// Ch16 Monad

func addThree(_ num: Int) -> Int {
    return num + 3
}

addThree(2)

print(Optional(2).map(addThree))

var value: Int? = 2
value.map{ $0 + 3 }
value = nil
value.map{ $0 + 3 }


func doubledEven(_ num: Int) -> Int? {
    if num.isMultiple(of: 2) {
        return num * 2
    }
    return nil
}

Optional(3).flatMap(doubledEven)

let optionals: [Int?] = [1, 2, nil, 5]

let mapped: [Int?] = optionals.map{ $0 }
let compactMapped: [Int] = optionals.compactMap{ $0 }

print(mapped)
print(compactMapped)


let multipleContainer = [[1, 2, Optional.none], [3, Optional.none], [4, 5, Optional.none]]

let mappedMultipleContainer = multipleContainer.map{ $0.map{ $0 } }
let flatmappedMultipleContainer = multipleContainer.flatMap{ $0.compactMap{ $0 } }
print(mappedMultipleContainer)
print(flatmappedMultipleContainer)


// Int 타입을 String 타입으로, 그리고 String 타입을 Int 타입으로 변환하는 과정을 체인 형식으로 구현
func stringToInteger(_ string: String) -> Int? {
    return Int(string)
}

func integerToString(_ integer: Int) -> String? {
    return "\(integer)"
}

var optionalString: String? = "2"

let flattenResult = optionalString.flatMap(stringToInteger)
    .flatMap(integerToString)
    .flatMap(stringToInteger)

print(flattenResult)

let mappedResult = optionalString.map(stringToInteger)
print(mappedResult)

var result: Int?
if let string: String = optionalString {
    if let number: Int = stringToInteger(string) {
        if let finalString: String = integerToString(number) {
            if let finalNumber: Int = stringToInteger(finalString) {
                result = Optional(finalNumber)
            }
        }
    }
}

print(result)

if let string: String = optionalString,
   let number: Int = stringToInteger(string),
   let finalString: String = integerToString(number),
   let finalNumber: Int = stringToInteger(finalString) {
    result = Optional(finalNumber)
}

print(result)

// 플랫맵은 체이닝 중간에, 연산에 실패하는 경우나 값이 없어지는 경우(.none이 된다거나 nil이 된다는 등)에는 별도의 예외 처리없이 빈 컨테이너를 반환
func integerToNil(param: Int) -> String? {
    return nil
}

optionalString = "2"

result = optionalString.flatMap(stringToInteger)
    .flatMap(integerToNil)
    .flatMap(stringToInteger)

print(result)
