//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/19.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    return (0..<a.count).map { a[$0] * b[$0] }.reduce(0) { $0 + $1 }
}

// 다른 사람의 풀이

func solution2(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a, b).map(*).reduce(0, +)
}

// zip이란..?
