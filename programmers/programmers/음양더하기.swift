//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/18.
//

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    
    var result: Int = 0
    
    for i in 0..<absolutes.count {
        if signs[i] == true {
            result += absolutes[i]
        } else {
            result += absolutes[i] * (-1)
        }
    }
    
    return result
}

print(solution([4,7,12], [true,false,true]))

// 다른 사람의 풀이
func solution2(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return (0..<absolutes.count).map { signs[$0] ? absolutes[$0] : -absolutes[$0] }.reduce(0, +)
}

func solution3(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    zip(absolutes, signs)
        .map { $1 ? $0 : -$0 }
        .reduce(0, +)
}
