//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/17.
//

import Foundation

func solution(_ numbers:[Int]) -> Int {
    let arr: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    var result: Int = 0
    
    result = Set(arr).subtracting(numbers).reduce(0) { $0 + $1 }
    
    
    return result
}

print(solution([1,2,3,4,6,7,8,0]))


// 다른 사람의 풀이
func solution2(_ numbers: [Int]) -> Int {
    return (0...9).filter { !numbers.contains($0) }.reduce(0, +)
}


func solution3(_ numbers:[Int]) -> Int {
    return 45-numbers.reduce(0, +)
}
