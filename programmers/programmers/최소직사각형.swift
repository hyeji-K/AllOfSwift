//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/14.
//

import Foundation

func solution(_ sizes: [[Int]]) -> Int {
    
    var right: [Int] = []
    var left: [Int] = []
    
    for i in sizes {
        let j = i.sorted(by: >)
        left.append(j[0])
        right.append(j[1])
    }
    
    return left.max()! * right.max()!
}

print(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))


// 다른 사람의 풀이
func solution2(_ sizes: [[Int]]) -> Int {
    var a = 0
    var b = 0

    for array in sizes {
        let sortedArray = array.sorted()
        a = max(a, sortedArray.first ?? 0)
        b = max(b, sortedArray.last ?? 0)
    }
    return a * b
}


// 완전탐색 문제라고 함
