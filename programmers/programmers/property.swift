//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/15.
//

import Foundation

struct CoordinatePoint {
    var x: Int
    var y: Int
    
    // 대칭 좌표
    var oppositePoint: CoordinatePoint {
        // 접근자
        get {
            print("아님 여기?")
            return CoordinatePoint(x: -x, y: -y)
        }
        
        // 설정자
        set(opposite) {
            print("여기일까?")
            x = -opposite.x
            y = -opposite.y
            print("오잉")
        }
    }
}

var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)
// 현재 좌표
print(yagomPosition)
print(yagomPosition.x)
// 대칭 좌표
print(yagomPosition.oppositePoint)
yagomPosition.x = 14
print(yagomPosition)
//// 대칭 좌표를 (15, 10)으로 설정하면
yagomPosition.oppositePoint = CoordinatePoint(x: 15, y: 10)
//// 현재 좌표
//print(yagomPosition) // CoordinatePoint(x: -15, y: -10)


func gugu(_ num: Int) -> [String] {
    (1...9).map { "\($0) * \(num) = \($0 * num)" }
}

print(gugu(3))
