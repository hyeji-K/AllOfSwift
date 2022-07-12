//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/11.
//

import Foundation

func solution(_ s:String) -> String {
    
    return s.sorted(by: >).reduce("") { String($0) + String($1) }
}

print(solution("Zbcdefg"))


// 다른 사람의 풀이

func solution2(_ s:String) -> String {
    
    return String(s.sorted { $0 > $1 })
}

