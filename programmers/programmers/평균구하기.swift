//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/21.
//

import Foundation

func solution(_ arr:[Int]) -> Double {
    
    let sum = arr.reduce(0) { $0 + $1 }
    let average = Double(sum) / Double(arr.count)
    return average
}

print(solution([1,2,3,4]))
print(solution([5,5]))
