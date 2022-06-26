//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/26.
//

import Foundation

func solution(_ n:Int) -> Int {
    var answer: Int = n
    var result: [Int] = []
    var value: Int = Int()
    
    while answer >= 10 {
        value = answer % 10
        answer = answer / 10
        result.append(value)
    }
    result.append(answer)

    // [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
    print(result)
    
    return result.reduce(0) { $0 + $1 }
}

func solution2(_ n:Int) -> Int {
    
    var result: Int = Int()
    
    for (_, num) in String(n).enumerated() {
        result += Int(String(num)) ?? 0
    }
    
    return result
}

print(solution2(123))
print(solution2(978))
