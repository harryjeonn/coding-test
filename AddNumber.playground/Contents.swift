import Foundation

/*
 ## 문제
 
 [없는 숫자 더하기](https://school.programmers.co.kr/learn/courses/30/lessons/86051)
 
 ## 풀이
 
 * 0~9 까지 중 numbers에 포함되지 않은 숫자를 찾는다
 * 찾은 숫자를 모두 더한다
 
 ## 풀이 후
 
 비슷하지만 코드가 간결한 사람도 있고, 이런 방법이! 하는 사람도 있었다.
 코딩테스트 풀이를 하면서 느끼는 거지만 같은 코드라도 여러 방식이 있고, 같은 문제라도 여러 해결방법이 있는 것 같다.
 
 */

// MARK: - 1
func solution(_ numbers:[Int]) -> Int {
    return [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        .filter { !numbers.contains($0) }
        .reduce(0, { $0 + $1 })
}

// MARK: - 2
func solution2(_ numbers: [Int]) -> Int {
    return (0...9).filter { !numbers.contains($0) }.reduce(0, +)
}

// MARK: - 3
func solution3(_ numbers:[Int]) -> Int {
    return 45-numbers.reduce(0, +)
}
