//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/19.
//

import Foundation

func solution(_ d: [Int], _ budget: Int) -> Int {
    
    var result: Int = 0
    var sum: Int = 0
    
    if d.reduce(0, { $0 + $1 }) <= budget {
        return d.count
    } else {
        for i in d.sorted() {
            sum += i
            if sum <= budget {
                result += 1
            } else {
                break
            }
        }
    }
    
    return result
}

print(solution([1,3,2,5,4], 9))
