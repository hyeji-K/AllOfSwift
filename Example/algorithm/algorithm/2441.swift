//
//  2441.swift
//  algorithm
//
//  Created by heyji on 2022/04/01.
//

// 백준 2441 - 별 찍기 4
let input = Int(readLine()!)!

for i in 1...input {
    var total: String = ""
    for j in 1...input {
        if j < i {
            total += " "
        } else {
            total += "*"
        }
    }
    print(total)
}
