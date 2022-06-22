//
//  main.swift
//  programmers
//
//  Created by heyji on 2022/06/21.
//

import Foundation

/*
 자연수가 들어있는 배열 arr가 매개변수로 주어집니다. 배열 arr안의 숫자들 중에서 앞에 있는 숫자들부터 뒤에 중복되어 나타나는 숫자들 중복 횟수를 계산해서 배열로 return 하도록 solution 함수를 완성해주세요. 만약 중복되는 숫자가 없다면 배열에 -1을 채워서 return 하세요.

  

 ▶입출력 예 #1

 arr = [1, 2, 3, 3, 3, 3, 4, 4]에서 3은 4번, 4는 2번씩 나타나므로 [4, 2]를 반환합니다.

  

 ▶입출력 예 #2

 arr = [3, 2, 4, 4, 2, 5, 2, 5, 5]이면 2가 3회, 4가 2회, 5가 3회 나타나므로 [3, 2, 3]를 반환합니다.

  

 ▶입출력 예 #3

 [3, 5, 7, 9, 1]에서 중복해서 나타나는 숫자는 없으므로 [-1]을 반환합니다.

  

 ##### 제한사항

 - 배열 arr의 길이는 1 이상 100 이하의 자연수입니다.

 - 배열 arr의 원소는 1 이상 100 이하의 자연수입니다.
 */


func solution(_ arr: [Int]) -> [Int] {
    let arrS = arr.sorted()
    let arrSet = Set(arrS).sorted()
    var num: Int = 0
    var result: [Int] = []
    
    if arrS.count != arrSet.count {
        for i in arrSet {
            for j in 0..<arrS.count {
                if arrS[j] == i {
                    num += 1
                } else {
                    continue
                }
            }
            if num > 1 {
                result.append(num)
                num = 0
            }
            num = 0
        }
        return result
    }
    return [-1]
}

print(solution([3, 2, 4, 4, 2, 5, 2, 5, 5]))
print(solution([1, 2, 3, 3, 3, 3, 4, 4]))
print(solution([3, 5, 7, 9, 1]))



/* 해설1
문제 해결하는 solution() 함수에서 입력으로 주어지는 배열을 처음부터 탐색하면서 countOf()를 호출하는 방식입니다.

<가> 배열에서 특정한 숫자의 중복 횟수를 계산하는 countOf()라는 하위 함수를 선언합니다.

<나> 이미 중복을 계산한 숫자는 제외하기 위해서 Set에 넣어주고 포함 여부를 확인합니다.

<다> 주어진 조건에 맞춰서 중복 횟수가 1을 초과하는 경우만 출력할 배열에 추가합니다.

<라> 마지막 부분에서는 빈 배열인 경우에 -1을 추가합니다.
*/

func countOf(array: [Int], value: Int) -> Int { //---가
    return array.filter{ $0 == value }.count
}

func solution1(array: [Int]) -> [Int] {
    var answer = [Int]()
    var set = Set<Int>()
    array.forEach { element in
        guard !set.contains(element) else { return } //---나
        set.insert(element)
        let count = countOf(array: array, value: element)
        if count > 1 { //---다
            answer.append(count)
        }
    }
    if answer.count == 0 { //---라
        answer.append(-1)
    }
    return answer
}

/* 해설2
 countOf()라는 함수를 선언하는 대신에 스위프트 Dictionary 타입을 활용해서 중복 횟수를 저장한다는 점이 다릅니다.

 <가> Dictionary는 값만 순서대로 보관하는 배열과 다르게 (다른 언어의 Map처럼) 특정한 키에 대한 값을 보관하는 방식입니다.

 이전에 키값을 지정한 적이 있는지 확인해서 있으면 중복 횟수를 +1 해서 다시 저장합니다.

 <나> 만약 한 번도 나오지 않아서 Map에 없는 키라면, 중복 횟수를 1로 저장합니다.

 자바스크립트와 차이점은 여기에서 find라는 배열을 사용한다는 것입니다. 스위프트 Dictionary는 순서를 보장하지 않습니다.

 그래서 중복 횟수를 배열 순서대로 저장하기 위해서 find 배열이 필요합니다.

 <다> 이렇게 만들어진 find 배열을 이용해서, map에서 중복 횟수 값이 1을 초과하는 경우만 결과 배열에 추가합니다.

 <라> 마지막 부분에서는 빈 배열인 경우에 -1을 추가합니다.
 */

func solution2(array: [Int]) -> [Int] {
    var find = [Int]()
    var map = Dictionary<Int, Int>()
    array.forEach { element in
        if let value = map[element] { //---가
            map[element] = value + 1
        }
        else { //---나
            map[element] = 1
            find.append(element)
        }
    }
    
    var answer : [Int] = find.compactMap { element in
        let count = map[element] ?? 0
        return count > 1 ? count : nil
    }
    if answer.count == 0 {
        answer.append(-1)
    }
    return answer
}


let numberWords = ["one", "two", "three"]
numberWords.forEach { word in
    print(word)
}
