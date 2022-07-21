//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/20.
//

import Foundation

func solution(_ N: Int, _ stages: [Int]) -> [Int] {
    var total: Int = stages.count
    var resultDic: [Int: Double] = [:]
    var result: [Int] = []
    
    for i in 1...N {
        var fail: Double = 0
        var count: Int = 0
                for j in stages {
                    if j == i {
                        count += 1
                    }
                }
//        let count: Int = stages.filter { $0 == i }.count
        fail = Double(count) / Double(total)
        total -= count
        resultDic.updateValue(fail, forKey: i)
    }
    let sortedResult = resultDic.sorted { $0.0 < $1.0 }.sorted { $0.1 > $1.1 }
    print(sortedResult)

    for i in 0..<sortedResult.count {
        result.append(sortedResult[i].key)
    }
    
    
    return result
}

print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3]))

// 테스트케이스 5, 9 등이 시간초과로 실패했는데, 그래서 filter 부분을 for문으로 수정하니 성공함
