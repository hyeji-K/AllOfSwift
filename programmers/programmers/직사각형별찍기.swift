//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/18.
//

import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

for _ in 0..<b {
    for _ in 0..<a {
        print("*", terminator: "")
    }
    print("")
}
