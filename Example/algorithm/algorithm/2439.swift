//
//  2439.swift
//  algorithm
//
//  Created by heyji on 2022/04/01.
//

// 백준 2439 - 별 찍기 2
let input = Int(readLine()!)!

for i in 1...input {
    var total: String = ""
    for j in 1...input {
        if j <= input - i {
            total += " "
        } else {
            total += "*"
        }
    }
    print(total)
}


//let input = Int(readLine()!)!
//for i in 1...input {
//    if input != i {
//        for _ in 1...input - i {
//            print(" ", terminator: "")
//        }
//    }
//    for _ in 1...i {
//        print("*", terminator: "")
//    }
//    print("")
//}
