//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/17.
//

import Foundation

func solution(_ array: [Int], _ commands: [[Int]]) -> [Int] {
    
    var result: [Int] = []
    
    for i in commands {
        let arr = array[i[0]-1...i[1]-1].sorted()
        result.append(arr[i[2]-1])
    }
    
    return result
}

print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))


// map을 사용해서 한 줄로
func solution2(_ array: [Int], _ commands: [[Int]]) -> [Int] {
    
    return commands.map { array[($0[0]-1)...($0[1]-1)].sorted()[$0[2]-1] }
}
