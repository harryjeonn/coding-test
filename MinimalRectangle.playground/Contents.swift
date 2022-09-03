import Foundation

/*
 ## 문제
 
 * 모든 명함이 다 들어가지만 가장 작은 지갑의 크기를 구해라
 * 입출력 예
   * 입력 - [[60, 50], [30, 70], [60, 30], [80, 40]], 출력 - 4000(80x50)
 * 가장 긴 가로 길이와 세로 길이가 각각 80, 70이기 때문에 80(가로) x 70(세로) 크기의 지갑을 만들면 모든 명함들을 수납할 수 있습니다. 하지만 2번 명함을 가로로 눕혀 수납한다면 80(가로) x 50(세로) 크기의 지갑으로 모든 명함들을 수납할 수 있습니다. 이때의 지갑 크기는 4000(=80 x 50)입니다.
 
 ## 풀이
 
 * 가장 큰 수를 구한다. 가로든 세로든 가장 큰 길이는 무조건 필요하다.
 * 가장 큰 길이를 제외하고 모든 명함이 들어갈 수 있는 길이를 구한다.
   * 가로/세로 확인하여 숫자가 큰 쪽을 큰 수에 놓고 명함이 들어가는지 확인하면 될 것 같다.
 * 두개를 곱한다.
 
 ## 풀이 후
 쉬운 문제인 것 같다 생각하면서 되게 간단하게 풀었다고 생각했는데 풀고나서 보니 더 짧은 풀이가 있었다.
 코드가 짧다고 무조건 좋은건 아니지만 길이뿐만 아니라 가독성도 더 좋은 것 같았다.
 이렇게 또 배운다..
 
 */

// MARK: - 1
func solution(_ sizes:[[Int]]) -> Int {
    let walletMaxSize = sizes.map { $0.max()! }.max()!
    var walletMinSize = sizes.map { $0.min()! }.min()!
    
    sizes.forEach { size in
        let minSize = size.min()!
        
        if minSize > walletMinSize {
           walletMinSize = minSize
        }
    }
    
    return walletMaxSize * walletMinSize
}

print(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))

// MARK: - 2
func solution2(_ sizes:[[Int]]) -> Int {
    var maxNum = 0
    var minNum = 0

    for size in sizes {
        maxNum = max(maxNum, size.max()!)
        minNum = max(minNum, size.min()!)
    }
    return maxNum * minNum
}

print(solution2([[60, 50], [30, 70], [60, 30], [80, 40]]))
