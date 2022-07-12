//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/12.
//

import Foundation

// 풀지 못한 문제

func solution(_ strings:[String], _ n:Int) -> [String] {
    
    var arr: [String] = []
    var arr2: [String] = []
    
    for i in strings {
        arr.append(String(Array(i)[n]))
    }
    
    arr = arr.sorted()
    
    for i in 0..<strings.count {
        for j in 0..<strings.count {
            if arr[i] == String(Array(strings[j])[n]) {
//                String(Array(strings[j])[n]).sorted(by: >)
                arr2.append(strings[j])
                break
            }
        }
    }
    
    return arr2
}

print(solution(["sun", "bed", "car"], 1))


// 다른 사람 풀이
 
func solution2(_ strings:[String], _ n:Int) -> [String] {
    let index = strings[0].index(strings[0].startIndex, offsetBy: n)
 
    let result = strings.sorted(by : { (s1 : String, s2 : String) -> Bool in
        if s1[index] == s2[index] {
            return s1 < s2
        }
        else {
            return s1[index] < s2[index]
        }
    })
 
    return result
}

print(solution2(["sun", "bed", "car"], 1))


func solution3(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted{  Array($0)[n] == Array($1)[n] ? $0 < $1 :  Array($0)[n] < Array($1)[n] }
}
