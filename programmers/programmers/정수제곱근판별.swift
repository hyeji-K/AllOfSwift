//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/25.
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    
    let result = Int64(Double(n).squareRoot())
    
    if n == result * result {
        return (result + 1) * (result + 1)
    }
    
    return -1
}

print(solution(121))
print(solution(3))

/*
 import Foundation 없이 풀려면 제곱근 -> squareRoot()
 import Foundation 하고 풀려면 제곱근 -> sqrt() => Double, Float 만 가능
                            제곱 -> pow(value, count)
 ex)
 var i: Int64 = 3

 var doi: Double = Double(i)

 print(Int64(sqrt(doi)))
 print(doi.squareRoot())
 print(pow(12, 2))
 */
