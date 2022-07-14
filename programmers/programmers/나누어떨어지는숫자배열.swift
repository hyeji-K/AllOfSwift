//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/14.
//

import Foundation

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    
    let result = arr.filter { $0 % divisor == 0 }.sorted()
    
    return result != [] ? result : [-1]
}

print(solution([5, 9, 7, 10], 5))
