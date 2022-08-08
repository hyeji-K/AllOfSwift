//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/08/04.
//

import Foundation

func solution(_ id_list: [String], _ report: [String], _ k: Int) -> [Int] {
    
    var reportSet = Set(report)
    var idListDic: [String: Int] = [:]
    var arr: [Int] = Array()
    
//    for i in id_list {
//        idListDic.updateValue(0, forKey: i)
//    }
    
    id_list.forEach { key in
        idListDic.updateValue(0, forKey: key)
    }
    
    for _ in id_list {
        arr.append(0)
    }
    
    for i in reportSet {
        let value = i.components(separatedBy: " ").map { $0 }
        idListDic[value[1]]! += 1
    }
    
    for (key, value) in idListDic {
        if value >= k {
            for i in reportSet {
                let value = i.components(separatedBy: " ").map { $0 }
                if key == value[1] {
                    let index = id_list.firstIndex(of: value[0])!
                    arr[index] += 1
                }
            }
        }
    }
    
    return arr
}

print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))
print(solution(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3))


// 시간초과.. 다른 사람 풀이 참고
// firstIndex 의 문제인가 싶어서 수정 -> 여전히 시간 초과
func solution2(_ id_list: [String], _ report: [String], _ k: Int) -> [Int] {
    
    var reportSet = Set(report)
    var idListDic: [String: Int] = [:]
    var arr: [Int] = Array(repeating: 0, count: id_list.count)
    var ids: [String: Int] = [:]
    
    id_list.forEach { key in
        idListDic.updateValue(0, forKey: key)
    }
    
    for (index, id) in id_list.enumerated() {
        ids[id] = index
    }
    
    for i in reportSet {
        let value = i.components(separatedBy: " ").map { $0 }
        idListDic[value[1]]! += 1
    }
    
    for (key, value) in idListDic {
        if value >= k {
            for i in reportSet {
                let value = i.components(separatedBy: " ").map { $0 }
                if key == value[1] {
                    let index = ids[value[0]]!
                    arr[index] += 1
                }
            }
        }
    }
    
    return arr
}
