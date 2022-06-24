//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/23.
//

import Foundation

func solution(_ arr:[Int]) -> [Int] {
    
    var result: [Int] = arr
    
    if arr.count > 1 {
        for i in 0..<arr.count {
            if result[i] == arr.min()! {
                result.remove(at: i)
                break
            } else {
                continue
            }
        }
        return result
    }
    
    return [-1]
}

print(solution([4,3,2,1]))
print(solution([10]))
