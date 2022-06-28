//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/27.
//

import Foundation

// 아스키코드 Int(UnicodeScalar(ch)!.value) String(UnicodeScalar(65)!)
// 26으로 나눠서 나머지에 대해서
// 어떻게 풀건지 다 생각해놓고 이를 코드로 옮기지 못했음

func solution(_ s:String, _ n:Int) -> String {
    
    var arr: [String] = Array<String>()
    var result: String = String()
    
    for (_, str) in s.enumerated() {
        arr.append(String(str))
    }
    
    for i in 0..<arr.count {
        if arr[i] != " " {
            var value = UnicodeScalar(arr[i])!.value

            if value >= 65 && value <= 90 {
                value = (value + UInt32(n) - 65) % 26 + 65 // 65 ~ 90
            } else {
                value = (value + UInt32(n) - 97) % 26 + 97 // 97 ~ 122
            }
            result += String(UnicodeScalar(value)!)
        } else {
            result += arr[i]
        }
    }
    return result
}

print(solution("ABZ", 1))
print(solution("a B z", 4))

