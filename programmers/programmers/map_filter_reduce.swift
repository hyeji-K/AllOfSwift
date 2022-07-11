//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/01.
//

import Foundation

//func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
//    return (0..<n).map { String(String(arr1[$0]|arr2[$0]|2<<(n - 1), radix: 2).map { $0 == "1" ? "#" : " " }[1...n]) }
//}

//func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
//
//    return (0..<n).map {
//        let binary = String(arr1[$0] | arr2[$0], radix: 2)
//        let padded = String(repeating: "0", count: n - binary.count) + binary
//        return padded.reduce("") { $0 + ($1 == "0" ? " " : "#") }
//    }
//}

/*
 map 자신을 호출할때 매개변수로 전달된 함수를 실행하여 그 결과를 다시 반환해주는 함수
 => 컨테이너가 담고 있던 각각의 값을 매개변수를 통해 받은 함수에 적용한 후 다시 컨테이너에 포장하여 반환함
 => 기존 컨테이너의 값은 변경되지 않고 새로운 컨테이너가 생성되어 반환
 => 기존 데이터를 변형하는데 많이 사용
 for-in 대신 map 사용 => 코드의 재사용 측면이나 컴파일러 최적화 측면에서 성능차이 존재
 */

let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int] = []
var strings: [String] = []

//for number in numbers {
//    doubledNumbers.append(number * 2)
//    strings.append(String(number))
//}
//print(doubledNumbers)
//print(strings)

doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

print(doubledNumbers)


let count: Int = 4
let price: Int = 3
var arr = (1...count).map { $0 * price }.reduce(0) { $0 + $1 }


/*
 filter 컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출하는 역할
 => 매개변수로 전달되는 함수의 반환 타입은 Bool
 => 새로운 컨테이너에 포함될 항목이면 true, 포함하지 않으려면 false 반환
 */

let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers)

let oddNumbers: [Int] = numbers.filter { $0 % 2 == 1 }
print(oddNumbers)

/*
 reduce 컨테이너 내부의 콘텐츠를 하나로 합하는 기능
 두 가지 형태가 존재함
 1. 클로저가 각 요소를 전달받아 연산한 후 값을 다음 클로저 실행을 위해 반환하며 컨테이너를 순환하는 형태
 2. 컨테이너를 순환하며 클로저가 실행되지만 클로저가 따로 결과값을 반환하지 않는 형태. 대신 inout 매개변수를 사용하여 초기값에 직접 연산을 실행하게 됨
 */

var sum: Int = numbers.reduce(0) { (result: Int, next: Int) -> Int in
    return result + next
}
print(sum)

var subtract: Int = numbers.reduce(0) { $0 - $1 }
print(subtract)

var doubledNumbers2: [Int] = numbers.reduce(into: [1, 2, 3]) { (result: inout [Int], next: Int) in
    print("result: \(result) next: \(next)")
    guard next.isMultiple(of: 2) else {
        return
    }
    print("\(result) append \(next)")
    result.append(next * 2)
    print(result)
}
print(doubledNumbers2)
