//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/21.
//

import Foundation

func solution(_ phone_number: String) -> String {
    
    var newNumber: String = ""

    if phone_number.count > 4 {
        let num = phone_number.count - 4

        for _ in 1...num {
            newNumber += "*"
        }
        newNumber += phone_number.suffix(4)

        return newNumber
    }
    
    return phone_number
}

print(solution("01033334444"))
print(solution("027778888"))
print(solution("2222"))
