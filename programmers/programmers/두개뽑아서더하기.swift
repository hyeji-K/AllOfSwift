//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/16.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var arr: [Int] = []
    for i in 0..<numbers.count {
        for j in 0..<numbers.count {
            if i != j {
                let value = numbers[i] + numbers[j]
                arr.append(value)
            }
        }
    }

    return Set(arr).sorted()
}

print(solution([2,1,3,4,1]))


// 다른 사람의 풀이
func solution2(_ numbers:[Int]) -> [Int] {
    var result = [Int]()

    for i in 0 ..< numbers.count {
        for j in i + 1 ..< numbers.count {
            let num = numbers[i] + numbers[j]
            if !result.contains(num) {
                result.append(num)
            }
        }
    }
    return result.sorted()
}
