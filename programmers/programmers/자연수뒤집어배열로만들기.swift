//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/26.
//

import Foundation

func solution(_ n:Int64) -> [Int] {
    
    var arr: [Int] = []

    for (_, i) in String(n).enumerated() {
        arr.append(Int(String(i)) ?? 0)
    }
    arr.reverse()
    return arr
}

func solution2(_ n:Int64) -> [Int] {
    var arr: [Int] = []
    
    for i in String(n).reversed() {
        arr.append(Int(String(i)) ?? 0)
    }
    
    return arr
}

print(solution(12345))

/*
 reverse(), reversed() 차이?
 */
