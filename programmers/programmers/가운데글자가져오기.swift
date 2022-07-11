//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/11.
//

import Foundation

func solution(_ s:String) -> String {

    let arr: [String] = s.map { String($0) }
    
    let num: Int = Int((arr.count-1) / 2)
    
    if arr.count % 2 == 0 {
        return arr[num] + arr[num+1]
    }
    
    return arr[num]
}

print(solution("abcde"))
print(solution("qwer"))
print(solution("c"))


func solution2(_ s:String) -> String {

    if Array(s).count % 2 == 0 {
        return String(Array(s)[(s.count/2)-1...(s.count/2)])
    } else {
        return String(Array(s)[s.count/2])
    }
}

print(solution2("abcde"))
