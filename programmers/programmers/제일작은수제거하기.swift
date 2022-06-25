//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/23.
//

import Foundation

func solution(_ arr:[Int]) -> [Int] {
    
    var result: [Int] = []
    let minValue: Int = arr.min()!
    print(minValue)
    
    for i in 0..<arr.count {
        if arr[i] == minValue {
            continue
        } else {
            result.append(arr[i])
        }
    }
    
    return result.isEmpty ? [-1] : result
}

print(solution([4,3,2,1]))
print(solution([10]))
print(solution([2,3,8,2,9]))


// 오버헤드로 인한 시간초과?
/*
 작은 수가 두 개 이상일때, index 때문에 발생한 시간초과 실패
 배열에서 제거한다는 생각 말고 작은 수를 제외한 값들을 새로운 배열에 추가한다고 생각
 */
