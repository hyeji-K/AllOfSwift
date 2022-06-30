//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/29.
//

import Foundation

func solution(_ price: Int, _ money: Int, _ count: Int) -> Int64 {
    var answer: Int64 = 0
    
    for n in 1...count {
        answer += Int64(price * n)
    }
    if answer - Int64(money) > 0 {
        return answer - Int64(money)
    }
    return 0
}

print(solution(3, 20, 4))


// 다른 사람 풀이
func solution2(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let totalPrice = price * (count * (count+1)/2)

    if money >= totalPrice {
        return 0
    }

    return Int64(totalPrice - money)
}
