
// Two Sum
// 문제에서 주어진 조건에 반드시 답은 하나라는 조건이 있기 때문에 저는 그냥 완전 탐색으

//class Solution {
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var result: [Int] = []
//        for i in 0..<nums.count {
//            if nums[i] + nums[i+1] == target {
//                result.append(i)
//                result.append(i+1)
//                return result
//            } else {
//                continue
//            }
//        }
//        return result
//    }
//}

// 순회하면서 수를 하나 집고 (first), 그 수 및 지나온 수들을 제외한 수에서 또 하나 집은 다음 (second)
// 두 수의 합이 target과 일치하면 index를 배열로 만들어서 리턴하면 끝.

//class Solution2 {
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        var result: [Int] = []
//        for i in 0..<nums.count {
//            let first = nums[i]
//            for j in i+1..<nums.count {
//                let second = nums[j]
//                if first + second == target {
//                    result.append(i)
//                    result.append(j)
//                    return result
//                } else {
//                    continue
//                }
//            }
//        }
//        return result
//    }
//}
//
//let solution = Solution2()
//solution.twoSum([3,2,3], 6)


class Solution3 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int] = []
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    result = [i, j]
                    return result
                }
            }
        }
        return result
    }
}

let sol = Solution3()
sol.twoSum([2,3,3], 6)



class Solution {
    func romanToInt(_ s: String) -> Int {
        switch s {
        case "I":
            return 1
        case "V":
            return 5
        case "X":
            return 10
        case "L":
            return 50
        case "C":
            return 100
        case "D":
            return 500
        case "M":
            return 1000
            
        default:
            return 0
        }
        
    }
}
