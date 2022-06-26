//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/26.
//

import Foundation

func solution(_ n:Int) -> Int {
    
    var result: Int = Int()
    
    if n > 0 {
        for i in 1...n {
            if n % i == 0 {
                result += i
            }
        }
        return result
    }
    return 0
}

print(solution(12))
print(solution(5))
