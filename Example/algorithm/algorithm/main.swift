//
//  main.swift
//  algorithm
//
//  Created by heyji on 2022/04/01.
//

//import Darwin

//let input = readLine()
//
//print(input)

// 여러 숫자를 입력할 때
//let input = readLine()?.components(separatedBy: " ")
//
//print(input)

// 두 개의 숫자를 받을 때
//let input = readLine()?.components(separatedBy: " ")
//
////if let a = input?.first,
////   let b = input?.last,
////   let numA = Int(a),
////   let numB = Int(b) {
////    print(numA + numB)
////}
//
//if let a = Int(input?.first ?? "0"),
//    let b = Int(input?.last ?? "0") {
//        print(a + b)
//}

// 여러 줄에 여러 값 입력 받기
//let inputA = readLine()
//let inputB = readLine()
//
//if let numA = Int(inputA ?? "0"),
//   let numB = Int(inputB ?? "0") {
//    print(numA + numB)
//}

//let input = readLine()?.components(separatedBy: " ").map({ Int($0) })



//let inputA = readLine()
//let inputB = readLine()
//
//if let A = Int(inputA ?? "0"),
//   let B = Int(inputB ?? "0") {
//    print(A + B)
//}

//let input = Int(readLine()!)!

//let value = input ?? "0"  // -> String
//let value2 = Int(value)  // -> 옵셔널 Int
//let value3 = Int(value2 ?? 0) // -> Int
//print(value3)

//for _ in 1...input {
//    let inputNum = (readLine()?.components(separatedBy: " ").map { Int($0)! })!
//    print(inputNum[0] + inputNum[1])
//}

//let input = (readLine()?.components(separatedBy: " ").map { Int($0)! })!

//while let input = readLine() {
//    let inputNum = input.components(separatedBy: " ").map { Int($0)! }
////    print(inputNum)
//    print(inputNum[0] + inputNum[1])
//}


//while let input = readLine() {
//    let inputNum = input.components(separatedBy: " ").map { Int($0)! }
//    print(inputNum)
//    if inputNum[0] != 0 && inputNum[1] != 0 {
//        print(inputNum[0] + inputNum[1])
//    } else {
//        break
//    }
//}

//let input = Int(readLine()!)!
//
//for i in 1...input {
//    let inputNum = (readLine()?.components(separatedBy: " ").map { Int($0)! })!
//    print("Case #\(i): \(inputNum[0]) + \(inputNum[1]) = \(inputNum[0] + inputNum[1])")
//}



//while let input = readLine() {
//    print(input)
//}


//let input = Int(readLine()!)!
//let inputNum = readLine()!

//let num = inputNum.map { Int(String($0))! }
//var value = 0
//for i in 0..<input {
//    value += num[i]
//}
//print(value)


//let value = inputNum.reduce(0) { $0+Int(String($1))! }
//print(value)

//let input = Int(readLine()!)!
//
//for i in 1...input {
//    var star = ""
//    for _ in 1...i {
//        star += "*"
//    }
//    print(star)
//}

//import Foundation
//
//let inputNumber = readLine()?.components(separatedBy: " ")
//let inputInt = Int(inputNumber?.first ?? "0")!
//let inputIntTwo = Int(inputNumber?.last ?? "0")!
//let input = readLine()?.split(separator: " ")
//let first = Int(input?.first ?? "0")!
//let second = Int(input?.last ?? "0")!
//print(inputInt + inputIntTwo)
//print(first + second)
//print(type(of: inputNumber))
//print(type(of: input))


//let inputT = Int(readLine()!)!
//
//for _ in 1...inputT {
//    let inputNum = readLine()?.split(separator: " ")
//    let a = Int(inputNum?.first ?? "0")!
//    let b = Int(inputNum?.last ?? "0")!
//    print(a + b)
//}


//let input = Int(readLine()!)!
//
//for _ in 1...input {
//    let inputNum = (readLine()?.split(separator: " ").map { Int($0)! })!
//    print(inputNum[0] + inputNum[1])
//}

//while let input = readLine() {
//    let inputNumber = input.split(separator: " ").map { Int($0)! }
//    if inputNumber[0] != 0 && inputNumber[1] != 0 {
//        print(inputNumber[0] + inputNumber[1])
//    } else {
//        break
//    }
//}

//let input = Int(readLine()!)!
//let inputNum = readLine()!
//print(type(of: inputNum))
//let num = inputNum.map { Int(String($0))! }
//var value: Int = 0
//for i in 0..<input {
//    value += num[i]
//}
//print(value)


//let inputNum = readLine()!
//print(type(of: inputNum))
//let num = inputNum.map { $0 }
//print(num)
//print(type(of: num))

//let input = readLine()!
//print(input.count)
//let cut = input.map { String($0) }
//var name = ""
//for i in 0..<input.count {
//    if i < 10 {
//        name += cut[i]
//    }
//    print(name)
//}

//let input = readLine()!
//var length = 0
//var temString = ""
//var sList: [String] = []
//
//for char in input {
//    temString.append(char)
//    length += 1
//    if length == 10 {
//        sList.append(temString)
//        temString = ""
//        length = 0
//    }
//}
//
//if !temString.isEmpty {
//    sList.append(temString)
//}
//
//print(sList.joined(separator: "\n"))


//let input = readLine()!.map { String($0) }
//
//for i in 0..<input.count {
//    if i % 10 == 9 {
//        print(input[i])
//    }
//    else {
//        print(input[i], terminator: "")
//    }
//}

//let input = Int(readLine()!)!
//
//for i in 0..<input {
//    print(input - i)
//}

//let input = Int(readLine()!)!
//
//for i in 1...9 {
//    print("\(input) * \(i) = \(input * i)")
//}


