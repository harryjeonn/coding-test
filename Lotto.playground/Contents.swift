/*
 ## 문제
 
 [로또의 최고 순위와 최저 순위](https://school.programmers.co.kr/learn/courses/30/lessons/77484?language=swift)
 
 ## 풀이
 
 * 로또랑 당첨번호랑 다른 숫자들을 찾는다.
 * 다른 숫자들 중 0을 찾는다.
 * 0에 다른 번호들을 넣고 등수를 체크한다. (중복없이)
 
 ## 풀이 후
 
 인상 깊은 풀이가 있었다. filter를 사용하여 간결하게 문제를 해결했다.
 문제해결방법에 대한 접근도 나와는 많이 달랐고 멋진 풀이라고 생각해서 깜짝 놀랐다.
*/

import Foundation

// MARK: - First
func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var bestLottos = [Int]()
    
    lottos.forEach { lotto in
        if lotto == 0 {
            let bestLotto = win_nums.first(where: { num in
                !bestLottos.contains(num) && !lottos.contains(num)
            })!
            bestLottos.append(bestLotto)
        } else {
            bestLottos.append(lotto)
        }
    }
    
    func getRank(_ lottos: [Int]) -> Int {
        var rank = 0
        lottos.forEach { lotto in
            win_nums.forEach { num in
                if lotto == num {
                    rank += 1
                }
            }
        }
        
        return rank < 2 ? 6 : abs(rank - 7)
    }
    
    return [getRank(bestLottos), getRank(lottos)]
}

// MARK: - Best
func bestSolution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    
    // 0의 갯수를 구한다.
    let zeroCount = lottos.filter { $0 == 0 }.count
    
    // 당첨번호와 로또번호가 같은 갯수를 구한다.
    let winCount: Int = win_nums.filter { lottos.contains($0) }.count
    
    // 7 - winCount - zeroCount
    // 총 7개 번호 중 맞춘 번호, 0 제외하면 등수가 나온다.
    return [min(7-winCount-zeroCount,6), min(7-winCount,6)]
}
