//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/24.
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    
    var arr: [String] = []
    var result: String = ""
    
    for (n, i) in String(n).enumerated() {
        print("\(n): \(i)")
        arr.append(String(i))
    }
    arr.sort(by: >)
    
    for i in arr {
        result += i
    }
    
    return Int64(result) ?? 0
}

print(solution(118372))
