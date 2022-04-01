//
//  2440.swift
//  algorithm
//
//  Created by heyji on 2022/04/01.
//

// 백준 2440 - 별 찍기 3
let input = Int(readLine()!)!

for i in 1...input {
    for _ in 0...input - i {
        print("*", terminator: "")
    }
    print("")
}
