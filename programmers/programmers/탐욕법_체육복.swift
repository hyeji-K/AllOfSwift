//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/07/21.
//

import Foundation

func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    
    var arrLost = Set(lost).subtracting(Set(reserve))
    let arrReserve = Array(Set(reserve).subtracting(Set(lost))).sorted()
    
    for i in arrReserve {
        if arrLost.contains(i - 1) {
            arrLost.remove(i - 1)
        } else if arrLost.contains(i + 1) {
            arrLost.remove(i + 1)
        }
        continue
    }
    
    return n - arrLost.count
}

print(solution(5, [2, 4], [1, 3, 5]))
print(solution(5, [4, 2], [3, 5]))


// 문제를 잘 읽자!
// 학생들의 번호는 체격 순으로 매겨져 있어, 바로 앞번호의 학생이나 바로 뒷번호의 학생에게만 체육복을 빌려줄 수 있습니다
// arrReserve 정렬을 하고 안 하고에 따라 테케 실패 뜸 왜??


// 다른 사람의 풀이
func solution2(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var losted = lost.filter{!reserve.contains($0)}
    var reserved = reserve.filter{!lost.contains($0)}

    var ans = n - losted.count

    for i in 0..<losted.count {
        var has: Int?

        for j in 0..<reserved.count {
            if losted[i] == reserved[j] - 1 || losted[i] == reserved[j] + 1 {
                has = j
                break
            }
        }

        if let index = has {
            reserved.remove(at: index)
            ans += 1
        }
    }

    return ans
}
