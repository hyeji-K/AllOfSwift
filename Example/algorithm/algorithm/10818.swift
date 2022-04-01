//
//  10818.swift
//  algorithm
//
//  Created by heyji on 2022/04/01.
//

// 백준 10818 - 최대 최소
let input = Int(readLine()!)!
let numArray = (readLine()?.split(separator: " ").map { Int($0)! })!

var min: Int = numArray[0]
var max: Int = numArray[0]

for i in 0..<input {
   if min > numArray[i] {
       min = numArray[i]
   }
   if max < numArray[i] {
       max = numArray[i]
   }
}
print(min, max)



//let num = numArray.sorted()
//print(num.first!, num.last!)
//print(numArray.min()!, numArray.max()!)
