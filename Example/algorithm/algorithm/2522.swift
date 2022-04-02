//
//  2522.swift
//  algorithm
//
//  Created by heyji on 2022/04/02.
//

// 백준 2522 - 별 찍기 12
//let input = Int(readLine()!)!
//
//for i in 1...(2 * input - 1) {
//    var total: String = ""
//    if i <= input {
//        for j in 1...input {
//            if j <= input - i {
//                total += " "
//            } else {
//                total += "*"
//            }
//        }
//    } else {
//        for j in 1...input {
//            if j <= i - input {
//                total += " "
//            } else {
//                total += "*"
//            }
//        }
//    }
//    print(total)
//}


let input = Int(readLine()!)!

for i in 1 ... (2 * input - 1) {
    if i <= input {
        print(String(repeating: " ", count: input - i) + String(repeating: "*", count: i))
    } else {
        print(String(repeating: " ", count: i - input) + String(repeating: "*", count: 2 * input - i))
    }
}
