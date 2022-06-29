//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/28.
//

import Foundation

func solution(_ s:String) -> Bool {
    
    if s.count == 4 || s.count == 6 {
        if Int(s) != nil {
            return true
        }
    }
    return false
}

print(solution("a234"))
print(solution("1234"))
