//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/26.
//

import Foundation

func solution(_ seoul:[String]) -> String {
    
    for i in 0..<seoul.count {
        if seoul[i] == "Kim" {
            return "김서방은 \(i)에 있다"
        }
    }
    return ""
}

print(solution(["Jane", "Kim"]))
