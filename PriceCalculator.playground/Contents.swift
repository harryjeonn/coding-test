/*
 ## 문제
 
 [부족한 금액 계산하기](https://school.programmers.co.kr/learn/courses/30/lessons/82612)
 
 ## 풀이
 
 * count 만큼 이용하려면 필요한 돈을 계산
 * 필요한 돈 - 가지고 있는 돈(money)
 * 모자르지 않다면 0을 return
 
 ## 풀이 후
 
 이 문제는 총 금액만 계산하면 술술 풀리는 문제인 것 같다.
 나는 단순히 for문을 사용하여 총 금액을 계산했다.
 문제 제출 후 보니 총 금액을 구하기 위한 좀 더 스마트한 방법이 있었다.
 
 */

import Foundation

// MARK: - 1
func solution1(_ price:Int, _ money:Int, _ count:Int) -> Int64 {
    var sum = 0
    
    for i in 1...count {
        sum += i * price
    }
    
    let answer = sum - money
    
    return answer < 0 ? 0 : Int64(answer)
}

// MARK: - 2
func solution2(_ price:Int, _ money:Int, _ count:Int) -> Int{
    return max((count + 1) * count / 2 * price - money , 0)
}
