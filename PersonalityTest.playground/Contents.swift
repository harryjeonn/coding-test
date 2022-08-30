import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var total: [String: Int] = ["R": 0, "T": 0, "F": 0, "C": 0, "M": 0, "J": 0, "A": 0, "N": 0]
    
    choices.enumerated().forEach { index, choice in
        guard let firstChar = survey[index].first,
              let lastChar = survey[index].last else { return }
        
        if choice == 4 {
            return
        }
        
        var type: String = ""
        
        choice >= 5 ? type.append(String(lastChar)) : type.append(String(firstChar))
        
        let orgValue = total[type] ?? 0
        let newValue = orgValue + abs(choice - 4)
        total.updateValue(newValue, forKey: type)
    }
    
    return getResult(total)
}

func getResult(_ total: [String: Int]) -> String {
    var result = ""
    
    total["R"]! >= total["T"]! ? result.append("R") : result.append("T")
    total["C"]! >= total["F"]! ? result.append("C") : result.append("F")
    total["J"]! >= total["M"]! ? result.append("J") : result.append("M")
    total["A"]! >= total["N"]! ? result.append("A") : result.append("N")
    
    return result
}

print(solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]))
