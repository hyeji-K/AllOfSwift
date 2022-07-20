//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/20.
//

import Foundation

func solution(_ left: Int, _ right: Int) -> Int {
    
    var result: Int = 0
    
    for i in left...right {
        var count: Int = 0
        for j in 1...i {
            if i % j == 0 {
                count += 1
            }
        }
        if count % 2 == 0 {
            result += i
        } else {
            result -= i
        }
    }
    
    return result
}

print(solution(13, 17))


// 다른 사람의 풀이
func solution2(_ left: Int, _ right: Int) -> Int {
    return (left...right).map { i in (1...i).filter { i % $0 == 0 }.count % 2 == 0 ? i : -i }.reduce(0, +)
}
