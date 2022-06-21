//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/18.
//

import Foundation


func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    var resultArr: [[Int]] = []
    var arr: [Int] = []
    
    for i in 0..<arr1.count {
        for j in 0..<arr1[i].count {
            let value = arr1[i][j] + arr2[i][j]
            arr.append(value)
        }
        resultArr.append(arr)
        arr.removeAll()
    }
    return resultArr
}

print(solution([[1,2], [2,3]], [[3,4], [5,6]]))
print(solution([[1],[2]], [[3],[4]]))
