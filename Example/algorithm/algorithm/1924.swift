//
//  1924.swift
//  algorithm
//
//  Created by heyji on 2022/04/01.
//

// 백준 1924 - 2007년
// 2007년 1월 1일 월요일
// 첫째 줄에 빈 칸을 사이에 두고 x(1 ≤ x ≤ 12)와 y(1 ≤ y ≤ 31)이 주어진다.
// 참고로 2007년에는 1, 3, 5, 7, 8, 10, 12월은 31일까지, 4, 6, 9, 11월은 30일까지, 2월은 28일까지 있다.

let input = readLine()?.split(separator: " ")
let array = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]

let month = Int(input?.first ?? "0")!
var day = Int(input?.last ?? "0")!

for i in 1..<month {
    switch i {
    case 1, 3, 5, 7, 8, 10, 12:
        day += 31
    case 4, 6, 9, 11:
        day += 30
    case 2:
        day += 28
    default:
        break
    }
}
print(array[day % 7])
