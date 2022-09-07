import Foundation

/*
 ## 문제
 
 [나머지가 1이 되는 수 찾기](https://school.programmers.co.kr/learn/courses/30/lessons/87389)
 
 ## 풀이
 
 * 2부터 나누기 시작하여 제일 먼저 나머지가 0이 되는 수 찾기
 
 */

func solution(_ n:Int) -> Int {
    var result = 0
    for i in 2...n {
        if n % i == 1 {
            result = i
            break
        }
    }

    return result
}


print(solution(12))
