//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/18.
//

import Foundation

func solution(_ answers: [Int]) -> [Int] {
    let arr1: [Int] = [1, 2, 3, 4, 5]
    let arr2: [Int] = [2, 1, 2, 3, 2, 4, 2, 5]
    let arr3: [Int] = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    var count1: Int = 0
    var count2: Int = 0
    var count3: Int = 0
    var resultArr: [Int] = []
    var result: [Int] = []
    
    for i in 0..<answers.count {
        let j = i % 5
        if answers[i] == arr1[j] {
            count1 += 1
        }
    }
    resultArr.append(count1)
    
    for i in 0..<answers.count {
        let j = i % 8
        if answers[i] == arr2[j] {
            count2 += 1
        }
    }
    resultArr.append(count2)
    
    
    for i in 0..<answers.count {
        let j = i % 10
        if answers[i] == arr3[j] {
            count3 += 1
        }
    }
    resultArr.append(count3)
    
    let max = resultArr.max()!
    if max == count1 {
        result.append(1)
    }
    if max == count2 {
        result.append(2)
    }
    if max == count3 {
        result.append(3)
    }

       
    return result.sorted()
}

print(solution([1, 3, 2, 4, 2]))


func countNum(_ answers: [Int], _ arr: [Int]) -> Int{
    var count: Int = 0
    for i in 0..<answers.count {
        let j = i % arr.count
        if answers[i] == arr[j] {
            count += 1
        }
    }
    return count
}



func solution2(_ answers: [Int]) -> [Int] {
    let arr1: [Int] = [1, 2, 3, 4, 5]
    let arr2: [Int] = [2, 1, 2, 3, 2, 4, 2, 5]
    let arr3: [Int] = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    var resultArr: [Int] = []
    var result: [Int] = []

    resultArr.append(countNum(answers, arr1))
    resultArr.append(countNum(answers, arr2))
    resultArr.append(countNum(answers, arr3))

    let max = resultArr.max()!
    if max == resultArr[0] {
        result.append(1)
    }
    if max == resultArr[1] {
        result.append(2)
    }
    if max == resultArr[2] {
        result.append(3)
    }

    return result.sorted()
}


// 다른 사람의 풀이
func solution3(_ answers:[Int]) -> [Int] {
    let answer = (
        a: [1, 2, 3, 4, 5], // index % 5
        b: [2, 1, 2, 3, 2, 4, 2, 5], // index % 8
        c: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // index % 10
    )
    var point = [1:0, 2:0, 3:0]

    for (i, v) in answers.enumerated() {
        if v == answer.a[i % 5] { point[1] = point[1]! + 1 }
        if v == answer.b[i % 8] { point[2] = point[2]! + 1 }
        if v == answer.c[i % 10] { point[3] = point[3]! + 1 }
    }

    return point.sorted{ $0.key < $1.key }.filter{ $0.value == point.values.max() }.map{ $0.key }
}
