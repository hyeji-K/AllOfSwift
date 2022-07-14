//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/14.
//

import Foundation

func solution(_ dartResult:String) -> Int {
    
    let arr = dartResult.map { $0 }
    var arr2: [Int] = []
    
    var result: Int = 0
    print(arr)
    
    for i in 0..<arr.count {
        
        if arr[i].isNumber == true {
            continue
        } else if arr[i] == "S" || arr[i] == "D" || arr[i] == "T" {
            if arr[i] == "S" {
                if i > 1 {
                    if arr[i - 2].isNumber == true {
                        result += 10
                    }
                }
                result += Int(String(arr[i - 1]))!
            } else if arr[i] == "D" {
                if i > 1 {
                    if arr[i - 2].isNumber == true {
                        result += 10 * 10                    }
                }
                result += Int(String(arr[i - 1]))! * Int(String(arr[i - 1]))!
            } else {
                if i > 1 {
                    if arr[i - 2].isNumber == true {
                        result += 10 * 10 * 10
                    }
                }
                result += Int(String(arr[i - 1]))! * Int(String(arr[i - 1]))! * Int(String(arr[i - 1]))!
            }
            arr2.append(result)
        } else {
            if arr[i] == "*" {
                if arr2.count == 1 {
                    result = arr2[0] * 2
                    arr2.removeLast()
                    arr2.append(result)
                } else if arr2.count == 2 {
                    result = arr2[1] * 2
                    arr2.removeLast()
                    arr2.append(result)
                    result = 0
                    result = arr2[0] * 2
                    arr2.removeFirst()
                    arr2.insert(result, at: 0)
                } else {
                    result = arr2[2] * 2
                    arr2.removeLast()
                    arr2.append(result)
                    result = 0
                    result = arr2[1] * 2
                    arr2.remove(at: 1)
                    arr2.insert(result, at: 1)
                }
            } else {
                result = arr2[arr2.index(before: arr2.endIndex)] * (-1)
                arr2.removeLast()
                arr2.append(result)
            }
        }
        result = 0
    }
    print(arr2)
    return arr2.reduce(0) { $0 + $1 }
}

print("1 \(solution("1S2D*3T"))")
print("2 \(solution("1D2S#10S"))")
print("3 \(solution("1D2S0T"))")
print("4 \(solution("1S*2T*3S"))")
print("5 \(solution("1D#2S*3S"))")
print("6 \(solution("1T2D3D#"))")
print("7 \(solution("1D2S3T*"))")



// 10D*10S*10T*
// 5 - > 2 -> 0


// 다른 사람의 풀이
func solution2(_ dartResult:String) -> Int {

    let numberList = dartResult.split(whereSeparator: {$0.isLetter || $0 == "#" || $0 == "*"})
    
    let letterList = dartResult.split(whereSeparator: {$0.isNumber})

    var totalScore = 0

    for (i, (number, letter)) in zip(numberList, letterList).enumerated() {
        var score = 0
        if let number = Int(number) {
            score = letter.contains("D") ? number * number : letter.contains("T") ? number * number * number : number

        }

        if letter.contains("*") {
            score *= 2
        } else if letter.contains("#") {
            score = -score
        }

        if i != 2 {
            if letterList[i + 1].contains("*") {
                score *= 2
            }
        }

        totalScore += score

    }


    return totalScore
}

print("1 \(solution2("1S2D*3T"))")


func solution3(_ dartResult:String) -> Int {
    var index = dartResult.startIndex
    var prevIndex = index
    var nums = [Int]()
    
    while index < dartResult.endIndex {
        switch dartResult[index] {
        case "S":
            if let v = Int(dartResult[prevIndex..<index]) {
                nums.append(v)
            }
            prevIndex = dartResult.index(after: index)
        case "D":
            if let v = Int(dartResult[prevIndex..<index]) {
                nums.append(v * v)
            }
            prevIndex = dartResult.index(after: index)
        case "T":
            if let v = Int(dartResult[prevIndex..<index]) {
                nums.append(v * v * v)
            }
            prevIndex = dartResult.index(after: index)
        case "*":
            nums[nums.count-1] = nums[nums.count-1] * 2
            if nums.count >= 2 {
                let l2 = nums[nums.count-2]
                nums[nums.count-2] = l2 * 2
            }
            prevIndex = dartResult.index(after: index)
        case "#":
            nums[nums.count-1] = nums[nums.count-1] * -1
            prevIndex = dartResult.index(after: index)
        default: break
        }
        index = dartResult.index(after: index)
    }

    return nums.reduce(0, + )
}
