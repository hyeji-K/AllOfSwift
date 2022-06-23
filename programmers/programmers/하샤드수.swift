//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/22.
//

import Foundation

func solution(_ x:Int) -> Bool {
    
    var arr: [Int] = []
    
    for char in String(x) {
        let value = Int(String(char))
        arr.append(value ?? 0)
    }
    
    let sum = arr.reduce(0) { $0 + $1 }
    return x % sum == 0 ? true : false
}

print(solution(10))
print(solution(12))
print(solution(11))
print(solution(13))
