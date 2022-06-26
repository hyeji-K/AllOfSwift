//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/26.
//

import Foundation

func solution(_ n:Int, _ m:Int) -> [Int] {
    
    // 최대공약수(Greatest Common Divisor) - 두 수 중 작은 수에 도달할 때까지 i 값을 증가
    var gcd: Int = Int()
    var lcm: Int = Int()
    
    for i in 1...min(n, m) {
        if n % i == 0 && m % i == 0 {
            gcd = i
        }
    }

    
    // 최소공배수(Least Common Multiple) - (n / gcd) * (m / gcd) * gcd
    lcm = n * m / gcd
    
    return [gcd, lcm]
}

print(solution(60, 24))
print(solution(3, 12))
print(solution(2, 5))
