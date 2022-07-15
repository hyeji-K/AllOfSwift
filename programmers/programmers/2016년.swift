//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/15.
//

import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    let day: [Int] = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let dayName: [String] = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    var month: Int = b
    var result: String = ""
    
    // 1월 1일은 금요일
//    day % 7 + 4 == 5
    for i in 0..<a-1 {
        month += day[i]
    }
    
    result = dayName[(month + 4) % 7]
    
    return result
}

print(solution(5, 24))

func solution2(_ a:Int, _ b:Int) -> String {
    let day: [Int] = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let dayName: [String] = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    let num = (day[0..<a-1].reduce(b) { $0 + $1 } + 4) % 7

    return dayName[num]
}

print(solution2(5, 24))


// 다른 사람의 풀이
func solution3(_ a:Int, _ b:Int) -> String {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd"
    let date = dateFormatterGet.date(from:"2016-\(a)-\(b)")
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US")
    dateFormatter.dateFormat = "E"
    
    return dateFormatter.string(from:date!).uppercased()
}

print(solution3(5, 24))
