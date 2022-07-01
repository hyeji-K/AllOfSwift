//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/30.
//

import Foundation

let keyboard = [["가", "나", "다", "라", "마"],
                ["가", "나", "다", "라", "마"],
                ["가", "나", "다", "라", "마"],
                ["가", "나", "다", "라", "마"],
                ["가", "나", "다", "라", "마"]]

//부스트캠프 ->

var x: Int = 9 // 1001
var n: String = ""
var arr: [Int] = []
while x > 0 {
    n += String(x % 2)
    x = x / 2
    print(n, x)
}
arr.append(Int(n) ?? 0)


func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer1: [String] = []
    var answer2: [String] = []
    var result: [String] = []
    var result2: [String] = []
    var num: String = ""
    
    for i in arr1 {
        var m = i
        while m > 0 {
            num += String(m % 2)
            m = m / 2
        }
        if num.count != n {
            for _ in 1...n - num.count {
                num += "0"
            }
        }
        print("arr1 : *\(num)*")
        answer1.append(String(num.reversed()))
        num = ""
    }
    for i in arr2 {
        var m = i
        while m > 0 {
            num += String(m % 2)
            m = m / 2
        }
        if num.count != n {
            for _ in 1...n - num.count {
                num += "0"
            }
        }
        print("arr2 : *\(num)*")
        answer2.append(String(num.reversed()))
        num = ""
    }
    
    for i in 0..<answer1.count {
        var value = String(Int(answer1[i])! + Int(answer2[i])!)
        if value.count != n {
            value = String(value.reversed())
            for _ in 1...n - value.count {
                value += "0"
            }
            value = String(value.reversed())
        }
        result.append(value)
        print(result)
    }
    
    for i in 0..<result.count {
        for (_, j) in result[i].enumerated() {
            if Int(String(j))! != 0 {
                num += "#"
            } else {
                num += " "
            }
        }
        result2.append(num)
        num = ""
    }
    
    return result2
}

print(solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))
print(solution(6, [46, 33, 33 ,22, 31, 50], [27 ,56, 19, 14, 14, 10]))

// 문자열 뒤집기
// 각 자리 수 더하기

func solution2(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var result: [String] = []
    var answer: [String] = []
    var num: String = ""
    
    for i in 0..<arr1.count {
        var value = String(Int(modifyArr(n, arr1)[i])! + Int(modifyArr(n, arr2)[i])!)
        if value.count != n {
            value = String(value.reversed())
            for _ in 1...n - value.count {
                value += "0"
            }
            value = String(value.reversed())
        }
        result.append(value)
    }
    
    for i in 0..<result.count {
        for (_, j) in result[i].enumerated() {
            if Int(String(j))! != 0 {
                num += "#"
            } else {
                num += " "
            }
        }
        answer.append(num)
        num = ""
    }
    
    
    return answer
}

func modifyArr(_ n:Int, _ arr: [Int]) -> [String] {
    var answer: [String] = []
    var num: String = ""
    
    for i in arr {
        var m = i
        while m > 0 {
            num += String(m % 2)
            m = m / 2
        }
        if num.count != n {
            for _ in 1...n - num.count {
                num += "0"
            }
        }
        answer.append(String(num.reversed()))
        num = ""
    }
    
    return answer
}

print(modifyArr(5, [9, 20, 28, 18, 11]))
