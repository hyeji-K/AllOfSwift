//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/16.
//

import Foundation

func solution(_ n: Int) -> Int {
    var num: Int = n
    var value: [Int] = []
    var result: Int = 0
    
    while num != 0 {
        value.append(num % 3)
        num = num / 3
    }
    
    value = value.reversed()
    
    for i in 0..<value.count {
        result += value[i] * Int(pow(3, Double(i)))
    }
    
    return result
}

print(solution(45))


// 다른 사람의 풀이
func solution2(_ n: Int) -> Int {
    let flipToThree = String(n, radix: 3)
    let answer = Int(String(flipToThree.reversed()), radix:3)!
    return answer
    
}

print(solution2(45))
