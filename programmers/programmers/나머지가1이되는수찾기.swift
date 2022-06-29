//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/29.
//

import Foundation

func solution(_ n:Int) -> Int {
    
    for i in 1...n {
        if n % i == 1 {
            return i
        }
    }
    return 0
}

print(solution(10))
print(solution(12))
