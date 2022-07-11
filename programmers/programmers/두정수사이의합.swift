//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/11.
//

import Foundation

func solution(_ a:Int, _ b:Int) -> Int64 {
    
    return a > b ? Int64((b...a).reduce(0) { $0 + $1 }) : Int64((a...b).reduce(0) { $0 + $1 })
}

print(solution(3, 3))
print(solution(5, 3))


// 등차수열 합 공식
// 두 항 a, b 가 주어졌을 때 합을 구하는 방식 => (a + b) * n / 2
func solution2(_ a:Int, _ b:Int) -> Int64 {
    return Int64(a + b) * Int64(max(a, b) - min(a, b) + 1) / Int64(2)
}

print(solution(5, 3))
