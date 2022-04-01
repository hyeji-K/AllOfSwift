//
//  2445.swift
//  algorithm
//
//  Created by heyji on 2022/04/01.
//

// 백준 2445 - 별 찍기 8
let input = Int(readLine()!)!

for i in 1...(2 * input - 1) {
    var total: String = ""
    if i <= input {
        for j in 1...(2 * input) {
            if j <= i {
                total += "*"
            } else if j <= input+input - i {
                total += " "
            } else {
                total += "*"
            }
        }
    } else {
        for j in 1...(2 * input) {
            if j <= input+input - i {
                total += "*"
            } else if j > i {
                total += "*"
            } else {
                total += " "
            }
        }
    }
    print(total)
}
