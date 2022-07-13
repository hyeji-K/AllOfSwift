//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/12.
//

import Foundation

func solution(_ n:Int) -> String {
    var result: String = ""
    
    for i in 1...n {
        if i % 2 == 1 {
            result += "수"
        } else {
            result += "박"
        }
    }
    return result
}

print(solution(3))

func solution2(_ n:Int) -> String {
    return (1...n).map{ $0 % 2 == 1 ? "수" : "박" }.reduce("", +)
}

print(solution(3))
