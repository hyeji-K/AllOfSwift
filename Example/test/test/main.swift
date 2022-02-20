//
//  main.swift
//  test
//
//  Created by heyji on 2022/02/19.
//

import Foundation

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



let inputA = readLine()
let inputB = readLine()

if let A = Int(inputA ?? "0"),
   let B = Int(inputB ?? "0") {
    print(A + B)
}
