//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/08/08.
//

import Foundation

func solution(_ new_id: String) -> String {
    
    let str: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "n", "m", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    let number: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    
    // 아이디의 길이는 3자 이상 15자 이하여야 합니다.
//    guard new_id.count >= 3 && new_id.count <= 15 else { return "" }

//    1단계 new_id의 모든 대문자를 대응되는 소문자로 치환합니다.
    var result: String = new_id
    result = new_id.lowercased()
//    print(oneStep)
//    2단계 new_id에서 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)를 제외한 모든 문자를 제거합니다.
    var twoStep: String = String()
    for (_, i) in result.enumerated() {
        switch String(i) {
        case "-":
            twoStep += String(i)
        case "_":
            twoStep += String(i)
        case ".":
            twoStep += String(i)
        default:
            if str.contains(String(i)) || number.contains(String(i)) {
                twoStep += String(i)
            } else {
                continue
            }
        }
    }
    result = twoStep
    print(twoStep)
//    3단계 new_id에서 마침표(.)가 2번 이상 연속된 부분을 하나의 마침표(.)로 치환합니다.
    var threeStep: String = String()
    var example: [String] = Array()
    for (i, j) in twoStep.enumerated() {
        example.append(String(j))
        if i == 0 {
            threeStep += String(j)
        } else if i > 0 {
            if String(j) == "." && example[i-1] == "." {
                continue
            } else {
                threeStep += String(j)
            }
        }
    }
    result = threeStep
    print(threeStep)
//    4단계 new_id에서 마침표(.)가 처음이나 끝에 위치한다면 제거합니다.
    if example.first == "." {
        threeStep.removeFirst()
    } else if example.last == "." {
        threeStep.removeLast()
    }
    result = threeStep
    print(threeStep)
    print("result \(result)")
//    5단계 new_id가 빈 문자열이라면, new_id에 "a"를 대입합니다.
    if result == "" {
        result += "a"
    }
//    6단계 new_id의 길이가 16자 이상이면, new_id의 첫 15개의 문자를 제외한 나머지 문자들을 모두 제거합니다.
//         만약 제거 후 마침표(.)가 new_id의 끝에 위치한다면 끝에 위치한 마침표(.) 문자를 제거합니다.
    var sixStep: String = String()
    for (i, j) in result.enumerated() {
        if i < 14 {
            sixStep += String(j)
        } else if i == 14 {
            if String(j) != "." {
                sixStep += String(j)
            } else {
                continue
            }
        }
    }
    result = sixStep
    print(sixStep)
//    7단계 new_id의 길이가 2자 이하라면, new_id의 마지막 문자를 new_id의 길이가 3이 될 때까지 반복해서 끝에 붙입니다.
//    if result.count <= 2 {
//        result += String(result.last!)
//    }
    
    while result.count <= 2 {
        result += String(result.last!)
    }
    return result
}

print(solution("...!@BaT#*..y.abcdefghijklm"))
print(solution("z-+.^."))
print(solution("=.="))
print(solution("123_.def"))
print(solution("abcdefghijklmn.p"))


