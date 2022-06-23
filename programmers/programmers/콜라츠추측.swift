//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/23.
//

import Foundation

func solution(_ num:Int) -> Int {
    var count: Int = 0
    var result: Int = num
    
    if num != 1 {
        while result != 1 {
            if result % 2 == 0 {
                result = result / 2
                count += 1
            } else if result % 2 == 1 {
                result = result * 3 + 1
                count += 1
            }
        }
        return count < 500 ? count : -1
    }
    return 0
}

print(solution(6))
print(solution(16))
print(solution(626331))

