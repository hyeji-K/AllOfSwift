import UIKit
import Foundation


// 숫자 n을 입력받았을때 각 자리의 숫자 알아내기
// -> 문자로 바꿔서 map으로 나눈 다음 차례로 더하면 되겠다
let n = 2232
//let stringNum = String(n)
let each = String(n).map { String($0) }
print(each)
type(of: each)
var answer = 0
for i in each {
    // i가 0이면 넘어가기
    // 중복된 숫자는 세지 않음
    if n % Int(i)! == 0 {
        answer += 1
        print(answer)
    } else {
        continue
    }
}


func solution(_ n:Int64) -> Int
{
    var answer = 0
    let stringNumber = String(n).map { String($0) }
    // 중복 제거
    let setArray = Set(stringNumber)
    print(setArray)
    for i in setArray {
        let intNumber = Int64(i)!
//        print(intNumber)
        if intNumber != 0 {
            if n % intNumber == 0 {
//                print("n = \(intNumber)")
                answer += 1
                continue
            }
        } else {
            continue
        }
    }

    return answer
}

solution(254)


// 2번
// 시계방향으로 90도 만큼 회전한다는 것은 행과 열을 바꿔주면 되는 문제
func rotate(_ matrix:  [[Int]], _ r: Int) -> [[Int]] {
    var arrayexam: [[Int]] = []
    let n = matrix.count
    let rotation = r % 4

    for i in 0..<n {
        var temp: [Int] = []

        if rotation == 1 {
            for j in stride(from: n-1, to: -1, by: -1) {
                // from 부터 to까지 by만큼의 보폭으로
                temp.append(matrix[j][i])
                print("\(i) \(j)")
                print(temp)
                
            }
            arrayexam.append(temp)
            
        } else if rotation == 2 {
            for j in stride(from: n-1, to: -1, by: -1) {
                temp.append(matrix[1-i][j])
                print("\(i) \(j)")
                print(temp)
            }
            arrayexam.append(temp)
            
        } else if rotation == 3 {
            for j in stride(from: n-1, to: -1, by: -1) {
                temp.append(matrix[1-j][1-i])
            }
            arrayexam.append(temp)
        }
    }

//    for _ in 0..<(matrix.count / 2) {
//        arrayexam.removeFirst()
//
//    }
    return arrayexam
//
}
//
let r = rotate([[1,2],[3,4]], 2)
////let r = rotate([[4,1,2],[7,3,4],[3,5,6]], 3)
//print(r)


//func rotate(_ matrix:  [[Int]], _ r: Int) -> [[Int]] {
//    let rotation = r % 4
//    var arrayexam: [[Int]] = []
//    let n = matrix.count
//
//    if rotation == 1 {
//        for i in 0..<n {
//            var temp: [Int] = []
//
//            for j in 0..<n {
//                temp.append(matrix[n-1-j][i])
//
//            }
//            arrayexam.append(temp)
//        }
//    } else if rotation == 2 {
//        for i in 0..<n {
//            var temp: [Int] = []
//            for j in 0..<n {
//                temp.append(matrix[n-1-i][j])
//            }
//            arrayexam.append(temp)
//        }
//    } else if rotation == 3 {
//        for i in 0..<n {
//            var temp: [Int] = []
//            for j in 0..<n {
//                temp.append(matrix[j][1-i])
//                print("\(i) \(j)")
//                print(temp)
//            }
//            arrayexam.append(temp)
//        }
//
//    } else {
//        matrix
//    }
//
//    return arrayexam
//}
//
//
//let r = rotate([[1,2],[3,4]], 1)
//let x = rotate([[1,2],[3,4]], 2)
//let k = rotate([[1,2],[3,4]], 3)


//func rotate(_ matrix:  [[Int]], _ r: Int) -> [[Int]] {
//
//    var arrayexam: [[Int]] = []
//    let n = matrix.count
//    let rotation = r % 4
//
//    for i in 0..<n {
//        var temp: [Int] = []
//        switch rotation {
//        case 1:
//            for j in 0..<n {
//                temp.append(matrix[n-1-j][i])
//            }
//            arrayexam.append(temp)
//        case 2:
//            for j in 0..<n {
//                temp.append(matrix[n-1-i][j])
//            }
//            arrayexam.append(temp)
//        case 3:
//            for j in 0..<n {
//                temp.append(matrix[j][1-i])
//            }
//            arrayexam.append(temp)
//        default:
//            matrix
//        }
//    }
//    return arrayexam
//}
//
//    let r = rotate([[1,2],[3,4]], 1)
//    let x = rotate([[1,2],[3,4]], 2)
//    let k = rotate([[1,2],[3,4]], 3)
