//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/18.
//

import Foundation

func solution(_ x:Int, _ n:Int) -> [Int64] {
    
    var array: [Int64] = []
    var xNum: Int64 = 0
    for _ in 1...n {
        xNum += Int64(x)
        array.append(xNum)
    }
    return array
}

print(solution(2, 5))

print(solution(4, 3))

print(solution(-4, 2))
