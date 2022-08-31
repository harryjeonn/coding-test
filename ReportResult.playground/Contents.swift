import Foundation
/*
 ## 문제
 
 * 각 유저는 한 번에 한 명의 유저를 신고할 수 있다.
 * 신고 횟수에 제한은 없지만 동일한 유저에 대한 신고는 1회로 처리된다.
 * k번 이상 신고된 유저는 게시판 이용이 정지되고 해당 유절르 신고한 모든 유저에게 정지 사실을 메일로 발송한다.
 * return 하는 배열은 id_list에 담긴 id 순서대로 각 유저가 받은 결과 메일 수
 
 ## 풀이
 
 id마다 신고당한 횟수를 세기위해 id_list를 사용해 Dictionary를 만든다.
 신고한 유저와 신고 당한 유저 분리
 신고할 유저와 신고 당한 유저의 중복체크 후 값 추가
 신고횟수가 k 이상인 유저 찾기
 신고횟수가 k 이상인 유저를 신고한 유저 찾기
 들어온 id 순서대로 메일 받을 횟수 리턴
 
 ## 풀이 후
 
 반복문, 변수가 너무 많다.
 풀이 후 다음사람이 푼 코드와 비교해보니 좀만 더 잘 생각했다면 1번 코드처럼 지저분하지는 않았을 것 같다.
 이번 문제 마무리하기전에 한번 더 보고 다음문제부터는 더 잘 생각해보도록 해야겠다.
 
 */

// MARK: - 1
func solution1(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportUser = [String: [String]]()    // 리폿 한 유저
    var reportedUser = [String: [String]]()  // 리폿 당한 유저
    var sendEmailUser = [String: Int]()
    
    // User Dictionary 생성
    id_list.forEach { id in
        reportUser[id] = []
        reportedUser[id] = []
        sendEmailUser[id] = 0
    }
    
    // 신고할 유저, 신고당하는 유저 분리
    let divisionUser = report.map { $0.components(separatedBy: " ") }
    
    // 신고할 유저, 신고당하는 유저 값 추가
    // 0: 신고할 유저, 1: 신고 당하는 유저
    divisionUser.forEach { aReport in
        if aReport[0] == aReport[1] {
            return
        }
        
        var orgReportUser = reportUser[aReport[0]]!
        orgReportUser.append(aReport[1])
        reportUser.updateValue(orgReportUser, forKey: aReport[0])
        
        var orgReportedUser = reportedUser[aReport[1]]!
        // 중복이 없다면 추가
        if orgReportedUser.contains(where: { $0 == aReport[0] }) == false {
            orgReportedUser.append(aReport[0])
        }
        reportedUser.updateValue(orgReportedUser, forKey: aReport[1])
    }
    
    // k 이상인 유저 찾기
    let blockUsers = reportedUser.filter { $0.value.count >= k }
    
    // 찾은 유저를 신고한 유저 찾기
    blockUsers.forEach { key, users in
        users.forEach { user in
            sendEmailUser.updateValue(sendEmailUser[user]! + 1, forKey: user)
            
        }
    }
    
    var result = [Int]()
    id_list.forEach { id in
        result.append(sendEmailUser[id]!)
    }
    
    return result
}

print(solution1(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))

// MARK: - 2
func solution2(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reported: [String: Int] = [:]
    var user: [String: [String]] = [:]

    for r in Set(report) {
        let splited = r.split(separator: " ").map { String($0) }
        user[splited[0]] = (user[splited[0]] ?? []) + [splited[1]]
        reported[splited[1]] = (reported[splited[1]] ?? 0) + 1
    }

    return id_list.map { id in
        return (user[id] ?? []).reduce(0) {
            $0 + ((reported[$1] ?? 0) >= k ? 1 : 0)
        }
    }
}

print(solution2(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))
