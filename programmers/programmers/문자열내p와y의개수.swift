//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/14.
//

import Foundation

func solution(_ s: String) -> Bool {
    var ans: Bool = false
    
    let pNum = s.filter { $0 == "p" || $0 == "P" }.count
    let yNum = s.filter { $0 == "y" || $0 == "Y" }.count

    print(s.components(separatedBy: "p").count)
    
    return pNum == yNum ? !ans : ans
}

print(solution("pPoooyY"))


func solution2(_ s:String) -> Bool {
    let string = s.lowercased()
    return string.components(separatedBy: "p").count == string.components(separatedBy: "y").count
}
