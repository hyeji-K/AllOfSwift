//
//  2438.swift
//  algorithm
//
//  Created by heyji on 2022/04/01.
//

// 백준 2438 - 별찍기
let input = Int(readLine()!)!
for i in 1...input {
    for _ in 1...i {
        print("*", terminator: "")
    }
    print("")
}
