//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/26.
//

import Foundation

func solution(_ s:String) -> String {
    
    let arr = s.components(separatedBy: " ")
    var result: String = String()
    
    for i in 0..<arr.count {
        for (j, str) in arr[i].enumerated() {
            if j % 2 == 0 {
                result += str.uppercased()
            } else {
                result += str.lowercased()
            }
        }
        result += " "
    }
    result.removeLast()
    return result
}

print(solution("try hello world"))

// 실패하는 이유: 공백의 갯수가 다르다고 함 허!
// 하나씩 arr에 저장하고 공백이 나오면 다시 0부터 시작인 걸로
// 소문자를 신경쓰지 않았음

func solution2(_ s:String) -> String {

    var arr: [String] = Array<String>()
    var result: String = String()
    var count: Int = 0

    for (_, str) in s.enumerated() {
        arr.append(String(str))
    }

    for i in 0..<arr.count {
        if arr[i] == " " {
            result += arr[i]
            count = 0
        } else {
            if count % 2 == 0 {
                result += arr[i].uppercased()
                count += 1
            } else {
                result += arr[i].lowercased()
                count += 1
            }
        }
    }

    return result
}
