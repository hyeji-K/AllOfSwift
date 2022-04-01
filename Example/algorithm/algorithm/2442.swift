//
//  2442.swift
//  algorithm
//
//  Created by heyji on 2022/04/01.
//


// 백준 2442 - 별 찍기 5
let input = Int(readLine()!)!

for i in 1...input {
    var total: String = ""
    for j in 1..<input + i {
        if j <= input - i {
            total += " "
        } else {
            total += "*"
        }
    }
    print(total)
}
