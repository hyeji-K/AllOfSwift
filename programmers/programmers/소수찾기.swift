//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/13.
//

import Foundation

// 시간초과 및 효율성을 다루지 못한 문제

func solution(_ n:Int) -> Int {
    
    var arr = (1...n).map { $0 }
    
    
    var num: Int = 0
    var result: Int = 0
    
    for i in arr {
        print(i)
        for j in 1..<n {
            if i % j == 0 {
                num += 1
                if num > 2 {
                    break
                }
            }
        }
        if num == 2 {
            arr = arr.filter { $0 % i != 0 }
            result += 1
        }
        num = 0
    }
    
    return result
}

print(solution(10))
