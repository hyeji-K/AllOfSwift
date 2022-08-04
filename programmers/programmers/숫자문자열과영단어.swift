//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/08/01.
//

import Foundation

func solution(_ s: String) -> Int {
    let arr: [String] = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var str = ""
    var result: String = ""
    
    for (_, j) in s.enumerated() {
        if Int(String(j)) != nil {
            result += String(j)
        } else {
            str += String(j)
            if arr.contains(str) {
                let value = arr.firstIndex(of: str)!
                result += String(value)
                str = ""
            } else {
                continue
            }
        }
    }
    
    return Int(result)!
}

print(solution("one4seveneight"))

let str = "one4seveneight"
var ans = str.replacingOccurrences(of: "one", with: "1")
print(ans)


// 다른 사람의 풀이
func solution2(_ s:String) -> Int {
    let dic = [
        "zero": "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5",
        "six": "6", "seven": "7", "eight": "8", "nine": "9"
    ]
    var s = s
    for i in dic {
        s =  s.replacingOccurrences(of: i.key, with: i.value)
    }

    return Int(s)!
}
